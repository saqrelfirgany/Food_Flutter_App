import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/screens/widgets/small_text.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double size;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: size.w),
        SizedBox(width: 5.w),
        SmallText(text: text),
      ],
    );
  }
}
