// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:memories2/widgets/edit_image_viewmodel.dart';
import 'package:screenshot/screenshot.dart';

import '../widgets/custom_battom_navigationbar.dart';
import '../widgets/image_text.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({Key? key, required this.selectedImage})
      : super(key: key);
  final String selectedImage;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Screenshot(
        controller: screenshotController,
        child: Scaffold(
          appBar: _appBar,
          body: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Column(
                children: [
                  _selectedImage,
                  Container(
                    color: Colors.black,
                    child: Center(
                      child: RatingBar.builder(
                        glowColor: Colors.black,
                        initialRating: 3,
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color.fromRGBO(57, 255, 20, 1),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      child: const TextField(
                        cursorColor: Color.fromRGBO(57, 255, 20, 1),
                        maxLines: 3,
                        cursorHeight: 22,
                        cursorWidth: 4,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit,
                              color: Color.fromRGBO(57, 255, 20, 1),
                            ),
                            filled: true,
                            hintText: "Tags...",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(57, 255, 20, 0.2))),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.black,
                      child: const TextField(
                        cursorColor: Color.fromRGBO(57, 255, 20, 1),
                        maxLines: 17,
                        cursorHeight: 22,
                        cursorWidth: 4,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit,
                              color: Color.fromRGBO(57, 255, 20, 1),
                            ),
                            filled: true,
                            hintText: "Hakkında Yorumlarım...",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(57, 255, 20, 0.2))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: _addNewTextFab,
        ),
      ),
    );
  }

  Widget get _selectedImage => Container(
        child: Image.file(
          File(widget.selectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      );

  Widget get _addNewTextFab => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: "Yeni Metin Ekle",
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );
  AppBar get _appBar => AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: SizedBox(
          height: 70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                color: Colors.black,
                child: const Center(
                    child: Text(
                  "ZARAKİ KEMPACHi",
                  style: TextStyle(
                      color: Color.fromRGBO(57, 255, 20, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
            ],
          ),
        ),
      );
}
