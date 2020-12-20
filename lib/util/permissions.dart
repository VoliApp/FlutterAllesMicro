import 'package:flutter/material.dart';
import 'package:voli/util/alertDialogs.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> askForStoragePermission(BuildContext context) async {
  var status = await Permission.storage.status;

  if (status.isGranted) {
    return true;
  } else {
    var dialog = CustomDialog(
        context: context,
        icon: Icon(Icons.storage),
        title: 'Storage permission',
        body:
            'To save this to your gallery, the app needs the storage permission',
        actions: ['Continue', 'Cancel']);
    int buttonTapped = await dialog.show();
    if (buttonTapped == 0) {
      if (status == PermissionStatus.undetermined) {
        await Permission.storage.request();
      } else if (status == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }
      if (await Permission.storage.isGranted)
        return true;
      else
        return false;
    } else {
      return false;
    }
  }
}
