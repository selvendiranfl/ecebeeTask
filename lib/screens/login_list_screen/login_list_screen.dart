import 'package:ecebee/allimports.dart';







class LoginListScreen extends StatefulWidget {
  const LoginListScreen({super.key});

  @override
  State<LoginListScreen> createState() => _LoginListScreenState();
}

class _LoginListScreenState extends State<LoginListScreen> {


  late LoginListScreenBloc bloc ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<LoginListScreenBloc>(context);
  }




  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginListScreenBloc, LoginListScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: BlocBuilder<LoginListScreenBloc, LoginListScreenState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: Container(
                height: SizeConfig.screenHeight,
                decoration: BoxDecoration(
                    image:DecorationImage(image: AssetImage("assets/bgimg.jpg",),fit: BoxFit.fill)
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: SizeConfig.blockSizeVertical! *1,
                      left: SizeConfig.blockSizeHorizontal! * 3,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: CustomText(
                          text: "<",
                          color: Colors.white,
                          size: SizeConfig.blockSizeVertical! * 5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.blockSizeVertical! * 3,
                      right: SizeConfig.blockSizeHorizontal! * 3,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context,AppRoutes.loginScreen, (route) => false);
                        },
                        child: CustomText(
                          text: "Logout",
                          color: Colors.white,
                          size: SizeConfig.screenWidth! * large_text,
                        ),
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
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 5,vertical: SizeConfig.blockSizeVertical! * 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: TabBar(
                                      dividerColor: Colors.transparent,
                                      indicatorColor: Colors.white,
                                      tabs: [
                                        CustomText(
                                          text: "Today",
                                          color: Colors.white,
                                          size: SizeConfig.screenWidth! * small_text,
                                        ),
                                        CustomText(
                                          text: "Yesterday",
                                          color: Colors.white,
                                          size: SizeConfig.screenWidth! * small_text,
                                        ),
                                        CustomText(
                                          text: "Others",
                                          color: Colors.white,
                                          size: SizeConfig.screenWidth! * small_text,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 20,)
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                    children: [
                                     bloc.todayData.isNotEmpty ? ListView.builder(
                                          itemCount: bloc.todayData.length,
                                          itemBuilder: (context,index){
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    text: Utilities.convertTo12HourFormat(bloc.todayData[index].timestamp),
                                                    color: Colors.white,
                                                  ),
                                                  CustomText(
                                                    text: "IP : ${bloc.todayData[index].ipAddress}",
                                                    color: Colors.white,
                                                  ),
                                                  CustomText(
                                                    text: bloc.todayData[index].location,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              bloc.todayData[index].randomNumber != null ? Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: QrImageView(
                                                  data: bloc.todayData[index].randomNumber!,
                                                  version: QrVersions.auto,
                                                  size: SizeConfig.blockSizeVertical! * 10,
                                                ),
                                              ) :
                                                  SizedBox()
                                            ],
                                          ),
                                        );
                                      }) :
                                      Center(
                                        child: CustomText(
                                          text: "No record",
                                          color: Colors.white,
                                          size: SizeConfig.screenWidth! * large_text,
                                        ),
                                      ),
                                      bloc.yesterdayData.isNotEmpty ? ListView.builder(
                                          itemCount: bloc.yesterdayData.length,
                                          itemBuilder: (context,index){
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      CustomText(
                                                        text: Utilities.convertTo12HourFormat(bloc.yesterdayData[index].timestamp),
                                                        color: Colors.white,
                                                      ),
                                                      CustomText(
                                                        text: "IP : ${bloc.yesterdayData[index].ipAddress}",
                                                        color: Colors.white,
                                                      ),
                                                      CustomText(
                                                        text: bloc.yesterdayData[index].location,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                  bloc.yesterdayData[index].randomNumber != null ? Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(8)
                                                    ),
                                                    child: QrImageView(
                                                      data: bloc.yesterdayData[index].randomNumber!,
                                                      version: QrVersions.auto,
                                                      size: SizeConfig.blockSizeVertical! * 10,
                                                    ),
                                                  ):
                                                      SizedBox()
                                                ],
                                              ),
                                            );
                                          }) :
                                      Center(
                                        child: CustomText(
                                          text: "No record",
                                          color: Colors.white,
                                          size: SizeConfig.screenWidth! * large_text,
                                        ),
                                      ),
                                      bloc.otherData.isNotEmpty ? ListView.builder(
                                          itemCount:  bloc.otherData.length,
                                          itemBuilder: (context,index){
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      CustomText(
                                                        text: Utilities.convertTo12HourFormat( bloc.otherData[index].timestamp),
                                                        color: Colors.white,
                                                      ),
                                                      CustomText(
                                                        text: "IP : ${ bloc.otherData[index].ipAddress}",
                                                        color: Colors.white,
                                                      ),
                                                      CustomText(
                                                        text: bloc.otherData[index].location,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                  bloc.otherData[index].randomNumber != null ?Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(8)
                                                    ),
                                                    child: QrImageView(
                                                      data:  bloc.otherData[index].randomNumber!,
                                                      version: QrVersions.auto,
                                                      size: SizeConfig.blockSizeVertical! * 10,
                                                    ),
                                                  ):
                                                      SizedBox()
                                                ],
                                              ),
                                            );
                                          }) :
                                      Center(
                                        child: CustomText(
                                          text: "No record",
                                          color: Colors.white,
                                          size: SizeConfig.screenWidth! * large_text,
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
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
                                text: "Last Login",
                                color: Colors.white,
                                size: SizeConfig.screenWidth! * large_text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
