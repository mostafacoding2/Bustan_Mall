import 'package:ultra_shop/features/ApplyShop/presentation/screens/applies%20shops_screen.dart';
import 'package:ultra_shop/features/Home/presentation/screens/home_screen.dart';
import 'package:ultra_shop/features/Home/presentation/screens/profile_screen.dart';
import 'package:ultra_shop/features/Order/presentation/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Cart/presentation/screens/cart_screen.dart';
part 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen = [
     HomeScreen(),
    const CartScreen(),
    const OrderScreen(),
    const ProfileScreen(),
     AppliesShopsScreen()
  ];
  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
