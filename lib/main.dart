// import 'package:myapp/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/Controller/pageController.dart';
import 'package:mongrh/admin.dart';
import 'package:mongrh/firebase_options.dart';
import 'package:mongrh/mes_logiques/mes_classes.dart';
import 'package:mongrh/utilisateur.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: MyApp()),
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
  // late final Users user;

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
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/milieu.png",
                        ),
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
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                         
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConnexionAdmin(
                                        // users: user,
                                      )));
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
                        behavior: HitTestBehavior.opaque,
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Demarrage()),
        );
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _animation,
                child: ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: Text(
                      'MonGrh, une application qui contribue à votre insertion professionnelle et à la pérennité de votre emploi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent.withOpacity(_animation.value),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
