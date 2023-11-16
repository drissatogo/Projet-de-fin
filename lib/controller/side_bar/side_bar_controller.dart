// import 'package:faker/faker.dart';
// import 'package:fluent/home/home_page.dart';
// import 'package:fluent/parametre/parametre_page.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/admin.dart';

class SideBarController extends ChangeNotifier {
  bool isExtended;
  int index;

  SideBarController({
    this.isExtended = true,
    this.index = 0,
  });

  void toggleNavigation() {
    isExtended = !isExtended;
    notifyListeners();
  }

  void changePage(int value) {
    index = value;
    notifyListeners();
  }

  late Widget navigationRail;

  final pages = [
    const ContratAdmin(),
    const CvAdmin(),
    const EntretienAdmin(),
    const MotivationAdmin(),
  ];

  Widget get page {
    return pages[index];
  }

  initNavigationRail() {
    navigationRail = NavigationRail(
      backgroundColor: const Color.fromARGB(255, 1, 47, 70),
      extended: isExtended,
      leading:   Container(
                  width: 150,
                  height: 150,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/logo.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
      onDestinationSelected: changePage,
      destinations: [
        NavigationRailDestination(
          icon:  Image.asset(
                                'assets/images/entretienicon.png',
                                width: 35,
                                height: 35,
                              ),
          label: const Text(
                                'Entretien',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF4E5394),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
        ),
        NavigationRailDestination(
          icon: Image.asset(
                                'assets/images/conticon.png',
                                width: 35,
                                height: 35,
                              ),
          label: const Text(
                                'Contrat',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF4E5394),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
        ),
        NavigationRailDestination(
          icon: Image.asset(
                                'assets/images/ecrit.png',
                                width: 35,
                                height: 35,
                              ),
          label: const Text(
                                'Cv',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF4E5394),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
        ),
        NavigationRailDestination(
          icon: Image.asset(
                                'assets/images/ecrit.png',
                                width: 35,
                                height: 35,
                              ),
          label: const Text(
                                'Cv',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF4E5394),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
        ),
      ],
      selectedIndex: index,
    );
  }
}
