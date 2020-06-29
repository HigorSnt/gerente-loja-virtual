import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerentelojavirtual/blocs/categories_bloc.dart';
import 'package:gerentelojavirtual/widgets/image_source_sheet.dart';

class EditCategoryDialog extends StatefulWidget {
  final DocumentSnapshot category;

  EditCategoryDialog({this.category});

  @override
  _EditCategoryDialogState createState() =>
      _EditCategoryDialogState(category: category);
}

class _EditCategoryDialogState extends State<EditCategoryDialog> {
  final CategoriesBloc _categoriesBloc;
  final TextEditingController _controller;

  _EditCategoryDialogState({DocumentSnapshot category})
      : _categoriesBloc = CategoriesBloc(category),
        _controller = TextEditingController(
          text: category != null ? category.data['title'] : '',
        );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ImageSourceSheet(
                      onImageSelected: (image) {
                        Navigator.of(context).pop();
                        _categoriesBloc.setImage(image);
                      },
                    ),
                  );
                },
                child: StreamBuilder(
                  stream: _categoriesBloc.outImage,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: snapshot.data is File
                            ? Image.file(
                                snapshot.data,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                snapshot.data,
                                fit: BoxFit.cover,
                              ),
                      );
                    } else {
                      return Icon(Icons.image);
                    }
                  },
                ),
              ),
              title: StreamBuilder<String>(
                stream: _categoriesBloc.outTitle,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _controller,
                    onChanged: _categoriesBloc.setTitle,
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StreamBuilder<bool>(
                  stream: _categoriesBloc.outDelete,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();

                    return FlatButton(
                      onPressed: snapshot.data ? () {
                        _categoriesBloc.delete();
                        Navigator.of(context).pop();
                      } : null,
                      child: Text('Excluir'),
                      textColor: Colors.red,
                    );
                  },
                ),
                StreamBuilder<bool>(
                    stream: _categoriesBloc.submitValid,
                    builder: (context, snapshot) {
                      return FlatButton(
                        onPressed: snapshot.hasData ? () async {
                          await _categoriesBloc.saveData();
                          Navigator.of(context).pop();
                        } : null,
                        child: Text('Salvar'),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
