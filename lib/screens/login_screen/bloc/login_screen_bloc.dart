
import 'package:ecebee/allimports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';

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
        Utilities.showProgress("Verifying Number");
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
        Utilities.showProgress("Verifying OTP");
        try {
          // Create credential and sign in
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationid,
            smsCode: otpController.text.trim(),
          );
          await _auth.signInWithCredential(credential);
          Utilities.dismissProgress();
          Utilities.showToast( "Phone number verified successfully!");
          Utilities.phone_number = numberController.text.trim();
          emit(OtpVerifiedState());
        } catch (e) {
          Utilities.dismissProgress();
          Utilities.showToast( "Invalid OTP: ${e.toString()}");
          emit(OtpfailedState());
        }
      }

      if(event is GetLocationEvent){
        LocationPermission permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error('Location permissions are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
        print("happens");
        Utilities.showProgress("Fetching Location");
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        try{
          List<Placemark>LocationDetail = await placemarkFromCoordinates(position.latitude, position.longitude);
          Utilities.location = LocationDetail[0].locality.toString();
          Utilities.dismissProgress();
          emit(LocationFetchState());
        }catch(e){
          Utilities.dismissProgress();
          print(e);
        }
      }




    });
  }
}
