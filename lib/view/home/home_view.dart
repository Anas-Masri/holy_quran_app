import 'package:quran_app/core/export/export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GetBuilder(
                init: HomeController(),
                builder: (controller) {
                  return Column(
                    children: [
                      SizedBox(height: 41.h),
                      CustomAppBar(
                        leftIcon: AppImage.search,
                        title: 'القرآن الكريم',
                      ),
                      SizedBox(height: 30.h),
                      const CustomCardWidget(),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Text('الآيات اليومية',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          const Spacer(),
                          Text(
                            'سورة الفاتحة',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const AyaCard(),
                      SizedBox(height: 10.h),
                      const CustomRowIndicator(
                        selectedIndex: 0,
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        height: 41.h,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 5.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 10.w);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return CustomTapButton(
                              onTap: () => controller.changeTap(index),
                              isSelected: controller.currentIndex == index,
                              title: AppConstants.tapBarTitle[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          children: [
                            PageView01(
                              onTap: (p0) =>
                                  controller.navigateToAzkarDetails(p0),
                            ),
                            const PageView02(),
                            const PageView03(),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ));
  }
}
