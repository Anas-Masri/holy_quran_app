import 'package:quran_app/core/export/export.dart';

class ListViewItemBuilder extends StatelessWidget {
  const ListViewItemBuilder({
    super.key,
    required this.title,
    required this.isOpened,
    this.onTap,
  });
  final String title;
  final bool isOpened;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 345.w,
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.primaryColor),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                const Spacer(),
                Icon(
                  isOpened
                      ? Icons.arrow_drop_down_sharp
                      : Icons.arrow_right_outlined,
                  size: 30,
                  color: Colors.white,
                )
              ],
            )),
      ),
    );
  }
}
