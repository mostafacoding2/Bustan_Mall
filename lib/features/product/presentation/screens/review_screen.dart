import 'package:ultra_shop/core/utils/component_in_general.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/widgets/custom_button.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/review_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';
class ReviewScreen extends StatefulWidget {
   const ReviewScreen({super.key, required this.id,});
   final int id;
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}
class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController commentController=TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  int _rating = 0;
  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ReviewCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              CustomAppBarTitleArrow(arrow_back: true,title:"review " ,onpressed:(){Navigator.pop(context);}),
              Container(height: 5,width: 25,color:AppColors.myGrey ,)
             ,SizedBox(height: 80.h,)
            ,  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => _setRating(index + 1),
              child: Icon(
                index < _rating ? Icons.star : Icons.star_border,
                size: 59,
                color: Colors.yellow,
              ),
            );
                      }),
                    ),
              SizedBox(height:100.h ,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomTextFormField(
                  controller: commentController,
                  obscureText: false, keyboardType: TextInputType.text,label: "Enter The Comment",),
              )
              ,SizedBox(height: 20.h,)
                ,          SizedBox(height:30.h ,),

              BlocConsumer<ReviewCubit, ReviewState>(
              listener: (context, state) {
                if(state is ReviewSuccessState){
                  flutterToast(message: " Review Success", success: true);
                   navigateAndReplacement(context, ProductDetailsScreen(id: widget.id,));
                }
                if(state is ReviewFailureState){
                  flutterToast(message: state.failure, success: false);
                }
                 if(state is ReviewErrorState){
                  flutterToast(message: state.failureReview.errors!.comment![0], success: false);
                }

                // TODO: implement listener
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is ReviewLoadingState?true:false,
                    title: "AddReview",
                    onTap: (){
                    if(_rating==0){
                      ReviewCubit.get(context).review(productId: widget.id, rating: 1, comment: commentController.text);
                    }
                    else{
                      ReviewCubit.get(context).review(productId: widget.id, rating: _rating, comment: commentController.text);
                    }


                }, );
              },
            )



            ],),
          ),
              )
          ,
        ),
      ),
    );
  }
}
