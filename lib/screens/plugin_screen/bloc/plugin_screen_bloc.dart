import 'package:ecebee/allimports.dart';

part 'plugin_screen_event.dart';
part 'plugin_screen_state.dart';

class PluginScreenBloc extends Bloc<PluginScreenEvent, PluginScreenState> {

  int randomNumber = 0;

  String latitude = "";
  String longitude = "";
  int loginId = 0;
  PluginScreenBloc() : super(PluginScreenInitial()) {
    on<PluginScreenEvent>((event, emit) async {

      if(event is LoginDetailsSaveEvent){
        Utilities.showProgress();
        final response = await Supabase.instance.client
            .from('login_details')
            .insert({
          'ip_address': await Utilities.GetIPaddress(),
          'latitude': latitude,
          'longitude': longitude,
          'timestamp': DateTime.now().toString(),
        }).select('id').single();
        Utilities.dismissProgress();
        if (response != null) {
          loginId = response['id'];
          print(loginId);
          Utilities.showToast('details saved successfully!');
        }
        emit(LoginDetailsSaveState());

      }

      if(event is QRDetailsSaveEvent){
        Utilities.showProgress();
        final response = await Supabase.instance.client.from('login_details').update({
          'random_number': randomNumber.toString(),
        }).eq("id", loginId);
        Utilities.dismissProgress();
        if (response != null) {
          print('Error updating data with QR: ${response}');
          emit(QRDetailsSaveFailedState());
        } else {
          emit(QRDetailsSaveState());
          Utilities.showToast('Data updated with QR code successfully!');
        }
      }

    });
  }
}
