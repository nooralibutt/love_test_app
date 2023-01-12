import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/services/ad_manager.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:love_test_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AdManager.instance.initialize();
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
            initialRoute: HomeScreen.routeName,
            routes: routes,
          );
        });
  }
}
