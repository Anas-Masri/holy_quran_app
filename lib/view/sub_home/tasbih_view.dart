import 'package:quran_app/core/export/export.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GetBuilder(
              init: HomeController(),
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: AppConstants.gridViewTitle[1],
                        onTap: () => Get.back(),
                        leftIcon: AppImage.arrow,
                        centerTitle: true,
                      ),
                      SizedBox(height: 45.h),
                      Container(
                        width: 345.w,
                        decoration: BoxDecoration(
                            color: AppColor.cardColor,
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Column(
                          children: [
                            TasbihItem(
                                iscalculatingNow:
                                    controller.selectedIndexTasbihList == 0,
                                from: controller.counters[0],
                                to: 300,
                                tasbihName: AppConstants.tasbihList[0]),
                            TasbihItem(
                                iscalculatingNow:
                                    controller.selectedIndexTasbihList == 1,
                                from: controller.counters[1],
                                to: 300,
                                tasbihName: AppConstants.tasbihList[1]),
                            TasbihItem(
                                iscalculatingNow:
                                    controller.selectedIndexTasbihList == 2,
                                from: controller.counters[2],
                                to: 300,
                                tasbihName: AppConstants.tasbihList[2]),
                            TasbihItem(
                                iscalculatingNow:
                                    controller.selectedIndexTasbihList == 3,
                                from: controller.counters[3],
                                to: 300,
                                tasbihName: AppConstants.tasbihList[3]),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        alignment: Alignment.center,
                        height: 100.h,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  AppConstants.tasbihList[
                                      controller.selectedIndexTasbihList],
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryColor,
                                      fontFamily: '')),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SegmentTextWidget(
                          value: '${controller.tasbihCounterTemp}'),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child: Row(
                          children: [
                            CustomIconBackGround(
                              icon: Icons.replay_rounded,
                              onTap: controller.tasbihReset,
                            ),
                            const Spacer(),
                            CustomIconBackGround(
                              icon: Icons.autorenew,
                              onTap: controller.changeSelectedTasbihIndex,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: controller.tasbihIncrement,
                        child: Container(
                          width: 125,
                          height: 125,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(-8, 4),
                                    spreadRadius: 2,
                                    blurRadius: 20,
                                    color: Colors.black.withOpacity(0.25),
                                    blurStyle: BlurStyle.normal)
                              ],
                              borderRadius: BorderRadius.circular(75.r),
                              color: AppColor.primaryColor),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: AppColor.cardColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: AppColor.primaryColor),
                            SizedBox(width: 5.w),
                            Text(
                              'اضف تسبيحة',
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
