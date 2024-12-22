

import 'package:firebase_auth/firebase_auth.dart';

import 'helper/Utilities.dart';

class FirebaseAuthentication {


VerifyPhoneNumber(String number) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$number",
      verificationCompleted: (PhoneAuthCredential credential){},
      verificationFailed: (FirebaseException e){
        Utilities.showToast(e.toString());
        print(e);
      },
      codeSent: (String verificationID,int? resendToken){
        Utilities.verficationid = verificationID;
      },
      codeAutoRetrievalTimeout: (String verificationID){}
  );
  }
  catch (e) {
    print('Failed to verify $e');
    return null;
  }
}

veryfyOTP(String verificationid, String){}



}