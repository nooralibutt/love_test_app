import 'package:love_test_app/utils/all_utilities.dart';

class IconCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const IconCard({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 290.w,
      decoration: BoxDecoration(
          color: const Color(0xFF595862),
          borderRadius: BorderRadius.circular(30.sm)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, color: Colors.white, size: 120.h),
            SizedBox(height: 40.h),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 40.sp),
            )
          ],
        ),
      ),
    );
  }
}
