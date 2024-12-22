
import 'package:ecebee/allimports.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {

  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String verificationid = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) async {
      if(event is LoginEvent){
        Utilities.showProgress();
        await _auth.verifyPhoneNumber(
          phoneNumber: "+91${numberController.text.trim()}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            Utilities.dismissProgress();
            Utilities.showToast( "Phone number automatically verified!");

          },
          verificationFailed: (FirebaseAuthException e) {
            Utilities.dismissProgress();
            Utilities.showToast( "Verification failed: ${e.message}");
            print(e.message);
          },
          codeSent: (String verificationId, int? resendToken) {
            Utilities.dismissProgress();
            verificationid = verificationId;
            add(OtpVerifyEvent());
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            Utilities.dismissProgress();
            verificationid= verificationId;
          },
        );
      }

      if(event is OtpVerifyEvent){
        Utilities.showProgress();
        try {
          // Create credential and sign in
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationid,
            smsCode: otpController.text.trim(),
          );
          await _auth.signInWithCredential(credential);
          Utilities.dismissProgress();
          Utilities.showToast( "Phone number verified successfully!");
          emit(OtpVerifiedState());
        } catch (e) {
          Utilities.dismissProgress();
          Utilities.showToast( "Invalid OTP: ${e.toString()}");
          emit(OtpfailedState());
        }
      }




    });
  }
}
