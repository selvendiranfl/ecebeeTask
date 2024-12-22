import 'package:ecebee/allimports.dart';


class PluginScreen extends StatefulWidget {
  const PluginScreen({super.key});

  @override
  State<PluginScreen> createState() => _PluginScreenState();
}

class _PluginScreenState extends State<PluginScreen> {

  late PluginScreenBloc bloc ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<PluginScreenBloc>(context);
    bloc.randomNumber = Utilities.generateRandomFiveDigitNumber();
  }



  // Future<void> saveLoginDetails() async {
  //   final response = await Supabase.instance.client
  //       .from('login_details')
  //       .insert({
  //     'ip_address': await Utilities.GetIPaddress(),
  //     'latitude': bloc.latitude,
  //     'longitude': bloc.longitude,
  //     'timestamp': DateTime.now().toString(),
  //   }).select('id').single();
  //
  //   if (response != null) {
  //     bloc.loginId = response['id'];
  //     print(bloc.loginId);
  //   }
  //     print('Login details saved successfully!');
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<PluginScreenBloc, PluginScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: BlocBuilder<PluginScreenBloc, PluginScreenState>(
          builder: (context, state) {
            return Container(
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                  image:DecorationImage(image: AssetImage("assets/bgimg.jpg",),fit: BoxFit.fill)
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: SizeConfig.blockSizeVertical! * 3,
                    right: SizeConfig.blockSizeHorizontal! * 3,
                    child: CustomText(
                      text: "Logout",
                      color: Colors.white,
                      size: SizeConfig.screenWidth! * large_text,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/mailicon.svg",color: textFormFieldColor,height: SizeConfig.blockSizeVertical! *30,),
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
                              text: "PLUGIN",
                              color: Colors.white,
                              size: SizeConfig.screenWidth! * large_text,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: SizeConfig.blockSizeVertical! * 15,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.all(8),
                          child: QrImageView(
                            data: bloc.randomNumber.toString(),
                            version: QrVersions.auto,
                            size: SizeConfig.blockSizeVertical! * 18,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! *2,),
                        CustomText(
                          text: "Generated number",
                          color: Colors.white,
                          size: SizeConfig.screenWidth! * large_text_extra,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! *1,),
                        CustomText(
                          text: bloc.randomNumber.toString(),
                          color: Colors.white,
                          size: SizeConfig.screenWidth! * large_text__lit_extra,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! *20,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.loginListScreen);
                          },
                          child: Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white)
                            ),
                            child: Center(
                              child: CustomText(
                                text: "Last login at Today, ${Utilities.convertTo12HourFormat(Utilities.loginTime)}",
                                color: Colors.white,
                                size: SizeConfig.screenWidth! * large_text,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! *2,),
                        MaterialButton(
                          onPressed: ()  {
                            bloc.add(QRDetailsSaveEvent());
                          },
                          color: buttonColor,
                          height: SizeConfig.blockSizeVertical! * 7,
                          minWidth: SizeConfig.blockSizeHorizontal! *80,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: CustomText(
                              text: "SAVE",
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: SizeConfig.screenWidth! * large_text_mid,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
