import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:memories2/models/text_info.dart';
import 'package:memories2/screens/edit_image_screen.dart';
import 'package:memories2/utils/utils.dart';
import 'package:memories2/widgets/default_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  List<TextInfo> texts = [];
  int currentIndex = 0;

  saveToGallery(BuildContext context) {
    if (texts.isEmpty) {
      screenshotController.capture().then(
        (Uint8List? image) {
          saveImage(image!);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Resim Galeriye Kaydedildi"),
            ),
          );
        },
      ).catchError((err) => print(err));
    }
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll(".", "-")
        .replaceAll(":", "-");
    final name = "screenshot_$time";
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Silindi",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Düzenlenecek Metin Seçildi",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  alignLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  alignRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  boldText() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.normal;
      } else {
        texts[currentIndex].fontWeight = FontWeight.bold;
      }
    });
  }

  italicText() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.normal;
      } else {
        texts[currentIndex].fontStyle = FontStyle.italic;
      }
    });
  }

  addLinesToText() {
    setState(() {
      if (texts[currentIndex].text.contains("\n")) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll("\n", " ");
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(" ", "\n");
      }
    });
  }

  addNewText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          color: Colors.black,
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          left: 0,
          text: textEditingController.text,
          textAlign: TextAlign.left,
          top: 0,
        ),
      );
      Navigator.of(context).pop();
    });
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Yeni Metin Ekle",
        ),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.edit),
              filled: true,
              hintText: "Buraya yazılacak.."),
        ),
        actions: <Widget>[
          DefaultButton(
            child: const Text("Geri"),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
            textColor: Colors.white,
          ),
          DefaultButton(
            child: const Text("Yazı Ekle"),
            color: Colors.red,
            onPressed: () => addNewText(context),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
