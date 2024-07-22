import 'package:ultra_shop/features/Home/presentation/manger/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/bottom_nav_body.dart';

class BottomNavScreen extends StatefulWidget {
  int? currentIndex;
  BottomNavScreen({Key? key, required this.currentIndex}) : super(key: key);
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  DateTime? lastPressedTime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (widget.currentIndex != null) {
            cubit.currentIndex = widget.currentIndex!;
            widget.currentIndex = null;
          }

          return WillPopScope(
            onWillPop: () async {
              final now = DateTime.now();
              bool willPop;
              if (lastPressedTime == null ||
                  now.difference(lastPressedTime!) >
                      const Duration(seconds: 2)) {
                lastPressedTime = now;
                Fluttertoast.showToast(
                  msg: 'Press back again to exit',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
                willPop = false;
              } else {
                willPop = true;
              }
              return willPop;
            },
            child: BottomNavBody(cubit: cubit),
          );
        },
      ),
    );
  }
}
