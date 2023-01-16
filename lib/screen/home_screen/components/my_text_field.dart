import 'package:love_test_app/utils/all_utilities.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;

  const MyTextField({Key? key, required this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 250.w, vertical: 70.h),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 80.sp,
        ),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 80.sp),
            isDense: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.all(22),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }
}
