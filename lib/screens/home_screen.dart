import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memories2/screens/edit_image_screen.dart';
import 'package:memories2/screens/edit_post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Container(
            child: IconButton(
              icon: Icon(Icons.upload_file),
              onPressed: () async {
                XFile? file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (file != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EditImageScreen(selectedImage: file.path),
                    ),
                  );
                }
              },
            ),
          ),
          centerTitle: true,
          title: const Text("MEMORIES"),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      height: 20,
                      child: Text(
                        'ZARAKİ KEMPACHİ',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Image(
                          image: NetworkImage(
                              "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      height: 20,
                      child: Text(
                        'ZARAKİ KEMPACHİ',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Image(
                          image: NetworkImage(
                              "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      height: 20,
                      child: Text(
                        'ZARAKİ KEMPACHİ',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Image(
                          image: NetworkImage(
                              "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      height: 20,
                      child: Text(
                        'ZARAKİ KEMPACHİ',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Image(
                          image: NetworkImage(
                              "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      height: 20,
                      child: Text(
                        'ZARAKİ KEMPACHİ',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Image(
                          image: NetworkImage(
                              "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      height: 20,
                      child: Text(
                        'ZARAKİ KEMPACHİ',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditPostScreen()));
                      },
                      child: Image(
                          image: NetworkImage(
                              "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
