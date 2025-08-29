import 'package:quran_app/core/export/export.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.cardColor,
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                width: 345.w,
                height: 132.h,
                AppImage.cardImage,
                fit: BoxFit.cover,
              )),
          Positioned(
              top: 10.h,
              left: 39.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الظهر',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp)),
                  Text('11:45',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 32.sp)),
                  Text('الصلاة التالية: العصر',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp)),
                  Text('مساءً 2:50',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp)),
                ],
              ))
        ],
      ),
    );
  }
}
