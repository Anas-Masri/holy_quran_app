import 'package:quran_app/core/export/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.color,
      required this.title,
      required this.subTitle});
  final Color color;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.5.h, horizontal: 24.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subTitle,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: const Color(0xffA1A1A1)),
          )
        ],
      ),
    );
  }
}
