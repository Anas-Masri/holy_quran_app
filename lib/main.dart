import 'package:quran_app/core/export/export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: AppSize.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            theme: ThemeData(fontFamily: 'almarai'),
            initialBinding: AppBindings(),
            getPages: AppRoutes.getPages,
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: const SplashView());
  }
}
