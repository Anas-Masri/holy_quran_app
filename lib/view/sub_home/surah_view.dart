import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/core/export/export.dart';

class SurahView extends StatefulWidget {
  const SurahView({super.key});

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  int selectedIndex = 0; // الشيخ المختار حالياً

  int surahNumber = 0;
  getSuraNumber() {
    surahNumber = ModalRoute.of(context)!.settings.arguments as int;
  }

  bool isPlaying = false;
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     final surahNumber = ;
  //     // await player.setUrl(quran.getAudioURLBySurah(
  //     //     settings.arguments as int, 'alafasy'));
  //     getDuration(surahNumber);
  //   });
  // }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      surahNumber = ModalRoute.of(context)!.settings.arguments as int;
      getDuration(surahNumber);
    });
  }

  Future<void> playFullSurah(int surahNumber) async {
    final List<AudioSource> versesSources = [];
    final int count = quran.getVerseCount(surahNumber);

    for (int i = 1; i <= count; i++) {
      final url = quran.getAudioURLByVerse(surahNumber, i, 'alafasy');
      versesSources.add(AudioSource.uri(Uri.parse(url)));
    }

    await player
        .setAudioSource(ConcatenatingAudioSource(children: versesSources));
    await player.play();
  }
// void initState() {
//   super.initState();
//   Future.delayed(Duration.zero, () async {
//     await player.setUrl(quran.getAudioURLBySurah(surahNumber, 'alafasy'));
//   });
// }

  final player = AudioPlayer();
  // Create a player
  String buildFullSurah(List<String> verses) {
    String result = "";
    for (int i = 0; i < verses.length; i++) {
      result += "${verses[i]} ﴿${Utiles.convertToArabicNumbers('${i + 1}')}﴾ ";
    }
    return result;
  }

  String builedVers(index) {
    return "﴿${Utiles.convertToArabicNumbers('${index + 1}')}﴾";
  }

  Future<void> getDuration(int surahNumber) async {
    Future.delayed(Duration.zero, () async {
      await player.setUrl(quran.getAudioURLBySurah(surahNumber, 'alafasy'));
    });
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    List<String> ayahs = [];
    final List<Map<String, String>> reciters = [
      {
        'name': 'الشيخ مشاري راشد العفاسي',
        'image': 'assets/images/qurra/afasi.jpg'
      },
      {
        'name': 'الشيخ عبد الباسط عبد الصمد',
        'image': 'assets/images/qurra/abd_albaset_abd_alsamad.jpg'
      },
      {'name': 'الشيخ ماهر المعيقلي', 'image': 'assets/images/qurra/maher.jpg'},
      {
        'name': 'الشيخ سعود الشريم',
        'image': 'assets/images/qurra/saud_shrim.jpg'
      },
    ];
    // getDuration(settings.arguments as int);

    List.generate(
        quran.getVerseCount(settings.arguments as int),
        (index) =>
            ayahs.add(quran.getVerse(settings.arguments as int, index + 1)));
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
              barrierDismissible: true,
              builder: (context) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // المربع الرئيسي للشيخ المختار
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                reciters[selectedIndex]['image']!,
                                height: 150.h,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                reciters[selectedIndex]['name']!,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30.h),

                        // قائمة المشايخ للتحديد
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height / 2,
                          child: GridView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 4,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: reciters.length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    Get.back(); // لإغلاق القائمة إذا كنت تستخدم GetX
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.orange
                                        : Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(16.r),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        child: Image.asset(
                                          reciters[index]['image']!,
                                          width: 100.w,
                                          height: 100.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      Text(
                                        reciters[index]['name']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              context: context);
        },
        child: Container(
          alignment: Alignment.center,
          width: 319.w,
          height: 67.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColor.orangeColor),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                AppImage.affasi,
                width: 70.w,
                height: 70.h,
              ),
            ),
            title: const Text(
              'القارئ الشيخ مشاري راشد العفاسي',
              textAlign: TextAlign.end,
            ),
            trailing: GestureDetector(
              onTap: () async {
                if (isPlaying) {
                  isPlaying = false;
                  setState(() {});

                  await player.pause();
                } else {
                  isPlaying = true;
                  setState(() {});

                  Future.delayed(
                    Duration.zero,
                    () {
                      playFullSurah(surahNumber).then((_) {
                        isPlaying = false;

                        setState(() {});
                      });
                    },
                  );

                  // isPlaying = false;
                  // setState(() {});
                }
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor, shape: BoxShape.circle),
                child: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.appBackgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 5),
                      Text(
                          'سورة ${quran.getSurahNameArabic(settings.arguments as int)}',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          )),
                      const Spacer(flex: 4),
                      GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColor.primaryColor,
                          )),
                    ],
                  ),

                  SizedBox(height: 10.h),
                  (settings.arguments == 1 || settings.arguments == 9)
                      ? const SizedBox()
                      : Text(
                          textAlign: TextAlign.center,
                          quran.basmala,
                          style: TextStyle(
                              height: 1,
                              fontSize: 36.sp,
                              color: Colors.red,
                              fontFamily: ''),
                        ),
                  SizedBox(height: 10.h),

                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: ayahs.length,
                      itemBuilder: (context, index) {
                        final verse = ayahs[index];
                        final verseNumber =
                            Utiles.convertToArabicNumbers('${index + 1}');
                        return GestureDetector(
                          onTap: () async {
                            await player.setUrl(quran.getAudioURLByVerse(
                                settings.arguments as int,
                                index + 1,
                                'alafasy'));
                            player.play();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              color: AppColor.cardColor,
                              child: Text(
                                "$verse ﴿$verseNumber﴾",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 2.2,
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                  fontFamily: 'Amiri',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Text(
                  //   textAlign: TextAlign.justify,
                  //   buildFullSurah(ayahs),
                  //   style: TextStyle(
                  //       height: 2.5,
                  //       fontSize: 20.sp,
                  //       color: Colors.black,
                  //       fontFamily: 'Amiri'),
                  // )

                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height - 110,
                  //   child: ListView.separated(
                  //     // scrollDirection: Axis.horizontal,
                  //     separatorBuilder: (context, index) => SizedBox(
                  //       height: 10.h,
                  //     ),
                  //     itemCount: quran.getVerseCount(settings.arguments as int),
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Container(
                  //         color: index % 2 == 0
                  //             ? AppColor.cardColor.withOpacity(0.25)
                  //             : AppColor.cardColor.withOpacity(0.5),
                  //         child: Text(
                  //           textAlign: TextAlign.center,
                  //           ayahs[index],
                  //           style: TextStyle(
                  //               fontSize: 24.sp,
                  //               color: Colors.black,
                  //               fontFamily: 'Amiri'),
                  //         ),
                  //       );
                  //       // return Text(
                  //       //   style: TextStyle(
                  //       //       fontSize: 24.sp,
                  //       //       color: Colors.black,
                  //       //       fontFamily: 'Amiri'),
                  //       //   quran.getVerse(
                  //       //     settings.arguments as int,
                  //       //     index + 1,
                  //       //   ),
                  //       // );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*







                  SizedBox(
                    height: MediaQuery.of(context).size.height - 100.h,
                    child: ListView.separated(
                        itemCount: quran.totalSurahCount,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(Routes.surahView,
                                arguments: index + 1),
                            child: CustomSuraItemBuilder(
                              pageNumber: quran.getSurahPages(index + 1).first,
                              location: AppConstants.surahTypes[index] == 1
                                  ? 'مدينة'
                                  : 'مكية',
                              ayahCount: quran.getVerseCount(index + 1),
                              suraName: quran.getSurahNameArabic(index + 1),
                              suraNumber: index + 1,
                            ),
                          );
                        }),
                  )

*/