

import 'dart:io';
import 'dart:math';

import 'package:ecebee/helper/size_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../allimports.dart';
import 'Colors.dart';
import 'navigatorService.dart';

class Utilities{


  static String loginTime = "";
  static String verficationid = "";
  static String ipAddress = "";
  static String location = "";
  static String phone_number = "";
  static int generateRandomFiveDigitNumber() {
    final random = Random();
    return random.nextInt(90000) + 10000;
  }


  static String convertTo12HourFormat(String dateTimeString) {
    try {
      // Parse the string as-is without converting to local or UTC
      DateTime dateTime = DateTime.parse(dateTimeString);

      // Format the DateTime object to the desired format
      String formattedTime = DateFormat('h:mm a').format(dateTime);
      return formattedTime; // Format as 'hh:mm a' (e.g., '7:43 PM')
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
  static showProgress(String status) {
    EasyLoading.show(status: status);
    // showDialog(
    //   barrierDismissible: false,
    //   context: NavigationService.navigatorKey.currentContext!,
    //   builder: (context) {
    //     return WillPopScope(
    //       onWillPop: () async {
    //         return false; // Disable back button dismiss
    //       },
    //       child: AlertDialog(
    //         insetPadding: const EdgeInsets.all(15.0),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(12),
    //         ),
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //         contentPadding: EdgeInsets.zero,
    //         content: Center(
    //           child: SizedBox(
    //             height: SizeConfig.blockSizeVertical! * 8,
    //             width: SizeConfig.blockSizeVertical! * 8,
    //             child: CircularProgressIndicator(
    //               color: Colors.white,
    //               strokeWidth: 3,
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  static dismissProgress() {
    EasyLoading.dismiss();
    // if (Navigator.canPop(rootNavigatorKey.currentContext!)) {
    //   Navigator.pop(rootNavigatorKey.currentContext!);
    // }

  }

}

class ConstantVariableClass {
  static String noResultString = 'Not added';

  static String loadingString = 'Loading';

  static String seatload = 'Fetching Seat';


  static bool dashboardScreenBoolean = false;

  var familyHeadScrollBoolean = ValueNotifier<bool>(true);
}
