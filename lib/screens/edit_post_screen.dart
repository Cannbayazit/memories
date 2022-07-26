import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:memories2/widgets/custom_battom_navigationbar.dart';

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView(
                      children: [
                        Container(
                          color: Colors.black,
                          height: 50,
                          child: const Center(
                              child: Text(
                            "ZARAKİ KEMPACHi",
                            style: TextStyle(
                                color: Color.fromRGBO(57, 255, 20, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ),
                        Container(
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const Image(
                              image: NetworkImage(
                                  "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg")),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.black12,
                    child: Column(
                      children: [
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
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
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
                            child: TextField(
                              cursorColor: Color.fromRGBO(57, 255, 20, 1),
                              maxLines: 1,
                              cursorHeight: 22,
                              cursorWidth: 4,
                              decoration: const InputDecoration(
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
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.black,
                      child: TextField(
                        cursorColor: Color.fromRGBO(57, 255, 20, 1),
                        maxLines: 15,
                        cursorHeight: 22,
                        cursorWidth: 4,
                        decoration: const InputDecoration(
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
                  CustomBattomBar(),
                ],
              ),
            )),
      ),
    );
  }
}
