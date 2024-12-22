import 'package:ecebee/allimports.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginScreenBloc bloc ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<LoginScreenBloc>(context);
    checkPermission();
  }
  Future<void> checkPermission() async {
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
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Utilities.latitude = position.latitude.toString();
    Utilities.longitude = position.longitude.toString();
  }




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<LoginScreenBloc, LoginScreenState>(
      listener: (context, state) {
        if(state is OtpVerifiedState){
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.plugInScreen, (route) => false);
        }
      },
      child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage("assets/bgimg.jpg",),fit: BoxFit.fill)
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.blockSizeVertical! * 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical! * 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: topicColor,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! *5),
                          child: Center(
                            child: CustomText(
                              text: "LOGIN",
                              color: Colors.white,
                              size: SizeConfig.screenWidth! * large_text,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Phone number",
                          color: Colors.white,
                          size: SizeConfig.screenWidth! * large_text,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 7,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            controller: bloc.numberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Phone Number!";
                              }
                              if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                                return "Please Enter 10-digit Phone Number";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: textFormFieldColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 0.5,),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: InkWell(
                        //     onTap: () async {
                        //       sendOTP();
                        //     },
                        //     child: Container(
                        //       height: SizeConfig.blockSizeVertical! * 3,
                        //       width: SizeConfig.blockSizeHorizontal! * 23,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(8),
                        //         color: buttonColor,
                        //       ),
                        //       child: Center(
                        //         child: CustomText(
                        //           text: "Send OTP",
                        //           weight: FontWeight.bold,
                        //           color: Colors.white,
                        //           size: SizeConfig.screenWidth! * medium_text,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        CustomText(
                          text: "OTP",
                          color: Colors.white,
                          size: SizeConfig.screenWidth! * large_text,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 7,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            controller: bloc.otpController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Phone Number!";
                              }
                              if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                                return "Please Enter 10-digit Phone Number";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: textFormFieldColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
                        MaterialButton(
                          onPressed: () async {
                            Utilities.loginTime = DateTime.now().toString();
                            bloc.add(LoginEvent());
                          },
                          color: buttonColor,
                          height: SizeConfig.blockSizeVertical! * 6,
                          minWidth: SizeConfig.blockSizeHorizontal! *80,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: CustomText(
                              text: "LOGIN",
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: SizeConfig.screenWidth! * large_text,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



