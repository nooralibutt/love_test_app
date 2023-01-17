import 'package:love_test_app/screen/splash/splash_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:love_test_app/utils/prefs.dart';
import 'package:love_test_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1460, 2960),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            initialRoute: SplashScreen.routeName,
            routes: routes,
          );
        });
  }
}
