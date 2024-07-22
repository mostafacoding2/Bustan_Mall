import 'package:device_preview/device_preview.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/bloc_observe.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await PreferenceUtils.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  token = PreferenceUtils.getString(
    SharedKeys.token,
  );
  print(" token ==: ${token.toString()}");
  customerId = PreferenceUtils.getString(
    SharedKeys.customerId,
  );
  userName = PreferenceUtils.getString(
    SharedKeys.userName,
  );
  print(" userName== ${userName.toString()}");
  print(" customId ==: ${customerId.toString()}");
  role = PreferenceUtils.getString(
    SharedKeys.role,
  );
  print(" role== ${role.toString()}");
  Stripe.publishableKey = ApiConstant.stripePublishableKey;
  runApp(
    DevicePreview(
        enabled: false,
        builder: (context) => ECommerceApp(
              role: role,
              token: token,
            ) // Wrap your app
        ),
  );
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({ super.key, this.token, this.role,});
  final String? token;
  final String? role;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return BlocProvider(
            create: (context) => AccountCubit(),
            child: MaterialApp(
              title: AppString.ecommerceApp,
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              home: SplashScreensAnimated(),
            ),
          );
        });
  }
}