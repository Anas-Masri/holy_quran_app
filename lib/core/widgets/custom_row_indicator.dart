import 'package:quran_app/core/export/export.dart';

class CustomRowIndicator extends StatelessWidget {
  const CustomRowIndicator({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: selectedIndex == 0 ? 18.5.w : 7.w,
          height: 7.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedIndex == 0
                  ? AppColor.primaryColor
                  : AppColor.orangeColor),
        ),
        SizedBox(width: 6.w),
        Container(
          width: selectedIndex == 1 ? 18.5.w : 7.w,
          height: 7.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedIndex == 1
                  ? AppColor.primaryColor
                  : AppColor.orangeColor),
        ),
        SizedBox(width: 6.w),
        Container(
          width: selectedIndex == 2 ? 18.5.w : 7.w,
          height: 7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedIndex == 2
                  ? AppColor.primaryColor
                  : AppColor.orangeColor),
        ),
      ],
    );
  }
}
