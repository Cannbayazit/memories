import 'package:flutter/material.dart';

class CustomBattomBar extends StatelessWidget {
  const CustomBattomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            tooltip: "Resmi Kaydet",
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            tooltip: "Yazı Boyutunu Büyült",
          )
        ],
      ),
    );
  }
}
