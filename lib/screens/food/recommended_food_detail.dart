import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/helper/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20.r),
                    topEnd: Radius.circular(20.r),
                  ),
                ),
                child: Center(child: BigText(text: 'Chinese Side', size: 26)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: assets['food0'],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691'
              '109772713_2167512083394135_628893987691',
            ),
          ),
        ],
      ),
    ));
  }
}
