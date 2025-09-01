import 'package:quran_app/core/export/export.dart';

class CustomTapButton extends StatelessWidget {
  const CustomTapButton({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 104.w,
        height: 32.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: isSelected ? AppColor.orangeColor : Colors.transparent),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
