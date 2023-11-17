// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mongrh/admin.dart';
// import 'package:mongrh/controller/artisan_controller.dart';
// import 'package:mongrh/controller/culture_controller.dart';
// import 'package:mongrh/controller/side_bar/side_bar_controller.dart';
// import 'package:mongrh/controller/side_bar/side_bar_page.dart';
// import 'package:mongrh/firebase_options.dart';
// import 'package:mongrh/tiroir/welcom.dart';
// import 'package:provider/provider.dart';

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

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   if (!kIsWeb) {
//     runApp(const ContratAdmin());
//   } else {
//     runApp(
//       const AjoutEntretien(),
//     );
//   }
// }

// void main() {
//  runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//  const MyApp({super.key});
//  @override
//  Widget build(BuildContext context) {
//  return MaterialApp(
//  title: 'Navigation Drawer Tutorial',
//  theme: ThemeData(
//  primarySwatch: Colors.blue,
//  ),
//  home: const HomeScreen(title: 'Home'),
//  );
//  }
// }

// @override
// Widget build(BuildContext context) {
//   return MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => SideBarController(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => ArtisanController(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => CultureController(),
//       ),
//     ],
//     child: MaterialApp(
//       home: const SideBarPage(),
//     ),
//   );
// }

// import 'package:myapp/home.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/admin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MyAppState>(
      create: (_) => MyAppState(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}

class MyAppState extends ChangeNotifier {
  var selectedIndex = 0;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const ContratAdmin();
        break;
      case 1:
        page = const EntretienAdmin();
        break;
      case 2:
        page = const CoachsAdmin();
      case 3:
        page = const CvAdmin();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600, // ← Here.
                  destinations: [
                    NavigationRailDestination(
                      icon: Image.asset(
                        'assets/images/conticon.png',
                        width: 35,
                        height: 35,
                      ),
                      label: const Text('Contrat'),
                    ),
                    NavigationRailDestination(
                      icon: Image.asset(
                        'assets/images/entretienicon.png',
                        width: 35,
                        height: 35,
                      ),
                      label: const Text('Entretien'),
                    ),
                    NavigationRailDestination(
                      icon: Image.asset(
                        'assets/images/coach.png',
                        width: 35,
                        height: 35,
                      ),
                      label: const Text('Coachs'),
                    ),
                    NavigationRailDestination(
                      icon: Image.asset(
                        'assets/images/ecrit.png',
                        width: 35,
                        height: 35,
                      ),
                      label: const Text('Documents'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
