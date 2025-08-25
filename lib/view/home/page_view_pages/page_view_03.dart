import 'package:quran_app/core/export/export.dart';

class PageView03 extends StatelessWidget {
  const PageView03({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 7.5.w,
            childAspectRatio: 0.9),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 134.h,
            width: 110.w,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 3, color: AppColor.primaryColor)),
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.cardColor),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Image.asset(AppConstants.gridViewImages[index],
                    width: 52.w, height: 52.h),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 74.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    AppConstants.gridViewTitle[index],
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
