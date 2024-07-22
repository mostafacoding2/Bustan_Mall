import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/features/Order/data/manger/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ultra_shop/features/Order/presentation/widgets/appBar_order_screen.dart';
import '../../../../core/Shimmers/order.dart';
import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/app_color.dart';
import '../widgets/custom_order.dart';
class OrderBody extends StatefulWidget {
  const OrderBody({    super.key,});

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {

  OrderCubit cubit=OrderCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchProductDetails();
  }
  void _fetchProductDetails() {
    cubit.viewOrder().then((_) {
      // Trigger a manual rebuild when data is ready
      setState(() {});
    });

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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBarOrderScreen(
            title: "My Orders ",
          ),
        ),
        SliverFillRemaining(
          child: BlocProvider(
            create: (context) => OrderCubit()..viewOrder(),
            child: BlocConsumer<OrderCubit, OrderState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var Data = OrderCubit.get(context).orders;
                return state is ! ViewOrdersLoadingState?(Data.length==0)?
                Center(
                  child: Column(
                    children: [SizedBox(height: 250.h,),
                      Icon(Icons.remove_shopping_cart,size: 150,color: AppColors.myGrey5,),
                      Text("You Don't  have the order  ",style: lightTheme
                          .textTheme.labelLarge!
                          .apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myDarkRed,
                      ),)
                    ],
                  ),
                )  : SizedBox(
                  height: 600.h,
                  child: ListView.builder(
                      itemCount: Data.length,
                      itemBuilder: (context, index) {
                        var cubit = Data[index];
                        String timestamp = cubit.oerderDate!;

                        // Parse the timestamp into a DateTime object
                        DateTime dateTime = DateTime.parse(timestamp);

                        // Get current date
                        DateTime currentDate = DateTime.now();

                        // Get tomorrow's date
                        DateTime tomorrowDate =
                        DateTime.now().add(Duration(days: 1));

                        // Format date
                        String formattedDate;
                        if (dateTime.year == currentDate.year &&
                            dateTime.month == currentDate.month &&
                            dateTime.day == currentDate.day) {
                          formattedDate = "Today";
                        } else if (dateTime.year == tomorrowDate.year &&
                            dateTime.month == tomorrowDate.month &&
                            dateTime.day == tomorrowDate.day) {
                          formattedDate = "Tomorrow";
                        } else {
                          formattedDate =
                              DateFormat('M/d/y').format(dateTime);
                        }

                        // Format time
                        String formattedTime =
                        DateFormat('hh:mm a').format(dateTime);

                        return CustomOrder(
                            orderNumber: cubit.orderNumber!,
                            orderPrice: cubit.oerderPrice!,
                            productStatus: cubit.productStatus!,
                            oerderDate: formattedDate,
                            productsOrder: cubit.products!,
                            orderTime: formattedTime);
                      }),
                ):ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context,index){return OrderShimmer();});

              },
            ),
          ),
        )
      ],
    );
  }
}