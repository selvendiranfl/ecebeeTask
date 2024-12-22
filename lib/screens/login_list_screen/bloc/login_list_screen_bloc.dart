import 'package:ecebee/allimports.dart';
import 'package:intl/intl.dart';

part 'login_list_screen_event.dart';
part 'login_list_screen_state.dart';

class LoginListScreenBloc extends Bloc<LoginListScreenEvent, LoginListScreenState> {

  List<loginDetailsRes> todayData = [];
  List<loginDetailsRes> yesterdayData = [];
  List<loginDetailsRes> otherData = [];
  LoginListScreenBloc() : super(LoginListScreenInitial()) {
    on<LoginListScreenEvent>((event, emit) async {
      if(event is FetchLoginDetailsEvent){
        Utilities.showProgress();
        try {
          final response = await Supabase.instance.client
              .from('login_details')
              .select();

          if (response == null || response is! List) {
            throw Exception('Invalid response');
          }

          final allData = response.map((data) => loginDetailsRes.fromJson(data)).toList();
          final now = DateTime.now();
          final today = DateFormat('yyyy-MM-dd').format(now);
          final yesterday = DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: 1)));

          for (var item in allData) {
            final timestampDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(item.timestamp!));
            if (timestampDate == today) {
              todayData.add(item);
              print(todayData);
            } else if (timestampDate == yesterday) {
              yesterdayData.add(item);
            } else {
              otherData.add(item);
            }
          }
          Utilities.dismissProgress();
          emit(FetchLoginDetailsState());

        } catch (error) {
          Utilities.dismissProgress();
          emit(FetchLoginDetailsFailedState());
          print('Error fetching and categorizing login details: $error');
        }
      }
    });
  }
}
