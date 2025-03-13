import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // Add your intro response data model and getIntro method
  var introRespones;

  void getIntro() {
    // Implement intro data fetching logic
  }
}
