import 'package:ultra_shop/core/utils/images_paths.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
List<String>payment=[ ImagesPaths.card,ImagesPaths.paypal];
List<String> titles = ["Card", "Paypal"];
String token='';
String customerId='';
String role='';
String userName='';
Future<bool?> flutterToast({
  required String message,
  required bool success,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: (success == true) ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
final List <String>images=[
"https://www.amazon.com/sspa/click?ie=UTF8&spc=MToxNzgyMjI1NDU2ODQ1NTA6MTcxNjYzMDUwNDpzcF9tdGY6MzAwMTU1MDQ1MzA0NjAyOjowOjo&url=%2FAWOW-AL34-Computer-Dual-Band-Ethernet%2Fdp%2FB0CJFDM1VZ%2Fref%3Dsr_1_7_sspa%3Fcrid%3D3DOQ9S1MGKRX%26dib%3DeyJ2IjoiMSJ9.P49sY3baL7KcmDK9LFWFwKSzh4UY5r3ihP0mj2iZiMXjmucgBd-XVpTaTrHI5oXIZEz7D8Rq5mimikmJezzlvNk5ihWthgvRZTmZn5cvvw8nIfCzrIdbHv_pQbnVCU_j7SLw1q5LDtBSrnOMpEnY1OoNTnrJxAR1reaE11G0biK5RoRv9_nX9KFYm6CWlbbt6TjeVpEIl3FBVBLHKUCupjOTkFZm2XcGi4uzQvBGjCk.5ZckplQ2kFNikMYpFCSPZ96lyT0MwREmnVw-PDG0BKQ%26dib_tag%3Dse%26keywords%3Dcomputer%26qid%3D1716630504%26sprefix%3Dcomputer%2B%252Caps%252C220%26sr%3D8-7-spons%26sp_csd%3Dd2lkZ2V0TmFtZT1zcF9tdGY%26psc%3D1"
  ,'https://www.amazon.com/A315-24P-R7VH-Display-Quad-Core-Processor-Graphics/dp/B0BS4BP8FB/ref=sr_1_8?crid=3DOQ9S1MGKRX&dib=eyJ2IjoiMSJ9.P49sY3baL7KcmDK9LFWFwKSzh4UY5r3ihP0mj2iZiMXjmucgBd-XVpTaTrHI5oXIZEz7D8Rq5mimikmJezzlvNk5ihWthgvRZTmZn5cvvw8nIfCzrIdbHv_pQbnVCU_j7SLw1q5LDtBSrnOMpEnY1OoNTnrJxAR1reaE11G0biK5RoRv9_nX9KFYm6CWlbbt6TjeVpEIl3FBVBLHKUCupjOTkFZm2XcGi4uzQvBGjCk.5ZckplQ2kFNikMYpFCSPZ96lyT0MwREmnVw-PDG0BKQ&dib_tag=se&keywords=computer&qid=1716630504&sprefix=computer+%2Caps%2C220&sr=8-8'];
void navigateTo(context, widget,) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigatePup(context, widget) =>
    Navigator.pop(context,widget);
void navigateAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void navigateAndReplacement(context, widget) => Navigator.pushReplacement(
  context, MaterialPageRoute(builder: (context) => widget), );


void customSnakeBar({
  required context,
  required widget,
  Color? backgroundColor,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: widget,
      backgroundColor: backgroundColor,
    ));
Widget customAlertDialog({
  Widget? title,
  Widget? content,
  List<Widget>? actions,
  Color? backgroundColor,
  TextStyle? contentStyle,
}) =>
    AlertDialog(
      title: title,
      content: content,
      actions: actions,
      backgroundColor: backgroundColor,
      contentTextStyle: contentStyle,
    );
void signOut(context) {
  PreferenceUtils.removeData(SharedKeys.token).then((value) {
    if (value) {
      // navigateAndRemove(context, LoginScreen());
    }
  });
}

