import 'package:quran_app/core/export/export.dart';

class SegmentTextWidget extends StatelessWidget {
  const SegmentTextWidget({super.key, required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 257.w,
        height: 83.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.cardColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: SevenSegmentDisplay(
            characterSpacing: 15.w,
            segmentStyle: DefaultSegmentStyle(
              disabledColor: Colors.transparent,
              enabledColor: AppColor.primaryColor.withOpacity(0.75),
              segmentBaseSize: const Size(1.7, 3),
              segmentSpacing: 6,
            ),
            backgroundColor: AppColor.cardColor,
            value: value,
            size: 5.0));
  }
}
