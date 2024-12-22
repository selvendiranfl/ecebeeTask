

import 'dart:io';
import 'dart:math';

import 'package:ecebee/helper/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../allimports.dart';
import 'Colors.dart';
import 'navigatorService.dart';

class Utilities{


  static String loginTime = "";
  static String verficationid = "";
  static String ipAddress = "";
  static String latitude = "";
  static String longitude = "";
  static int generateRandomFiveDigitNumber() {
    final random = Random();
    return random.nextInt(90000) + 10000;
  }

  static String convertTo12HourFormat(String dateTimeString) {
    try {
      DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(dateTimeString);
      return DateFormat.jm().format(dateTime); // Format as 'hh:mm a' (e.g., '8:26 PM')
    } catch (e) {
      print("Invalid datetime format: $dateTimeString");
      return "";
    }
  }

  static showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: topicColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future<String> GetIPaddress() async {
    String ipAddress = 'Unknown';
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4) {
            ipAddress = addr.address;
          }
        }
      }
      print(ipAddress);
    } catch (e) {
      print('Failed to get IP address: $e');
      return ipAddress = '0.0.0.0';
    }
    return ipAddress;
  }

  static showProgress() {

    showDialog(
      barrierDismissible: false,
      context: NavigationService.navigatorKey.currentContext!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false; // Disable back button dismiss
          },
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            content: Center(
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 8,
                width: SizeConfig.blockSizeVertical! * 8,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static dismissProgress() {
    if (Navigator.canPop(NavigationService.navigatorKey.currentContext!)) {
      Navigator.pop(NavigationService.navigatorKey.currentContext!);
    }
  }

}
