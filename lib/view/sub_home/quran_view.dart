import 'package:quran/quran.dart' as quran;
import 'package:quran_app/core/export/export.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'القرآن الكريم',
                    leftIcon: AppImage.search,
                    centerTitle: true,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 100.h,
                    child: ListView.separated(
                        itemCount: quran.totalSurahCount,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          return CustomSuraItemBuilder(
                            pageNumber: quran.getSurahPages(index + 1).first,
                            location: AppConstants.surahTypes[index] == 1
                                ? 'مدينة'
                                : 'مكية',
                            ayahCount: quran.getVerseCount(index + 1),
                            suraName: quran.getSurahNameArabic(index + 1),
                            suraNumber: index + 1,
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
