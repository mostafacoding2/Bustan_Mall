import 'package:flutter/material.dart';import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/images_paths.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/screens/change_password_screen.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/controller/applyshop_cubit.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/screens/create_apply_shop_screen.dart';
import 'package:ultra_shop/features/Home/presentation/screens/add_role_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_profile_item.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/item_text_profile.dart';
import 'package:ultra_shop/features/Account/presentation/screens/select_role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/Shimmers/profile.dart';
import '../widgets/custom_sing_out.dart';
class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  void signout() {
    showDialog(
        barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
        context: context,
        builder: (BuildContext context) {
          return const ItemSigOut(
            title: "Do you want to log out?",
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(children: [
        SizedBox(
          height: 30.h,
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset(height: 200.h, width: 200.w, ImagesPaths.logo),
        ),
        BlocProvider(
          create: (context) => AccountCubit()..showUser(),
          child: BlocBuilder<AccountCubit, AccountState>(
            builder: (context, state) {
              var data = AccountCubit.get(context).showUserModel;
              return state is ShowUserSuccessState
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ItemTextProfile(
                    title: "Name:",
                    content: '${data!.firstName!} ${data.lastName!}',
                  ),
                  ItemTextProfile(
                    title: "Email:",
                    content: data.email!,
                  ),
                  ItemTextProfile(
                    title: "UserName:",
                    content: data.userName!,
                  ),
                  ItemTextProfile(
                    title: "The Address:",
                    content: " ${data.street!} / ${data.city!}",
                  ),
                  ItemTextProfile(
                    title: "Phone Number :",
                    content: data.phone!,
                  ),
                  ItemTextProfile(
                    title: "Role Now :",
                    content: role,
                  ),
                  data.roles!.length == 1
                      ? SizedBox()
                      :  GestureDetector(
                    onTap: () {
                      PreferenceUtils.removeData(
                          SharedKeys.role);
                      if (role.length > 1) {
                        navigateAndRemove(
                            context,
                            SelectRole(
                              roles: data.roles,
                            ));
                      }
                    },
                    child: CustomProfile(
                      widget:  Row(
                        children: [
                          Text(
                            'Change Role',
                            style: lightTheme.textTheme.labelSmall!
                                .apply(
                              fontSizeFactor: 1.sp,
                              color: AppColors.myDeepBlue,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            FontAwesomeIcons.person,
                            size: 24,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
                  : Center(
                child: ProfileShimmer()
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              ChangePasswordScreen(),
            );
          },          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Change Password',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
                FontAwesomeIcons.lock,
                size: 24,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),
        (role == AppString.admin)
            ?  GestureDetector(
          onTap: () {
            navigateTo(context, AddRoleScreen());
          },
          child: CustomProfile(
            widget: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Add Role',
                  style: lightTheme.textTheme.labelSmall!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myDeepBlue,
                  ),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.personBooth,
                  size: 24,
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        )
            :    GestureDetector(
          onTap: () {
            navigateTo(
                context,
                BlocProvider(
                  create: (context) => ApplyshopCubit(),
                  child: ApplyShopScreen(),
                ));
          },
          child: CustomProfile(
            widget: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'ApplyShop',
                  style: lightTheme.textTheme.labelSmall!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myDeepBlue,
                  ),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.shop,
                  size: 24,
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: signout,          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Sign Out',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
                FontAwesomeIcons.signOut,
                size: 24,
                color: AppColors.myRed,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),
        SizedBox(
          height: 30.h,
        )
      ]),
    );
  }
}
