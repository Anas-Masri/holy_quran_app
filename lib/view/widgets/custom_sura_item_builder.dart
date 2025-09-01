import 'package:quran_app/core/export/export.dart';

class CustomSuraItemBuilder extends StatelessWidget {
  const CustomSuraItemBuilder({
    super.key,
    required this.suraNumber,
    required this.suraName,
    required this.ayahCount,
    required this.location,
    required this.pageNumber,
  });
  final int suraNumber;
  final int pageNumber;
  final int ayahCount;
  final String suraName;
  final String location;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      height: 66.h,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        trailing: Text(
          'الصفحة ${Utiles.convertToArabicNumbers('$pageNumber')}',
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: '',
              fontWeight: FontWeight.w500,
              color: AppColor.primaryColor),
        ),
        title: Text(
          suraName,
          style: TextStyle(
              fontFamily: '',
              fontSize: 24.sp,
              height: 1,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryColor),
        ),
        subtitle: Text(
          'آياتها ${Utiles.convertToArabicNumbers('$ayahCount')} - $location',
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: '',
              fontWeight: FontWeight.w400,
              color: AppColor.primaryColor),
        ),
        leading: Container(
          width: 60.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(40),
              color: AppColor.cardColor),
          child: Text(
            Utiles.convertToArabicNumbers('$suraNumber'),
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                fontFamily: ''),
          ),
        ),
      ),
    );
  }
}
