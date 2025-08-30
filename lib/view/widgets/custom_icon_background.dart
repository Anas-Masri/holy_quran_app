import 'package:quran_app/core/export/export.dart';

class CustomIconBackGround extends StatelessWidget {
  const CustomIconBackGround({super.key, required this.icon, this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.primaryColor.withOpacity(0.2),
        ),
        child: Icon(
          icon,
          color: AppColor.primaryColor,
          size: 30.sp,
        ),
      ),
    );
  }
}
