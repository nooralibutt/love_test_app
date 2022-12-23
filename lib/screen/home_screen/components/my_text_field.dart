import 'package:love_test_app/utils/all_utilities.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  const MyTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
      child: TextField(
        style: const TextStyle(
          fontSize: 30,
        ),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                fontSize: 80.sp),
            isDense: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.all(22),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            )
        ),
      ),
    );
  }
}
