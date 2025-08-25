import 'package:quran_app/core/export/export.dart';

class AyaCard extends StatelessWidget {
  const AyaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 147.h,
        padding: EdgeInsets.only(top: 24.h, left: 14.w, right: 14.w),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(width: 5.w, color: Colors.orange)),
          borderRadius: BorderRadius.circular(16.r),
          color: const Color(0xff2C2C2C),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text('الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                    style: TextStyle(
                        fontFamily: 'Amiri',
                        color: const Color(0xffFFE9C2),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400)),
                const Spacer(),
                const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 7.h),
            Text(
              textDirection: TextDirection.ltr,
              'All praise and thanks be to the Lord of the worlds.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
            SizedBox(height: 13.h),
            Text(
              'سورة الفاتحة - الجزء الثلاثون  - آية ١',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 8.sp,
                  color: const Color(0xffFFE9C2)),
            ),
          ],
        ));
  }
}
