import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
  }
  return false;
}

Row get _row => Row(
      children: [
        Text("ZARAKI KEMPACHI"),
        Image(
          image: NetworkImage(
              "https://static.zerochan.net/Zaraki.Kenpachi.full.62546.jpg"),
        )
      ],
    );
