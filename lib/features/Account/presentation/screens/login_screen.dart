import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/Login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, });
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool isLoading=false ;
  final  _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.myWhite,
        body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child:LoginBody(
                    formKey: _formKey,
            usernameController: _usernameController,
                   passwordController: _passwordController,
                  )
                ),
              ),
      );
  }
}
