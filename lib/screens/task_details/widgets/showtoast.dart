import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

showToastMessage(String text){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.c_53b175,
      textColor: AppColors.white,
      fontSize: 16.0
  );
}
showErrorToastMessage(String text){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.c_F4261A,
      textColor: AppColors.white,
      fontSize: 16.0
  );
}