import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/admin.dart';
import 'package:mongrh/controller/artisan_controller.dart';
import 'package:mongrh/controller/culture_controller.dart';
import 'package:mongrh/controller/side_bar/side_bar_controller.dart';
import 'package:mongrh/controller/side_bar/side_bar_page.dart';
import 'package:mongrh/firebase_options.dart';
import 'package:provider/provider.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     theme: ThemeData(fontFamily: 'Roboto'),
//     home: const SideBarPage(),
//   ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (!kIsWeb) {
    runApp(const ContratAdmin());
  } else {
    runApp(
      const AjoutEntretien(),
    );
  }
}

@override
Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SideBarController(),
      ),
      ChangeNotifierProvider(
        create: (context) => ArtisanController(),
      ),
      ChangeNotifierProvider(
        create: (context) => CultureController(),
      ),
    ],
    child: MaterialApp(
      home: const SideBarPage(),
    ),
  );
}
