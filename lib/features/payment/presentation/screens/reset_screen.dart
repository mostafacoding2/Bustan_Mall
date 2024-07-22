import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/payment/presentation/screens/order_info_item.dart';
import '../../../../core/utils/app_color.dart';
import 'create_total_price.dart';

class PaymentDoneBody extends StatelessWidget {
  const PaymentDoneBody(
      {super.key,
      required this.date,
      required this.time,
      required this.totalPayment,
      required this.userName,
      required this.isStripe});
  final String date;
  final String time;
  final String totalPayment;
  final String userName;
  final bool isStripe;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            clipBehavior: Clip.none,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 120),
            decoration: BoxDecoration(
                color: const Color(0xffEDEDED),
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
              left: 150,
              bottom: 640,
              child: Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                    color: const Color(0xffEDEDED),
                    borderRadius: BorderRadius.circular(360)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(360)),
                    child:
                        const Icon(Icons.check, size: 70, color: Colors.green),
                  ),
                ),
              )),
          Positioned(
              top: 170,
              left: 125,
              child: Text(
                'Thank you!',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
              )),
          Positioned(
              top: 210,
              left: 40,
              child: Text(
                'Payment completed successfully',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
              )),
          Positioned(
            top: 260,
            left: 10,
            right: 10,
            child: OrderInfoItem(
              title: 'Date',
              price: date,
            ),
          ),
          Positioned(
            top: 300,
            left: 10,
            right: 10,
            child: OrderInfoItem(
              title: 'Time',
              price: time,
            ),
          ),
          Positioned(
            top: 340,
            left: 10,
            right: 10,
            child: OrderInfoItem(
              title: 'To',
              price: userName,
            ),
          ),
          Positioned(
            top: 390,
            left: 10,
            right: 10,
            child: TotalPrice(
              title: "Total",
              price: r"$" "$totalPayment",
            ),
          ),
          const Positioned(
            top: 450,
            left: 10,
            right: 10,
            child: Divider(
              thickness: 2,
              color: Color(0xffC7C7C7),
              endIndent: 35,
              indent: 35,
            ),
          ),
          Positioned(
              top: 480,
              left: 43,
              right: 43,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 22,
                    ),
                    isStripe
                        ? SvgPicture.asset(
                            "assets/images/master_card.svg",
                            fit: BoxFit.fill,
                            height: 21,
                            width: 35,
                          )
                        : Image.asset(
                            "assets/images/download.png",
                            fit: BoxFit.fill,
                            height: 21,
                            width: 35,
                          ),
                    const SizedBox(
                      width: 22,
                    ),
                    Expanded(
                        child: isStripe
                            ? ListTile(
                                title: Text(
                                  'Credit Card',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                                ),
                                subtitle: Text(
                                  'Mastercard **42',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                                ),
                              )
                            : ListTile(
                                title: Text(
                                  'PayPal Payment',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                                ),
                              ))
                  ],
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.75,
              left: -8,
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.75,
              right: -8,
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.78,
            left: 42,
            right: 42,
            child: Row(
                children: List.generate(
                    20,
                    (context) => Expanded(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          height: 2,
                          color: const Color(0xffB8B8B8),
                        )))),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.81,
            left: 42,
            right: 42,
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.barcode,
                  size: 55,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.barcode,
                  size: 55,
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1.5, color: Color.fromRGBO(52, 168, 83, 1)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 29),
                  child: Text(
                    "PAID",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.92,
            left: 42,
            right: 42,
            child: GestureDetector(
              onTap: () {
                navigateTo(context, BottomNavScreen(currentIndex: 2));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    "My Order",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
