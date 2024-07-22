import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/select_bole_body.dart';
class SelectRole extends StatelessWidget {
  SelectRole({Key? key,  this.roles}) : super(key: key);
  List<String>?roles;
  @override
  Widget build(BuildContext context) {

   int number=roles!.length;
   SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
       statusBarColor: AppColors.myWhite,
       statusBarBrightness: Brightness.light,
       statusBarIconBrightness: Brightness.light,
     ),
   );
    return Scaffold(
      body: SelectRoleBody(number: number, roles: roles),
    );
  }
}


