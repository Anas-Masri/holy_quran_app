import 'package:quran_app/core/export/export.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.leftIcon,
    this.rightIcon = AppImage.menuHamburger,
    this.centerTitle = false,
    this.onTap,
  });
  final String title;
  final String leftIcon;
  final String rightIcon;
  final bool centerTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(rightIcon),
      centerTitle ? const Spacer() : SizedBox(width: 16.w),
      Text(title,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: AppColor.primaryColor)),
      const Spacer(),
      GestureDetector(onTap: onTap, child: SvgPicture.asset(leftIcon)),
    ]);
  }
}
