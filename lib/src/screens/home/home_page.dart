import 'package:cloud_crm/src/components/notifications_icon_widget.dart';
import 'package:cloud_crm/src/controllers/home/home_page_controller.dart';
import 'package:cloud_crm/src/controllers/login/auth_controller.dart';
import 'package:cloud_crm/src/screens/form/form_list.dart';
import 'package:cloud_crm/src/screens/home/drawer_menu.dart';
import 'package:cloud_crm/src/utils/get_color_or_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageController = GetIt.I.get<HomePageController>();
  final authController = GetIt.I.get<AuthController>();

  @override
  void initState() {
    homePageController.renderHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: getCompanyColorOrDefault(),
          title: Text(homePageController.title),
          leading: homePageController.listFormModels.length > 0
              ? IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              homePageController.removeLastFormModel();
              homePageController.renderHomePage();
            },
          )
              : null,
          actions: <Widget>[
            homePageController.listFormModels.length == 0
                ? NotificationsIconWidget(
                homePageController: homePageController)
                : Column(),
          ],
        ),
        body: WillPopScope(
            onWillPop: () async {
              if (homePageController.listFormModels.length > 0) {
                homePageController.removeLastFormModel();
                homePageController.renderHomePage();
              }
              return false;
            },
            child: FormList(homePageController: homePageController)),
        drawer:
        homePageController.listFormModels.length > 0 ? null : DrawerMenu(),
      );
    });
  }
}