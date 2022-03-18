import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/ui/profile/profile_components.dart';

import '../../utils/colors.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: 'Profile',
            color: Colors.white,
          ),
          centerTitle: true,
          // elevation: 0,
        ),
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsetsDirectional.only(
            top: 20.h,
          ),
          child: Column(
            children: [
              AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 75,
                containerSize: 150,
              ),
              SizedBox(height: 5.h),
              Divider(
                thickness: 3,
                color: Colors.grey.withOpacity(0.2),
              ),
              SizedBox(height: 5.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileWidget(
                        icon: Icons.person,
                        text: 'Ahmed',
                      ),
                      SizedBox(height: 5.h),
                      ProfileWidget(
                        icon: Icons.phone,
                        containerColor: AppColors.yellowColor,
                        text: '01025592065',
                      ),
                      SizedBox(height: 5.h),
                      ProfileWidget(
                        icon: Icons.email,
                        containerColor: AppColors.yellowColor,
                        text: 'SaqrElfirgany@gmail.com',
                      ),
                      SizedBox(height: 5.h),
                      ProfileWidget(
                        icon: Icons.location_on,
                        containerColor: AppColors.yellowColor,
                        text: 'Address',
                      ),
                      SizedBox(height: 5.h),
                      ProfileWidget(
                        icon: Icons.message,
                        containerColor: Colors.redAccent,
                        text: 'Message',
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
