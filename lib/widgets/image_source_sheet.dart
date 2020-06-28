import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {

  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  void imageSelected(File image) async {
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(
          ratioX: 1.0,
          ratioY: 1.0,
        ),
      );
      onImageSelected(croppedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();

    return BottomSheet(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Text('Câmera'),
            onPressed: () async {
              PickedFile file =
                  await picker.getImage(source: ImageSource.camera);
              File image = File(file.path);
              imageSelected(image);
            },
          ),
          FlatButton(
            child: Text('Galeria'),
            onPressed: () async {
              PickedFile file =
                  await picker.getImage(source: ImageSource.gallery);
              File image = File(file.path);
              imageSelected(image);
            },
          ),
        ],
      ),
      onClosing: () {},
    );
  }
}
