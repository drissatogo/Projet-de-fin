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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/Controller/pageController.dart';
import 'package:mongrh/admin.dart';
import 'package:mongrh/firebase_options.dart';
import 'package:mongrh/utilisateur.dart';
import 'package:provider/provider.dart';

// Future<void> main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     ChangeNotifierProvider<EntretienAdminController>(
//       create: (_) => EntretienAdminController(),
//       child: const MaterialApp(
//         home: MyHomePage(),
//       ),
//     ),
//   );
// }

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<EntretienAdminController>(
          create: (_) => EntretienAdminController(),
        ),
        ChangeNotifierProvider<ContratAdminController>(
          create: (_) => ContratAdminController(),
        ),
         ChangeNotifierProvider<DocumentController>(
          create: (_) => DocumentController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageInscription(),
      ),
    ),
  );
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
        page = const ContratAdminPage();
        break;
      case 1:
        page = const EntretienPage();
        break;
      case 2:
        page = const CoachsAdmin();
      case 3:
        page = const DocumentPage();
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
                  // color: Theme.of(context).colorScheme.primaryContainer,
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

class Demarrage extends StatefulWidget {
  const Demarrage({super.key});

  @override
  State<Demarrage> createState() => _DemarrageState();
}

class _DemarrageState extends State<Demarrage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/milieu.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Bienvenu()));
                        },
                        child: const Text(
                          'Continuer en tant qu’Admin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF4E5394),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PremierePage()));
                        },
                        child: const Text(
                          'Continuer en tant qu’Utilisateur',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF4E5394),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
