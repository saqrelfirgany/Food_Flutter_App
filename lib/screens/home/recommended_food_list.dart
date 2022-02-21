import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/screens/widgets/big_text.dart';
import 'package:food_flutter_app/screens/widgets/small_text.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:food_flutter_app/utils/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../components.dart';

class RecommendedFoodList extends StatelessWidget {
  const RecommendedFoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedController>(
      builder: (recommendedController) => recommendedController.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedController.recommendedList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.toNamed('/recommended-food-detail?pageId=$index'),
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w,
                      bottom: 10.h,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 120.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                AppConstants.uploadUri +
                                    recommendedController
                                        .recommendedList[index].img!,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            height: 100.h,
                            padding: EdgeInsetsDirectional.only(
                              start: 10.w,
                              top: 10.h,
                              end: 20.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(20.r),
                                bottomEnd: Radius.circular(20.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  text: recommendedController
                                      .recommendedList[index].name!,
                                ),
                                SizedBox(height: 8.h),
                                SmallText(
                                  text: recommendedController
                                      .recommendedList[index].description!,
                                  overFlow: true,
                                ),
                                const Spacer(),
                                buildSubHeaderDetailsRowIcons(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

Widget recommendedTitle() {
  ///
  ///The Recommended Food list home screen section 2
  ///
  return Container(
    margin: EdgeInsetsDirectional.only(start: 30.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BigText(text: 'Recommended'),
        SizedBox(width: 10.w),
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 3.h),
          child: BigText(
            text: '.',
            color: Colors.black26,
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 2.h),
          child: SmallText(text: 'Food Pairing'),
        ),
      ],
    ),
  );
}
