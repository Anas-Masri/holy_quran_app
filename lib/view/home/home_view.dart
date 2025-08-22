import 'package:quran_app/core/export/export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 41.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(children: [
            SvgPicture.asset(AppImage.search),
            const Spacer(),
            Text(
              'القرآن الكريم',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColor.primaryColor),
            ),
            SizedBox(width: 16.w),
            SvgPicture.asset(AppImage.menuHamburger),
          ]),
        ),
      ],
    ));
  }
}
