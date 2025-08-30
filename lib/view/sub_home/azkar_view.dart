import 'package:quran_app/core/export/export.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: GetBuilder(
                  init: HomeController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        CustomAppBar(
                          onTap: () => Get.back(),
                          title: 'الاذكار',
                          leftIcon: AppImage.arrow,
                          centerTitle: true,
                        ),
                        SizedBox(height: 16.h),
                        switch (controller.status) {
                          Status.success => ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: 45.h),
                              itemCount: controller.isOpenList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: 16);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    ListViewItemBuilder(
                                      onTap: () =>
                                          controller.openDropDown(index),
                                      title: controller.items[index].category
                                          .toString(),
                                      isOpened: controller.isOpenList[index],
                                    ),
                                    controller.isOpenList[index]
                                        ? SizedBox(
                                            height: 10.h,
                                          )
                                        : const SizedBox(),
                                    controller.isOpenList[index]
                                        ? ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            separatorBuilder:
                                                (context, index) =>
                                                    SizedBox(height: 10.h),
                                            itemCount: controller
                                                .items[index].array!.length,
                                            itemBuilder: (context, subIndex) {
                                              return Column(
                                                children: [
                                                  Container(
                                                    width: 345.w,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffF0E6D2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.r)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 16.h,
                                                              horizontal: 10.w),
                                                      child: Text(
                                                        controller
                                                            .items[index]
                                                            .array![subIndex]
                                                            .text
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontFamily: '',
                                                            fontSize: 18.sp,
                                                            color: AppColor
                                                                .primaryColor),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            })
                                        : const SizedBox()
                                  ],
                                );
                              },
                            ),
                          Status.init => Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3),
                                  CircularProgressIndicator(
                                    color: AppColor.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          Status.loading => Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3),
                                  CircularProgressIndicator(
                                      color: AppColor.primaryColor),
                                ],
                              ),
                            ),
                          Status.error => Column(
                              children: [
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 3),
                                const Center(
                                  child: Text('حدث خطأ في التحميل'),
                                ),
                              ],
                            ),
                        }
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
