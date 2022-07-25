import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 50,
                    child: Center(child: Text("ZARAKİ KEMPACHi")),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image(
                        image: NetworkImage(
                            "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
