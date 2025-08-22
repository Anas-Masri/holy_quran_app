import 'package:quran_app/core/export/export.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.splashBackgroundColor,
        body: Stack(children: [
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            AppImage.stackedImage,
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColor.splashBackgroundColor.withOpacity(0.85),
          ),
          Column(children: [
            SizedBox(height: 135.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Image.asset(AppImage.splashImage01)),
            SizedBox(height: 20.h),
            Image.asset(AppImage.splashImage02)
          ]),
          Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                  color: Colors.orange.withOpacity(0.75),
                  backgroundColor: AppColor.splashBackgroundColor))
        ]));
  }
}
