import 'package:quran_app/core/export/export.dart';
import 'package:quran_app/view/widgets/custom_list_tile.dart';

class PageView02 extends StatelessWidget {
  const PageView02({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 270.h,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: AppConstants.listView02Color.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (BuildContext context, int index) {
            return CustomListTile(
                color: AppConstants.listView02Color[index],
                title: AppConstants.listView02Title[index],
                subTitle: AppConstants.listView02SubTitle[index]);
          },
        ));
  }
}
