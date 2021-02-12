import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceDialog extends StatelessWidget {
  ImageSourceDialog(this.onImageSelected, this.controller);
  final controller;
  final Function(File) onImageSelected;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            onPressed: getFromcamera,
            child: const Text("Câmera"),
          ),
          FlatButton(
            onPressed: getFromGallery,
            child: const Text("Galeria"),
          ),
        ],
      ),
    );
  }

  Future<void> getFromcamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    imageSelected(File(pickedFile.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar Imagen',
          toolbarColor: Color.fromRGBO(0, 74, 173, 1),
          toolbarWidgetColor: Colors.white,
        ));
    if (croppedFile != null) onImageSelected(croppedFile);
  }
}
