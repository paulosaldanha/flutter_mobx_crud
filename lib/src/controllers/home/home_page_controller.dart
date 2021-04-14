import 'dart:convert';

import 'package:cloud_crm/src/api/api.dart';
import 'package:cloud_crm/src/external_services/custombutton_external.dart';
import 'package:cloud_crm/src/external_services/forms_external.dart';
import 'package:cloud_crm/src/external_services/entries_external.dart';
import 'package:cloud_crm/src/models/dynamic_form.dart';
import 'package:cloud_crm/src/models/entry.dart';
import 'package:cloud_crm/src/models/form_model/form_model.dart';
import 'package:cloud_crm/src/services/custom_button_service.dart';
import 'package:cloud_crm/src/services/dynamic_form_service.dart';
import 'package:cloud_crm/src/services/entries_service.dart';
import 'package:cloud_crm/src/services/service.dart';
import 'package:cloud_crm/src/utils/get_color_or_default.dart';
import 'package:mobx/mobx.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageController with _$HomePageController;

abstract class _HomePageController with Store {
  final serviceForms = new DynamicFormService();
  final serviceCustomButton = new CustomButtonService();
  final serviceEntries = new EntriesService();
  final formExternalService = FormsExternal(Api());
  final entriesExternalService = EntriesExternal(Api());
  final customButtonExternalService = CustomButtonExternal(Api());
  final service = Service();

  @observable
  String formId;

  @observable
  String title;

  @observable
  String filter = '';

  bool isFirstLoadData = true;

  bool isLoadingDataFromChildForm = false;

  @observable
  ObservableList<DynamicForm> listForms = new ObservableList<DynamicForm>();

  @observable
  ObservableList<FormModel> listFormModels = new ObservableList<FormModel>();

  @observable
  FormModel lastPosition = new FormModel();

  @observable
  bool finishedLoading = false;

  @observable
  int contNotification = 0;

  @action
  void setformId(String value) => formId = value;

  @action
  setFilter(String value) => filter = value;

  @action
  setFormModel(FormModel value) => listFormModels.add(value);

  @action
  removeLastFormModel() => listFormModels.removeLast();

  @computed
  List<DynamicForm> get listFiltered {
    if (filter.isEmpty) {
      return listForms;
    } else {
      return listForms
          .where((item) => item.getFormTitle().contains(filter.toLowerCase()))
          .toList();
    }
  }

  void renderHomePage() {
    if (listFormModels.length > 0) {
      lastPosition = listFormModels.last;
      title = lastPosition.nameForm;
      setformId(lastPosition.formId);
    } else {
      title = getCompanyName();
      setformId(null);
    }
    if (isFirstLoadData || isLoadingDataFromChildForm) {
      loadData(reload: false);
    }
  }

  loadData({bool reload = false}) async {
    finishedLoading = false;
    if (reload) {
      await serviceEntries.sendEntriesToAPI();
      await _deleteAll();
    }
    await _loadCustomButton(reload: reload);
    await _loadForms(reload: reload).then((value) async {
      await _loadEntries(reload: reload, forms: value);
    });
    contNotification = await serviceEntries.getTotalToSyncronized();
    finishedLoading = true;
  }

  Future<void> _deleteAll() async {
    List<String> tabelas = [
      "forms",
      "entry",
      "customButton",
      "foreignOnline",
    ];
    for (var i = 0; i < tabelas.length; i++) {
      await service.deleteAll(tabelas[i]);
    }
  }

  void _populateForm(forms, list) {
    forms.forEach((f) {
      var form = DynamicForm();
      form.fromFormModel(f);
      form.setChildren(
          forms.where((x) => x.group == form.getFormId()).toList());
      list.add(form);
    });
  }

  Future<List<DynamicForm>> _loadForms({bool reload = false}) async {
    listForms.clear();
    var list = new ObservableList<DynamicForm>();
    if (reload) {
      //online
      final forms = await formExternalService.findAll();
      _populateForm(forms, list);
      await serviceForms.addAllForms(list.toList());
    } else {
      //offline
      list = ObservableList<DynamicForm>.of(await serviceForms.getListForm());
      List<FormModel> forms = [];
      list.forEach((item) {
        final form =
        FormModel.fromJson(jsonDecode(item.dados.replaceAll("\\\"", "\"")));
        forms.add(form);
      });
      list = new ObservableList<DynamicForm>();

      _populateForm(forms, list);
    }
    listForms = ObservableList<DynamicForm>.of(list.where((item) {
      return item.getFormModel().group == (formId ?? "0");
    }).toList());
    listForms.sort((a, b) {
      var aAux = jsonDecode(a.dados);
      var bAux = jsonDecode(b.dados);
      return aAux['nameForm'].compareTo(bAux['nameForm']);
    });
    return list;
  }

  Future _loadCustomButton({bool reload = false}) async {
    if (reload) {
      final listCustomButton = await customButtonExternalService.findAll();
      await serviceCustomButton.addAllCustomButton(listCustomButton);
    }
  }

  Future _loadEntries({bool reload = false, List<DynamicForm> forms}) async {
    if (reload) {
      List<List<Entry>> entriesList = [];
      List<bool> listFinishedLoading = [];
      for (int i = 0; i < forms.length; i++) {
        // String id = forms[i].getFormModel().formId;
        var formEntries = await entriesExternalService
            .findAllByFormModel(forms[i].getFormModel());
        if (formEntries.length > 0) {
          entriesList.add(formEntries);
        }
      }
      await serviceEntries.addAllEntries(entriesList);
      listFinishedLoading.add(true);
    }
  }
}