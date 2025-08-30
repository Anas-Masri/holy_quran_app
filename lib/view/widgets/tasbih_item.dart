import 'package:quran_app/core/export/export.dart';

class TasbihItem extends StatelessWidget {
  const TasbihItem(
      {super.key,
      required this.tasbihName,
      required this.from,
      required this.to,
      this.iscalculatingNow = false});
  final String tasbihName;
  final int from;
  final int to;
  final bool iscalculatingNow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: iscalculatingNow ? const Color(0xffA48979) : Colors.transparent,
        child: Row(
          children: [
            SizedBox(width: 15.w),
            SizedBox(
              width: 180.w,
              child: Text(
                overflow: TextOverflow.ellipsis,
                tasbihName,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: '',
                    color: AppColor.primaryColor),
              ),
            ),
            const Spacer(),
            Text(
              '$from / $to',
              style: TextStyle(
                  fontSize: 18.sp, fontWeight: FontWeight.w400, fontFamily: ''),
            ),
            SizedBox(width: 15.w),
            Icon(
              from >= to ? Icons.check : Icons.close,
              color: from >= to ? Colors.green : Colors.red,
              size: 30,
            ),
            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }
}
