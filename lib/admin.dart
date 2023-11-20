import 'package:flutter/material.dart';
import 'package:mongrh/Controller/pageController.dart';
import 'package:mongrh/mes_logiques/services.dart';
import 'package:provider/provider.dart';

class Bienvenu extends StatefulWidget {
  const Bienvenu({super.key});

  @override
  State<Bienvenu> createState() => _BienvenuState();
}

class _BienvenuState extends State<Bienvenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1359,
      height: 600,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
              left: 633,
              top: 155,
              child: Container(
                width: 589,
                height: 348,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/milieu.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(41),
                      ),
                ),
              )),
          const Positioned(
            left: 702,
            top: 41,
            child: SizedBox(
              width: 479,
              height: 84,
              child: Text(
                'Vous êtes administrateur\nde “Mon GRH”',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Positioned(
            left: 176.57,
            top: 433,
            child: SizedBox(
              width: 261.15,
              height: 49.16,
              child: Stack(
                children: [
                  Positioned(
                    left: 32.43,
                    top: 0,
                    child: Container(
                      width: 180,
                      height: 42,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF4E5394),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 8.34,
                    child: SizedBox(
                        width: 261.15,
                        height: 40.82,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardFirst()));
                          },
                          child: const Text(
                            'Commencer',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                decoration: TextDecoration.none),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 142,
            top: 24,
            child: Container(
              width: 325,
              height: 320,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class MenuDashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MonGRH',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MonGRHPage(),
//     );
//   }
// }

// class MonGRHPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bienvenu sur votre application MonGRH'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(Icons.menu, size: 50),
//             Text('Contrat'),
//             Icon(Icons.document_scanner_sharp, size: 50),
//             Text('CV'),
//             Icon(Icons.back_hand, size: 50),
//             Text('Motivation'),
//             Icon(Icons.handshake, size: 50),
//             Text('Entretien'),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DashboardFirst extends StatefulWidget {
  const DashboardFirst({super.key});

  @override
  State<DashboardFirst> createState() => _DashboardFirstState();
}

class _DashboardFirstState extends State<DashboardFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 1039,
      height: 408,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: Color(0xFF4E5394)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 138,
                      height: 152,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/contrat.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text(
                      'Contrat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 138,
                      height: 152,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/entretien.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text(
                      'Entretian',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 138,
                      height: 152,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Cvs.Webp"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text(
                      'Cv',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 138,
                      height: 152,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Cvs.Webp"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text(
                      'Motivation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  _NavigationRailExampleState createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  late int _selectedIndex;
  List<Widget> listPage = [
    const ContratAdmin(),
    const DashboardFirst(),
    const CvAdmin()
  ];

  @override
  initState() {
    super.initState();

    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            NavigationRail(
              minExtendedWidth: 300,
              minWidth: 100,
              leading: Container(),
              selectedIndex: _selectedIndex,
              destinations: _buildDestinations(),
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            const VerticalDivider(),
            Expanded(
              child: listPage[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }

  List<NavigationRailDestination> _buildDestinations() {
    Icon icon = const Icon(Icons.check_circle_outline);

    return [
      NavigationRailDestination(
        icon: icon,
        label: const Text('Contrat'),
      ),
      NavigationRailDestination(
        icon: icon,
        label: const Text('Menu 2'),
      ),
      NavigationRailDestination(
        icon: icon,
        label: const Text('Menu 3'),
      ),
    ];
  }
}

// class NavigationRailExampleApp extends StatelessWidget {
//   const NavigationRailExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: NavRailExample(),
//     );
//   }
// }

// class NavRailExample extends StatefulWidget {
//   const NavRailExample({super.key});

//   @override
//   State<NavRailExample> createState() => _NavRailExampleState();
// }

// class _NavRailExampleState extends State<NavRailExample> {
//   int _selectedIndex = 0;
//   NavigationRailLabelType labelType = NavigationRailLabelType.all;
//   bool showLeading = false;
//   bool showTrailing = false;
//   double groupAlignment = -1.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: <Widget>[
//           NavigationRail(
//             selectedIndex: _selectedIndex,
//             groupAlignment: groupAlignment,
//             onDestinationSelected: (int index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             labelType: labelType,
//             leading: showLeading
//                 ? FloatingActionButton(
//                     elevation: 0,
//                     onPressed: () {
//                       // Add your onPressed code here!
//                     },
//                     child: const Icon(Icons.add),
//                   )
//                 : const SizedBox(),
//             trailing: showTrailing
//                 ? IconButton(
//                     onPressed: () {
//                       // Add your onPressed code here!
//                     },
//                     icon: const Icon(Icons.more_horiz_rounded),
//                   )
//                 : const SizedBox(),
//             destinations: const <NavigationRailDestination>[
//               NavigationRailDestination(
//                 icon: Icon(Icons.favorite_border),
//                 selectedIcon: Icon(Icons.favorite),
//                 label: Text('First'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.bookmark_border),
//                 selectedIcon: Icon(Icons.book),
//                 label: Text('Second'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.star_border),
//                 selectedIcon: Icon(Icons.star),
//                 label: Text('Third'),
//               ),
//             ],
//           ),
//           const VerticalDivider(thickness: 1, width: 1),
//           // This is the main content.
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text('selectedIndex: $_selectedIndex'),
//                 const SizedBox(height: 20),
//                 Text('Label type: ${labelType.name}'),
//                 const SizedBox(height: 10),
//                 OverflowBar(
//                   spacing: 10.0,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           labelType = NavigationRailLabelType.none;
//                         });
//                       },
//                       child: const Text('None'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           labelType = NavigationRailLabelType.selected;
//                         });
//                       },
//                       child: const Text('Selected'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           labelType = NavigationRailLabelType.all;
//                         });
//                       },
//                       child: const Text('All'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Text('Group alignment: $groupAlignment'),
//                 const SizedBox(height: 10),
//                 OverflowBar(
//                   spacing: 10.0,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           groupAlignment = -1.0;
//                         });
//                       },
//                       child: const Text('Top'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           groupAlignment = 0.0;
//                         });
//                       },
//                       child: const Text('Center'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           groupAlignment = 1.0;
//                         });
//                       },
//                       child: const Text('Bottom'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 OverflowBar(
//                   spacing: 10.0,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           showLeading = !showLeading;
//                         });
//                       },
//                       child:
//                           Text(showLeading ? 'Hide Leading' : 'Show Leading'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           showTrailing = !showTrailing;
//                         });
//                       },
//                       child: Text(
//                           showTrailing ? 'Hide Trailing' : 'Show Trailing'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ContratAdmin extends StatefulWidget {
  const ContratAdmin({super.key});

  @override
  State<ContratAdmin> createState() => _ContratAdminState();
}

class _ContratAdminState extends State<ContratAdmin> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 1300,
        height: 600,
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 3, 46, 82),
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromARGB(255, 238, 235, 235),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Les types de contrat du travail',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E5394),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  width: 172,
                  height: 173,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: 1039,
                height: 408,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Color(0xFF4E5394)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/contrat.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'CDD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/contrat.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'CDD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/contrat.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'CDD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/contrat.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'CDD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/contrat.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'CDD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/contrat.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'CDD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 3, 57, 102),
                            size: 40,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CvAdmin extends StatefulWidget {
  const CvAdmin({super.key});

  @override
  State<CvAdmin> createState() => _CvAdminState();
}

class _CvAdminState extends State<CvAdmin> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 1300,
        height: 600,
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 3, 46, 82),
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromARGB(255, 238, 235, 235),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Curriculum vitae',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E5394),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  width: 172,
                  height: 173,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: 1039,
                height: 408,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Color(0xFF4E5394)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Généralité',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Structure',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Contenu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Exemplaire',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Rédaction',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Color.fromARGB(255, 3, 57, 102),
                          size: 40,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MotivationAdmin extends StatefulWidget {
  const MotivationAdmin({super.key});

  @override
  State<MotivationAdmin> createState() => _MotivationAdminState();
}

class _MotivationAdminState extends State<MotivationAdmin> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 1300,
        height: 600,
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 3, 46, 82),
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromARGB(255, 238, 235, 235),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Curriculum vitae',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E5394),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  width: 172,
                  height: 173,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: 1039,
                height: 408,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Color(0xFF4E5394)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Généralité',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Structure',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Contenu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Exemplaire',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Cvs.Webp"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Rédaction',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Color.fromARGB(255, 3, 57, 102),
                          size: 40,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EntretienAdmin extends StatefulWidget {
  const EntretienAdmin({super.key});

  @override
  State<EntretienAdmin> createState() => _EntretienAdminState();
}

class _EntretienAdminState extends State<EntretienAdmin> {
  @override
  Widget build(BuildContext context) {
    final entretienAdminController = context.watch<EntretienAdminController>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 1300,
        height: 600,
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 3, 46, 82),
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromARGB(255, 238, 235, 235),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Entretien',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E5394),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  width: 172,
                  height: 173,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: 1039,
                height: 408,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Color(0xFF4E5394)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/entretien.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Généralité',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/entretien.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Préparation',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/entretien.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Questions',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 138,
                              height: 152,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/entretien.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Coachs',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4E5394),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(Icons.delete),
                                Icon(Icons.edit_square)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            entretienAdminController.gotoAddEntretien();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const AjoutEntretien()));
                          },
                          child: const Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 3, 57, 102),
                            size: 40,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Ajouter un élément de l'entretien
class AjoutEntretien extends StatefulWidget {
  const AjoutEntretien({super.key});

  @override
  State<AjoutEntretien> createState() => _AjoutEntretienState();
}

class _AjoutEntretienState extends State<AjoutEntretien> {
  @override
  Widget build(BuildContext context) {
    // Future<void> _initFirebase() async {
    //   await Firebase.initializeApp();
    // }
    final enregistrer = context.watch<EntretienAdminController>();
    final service = ElementEntretienService();
    // Créez les champs de saisie
    final titreController = TextEditingController();
    final contenuController = TextEditingController();

// Récupérez les valeurs saisies par l'utilisateur
    final titre = titreController.text;
    final contenu = contenuController.text;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 3, 46, 82),
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Color.fromARGB(255, 238, 235, 235),
                    ),
                  ),
                  const Text(
                    'Ajouter la préparation d’un entretien',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E5394),
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Container(
                    width: 172,
                    height: 173,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 900,
              height: 401,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3, color: Color(0xFF4E5394)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nom'),
                        Container(
                          width: 849,
                          height: 78,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(1, 1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              controller: titreController,
                              decoration: const InputDecoration(
                                hintText: 'Saisissez ici',
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Contenu'),
                        Container(
                          width: 849,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(1, 1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              controller: contenuController,
                              decoration: const InputDecoration(
                                hintText: 'Saisissez ici',
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 800,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Couleur de fond du bouton
                    ),
                    child: const Text(
                      "Annuler",
                      style: TextStyle(
                        color: Colors.white, // Couleur du texte du bouton
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // print("hello");
                      // // Créez l'objet ElementEntretien
                      // final elementEntretien = ElementEntretien(
                      //   titre: titreController.text,
                      //   contenu: contenuController.text,
                      // );
                      // print("half");
                      // await service.ajouterElementEntretien(elementEntretien);
                      // print("hell");
                      await enregistrer.gotoListEntretien();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF4E5394), // Couleur de fond du bouton
                    ),
                    child: const Text(
                      "Enregistrer",
                      style: TextStyle(
                        color: Colors.white, // Couleur du texte du bouton
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoachsAdmin extends StatefulWidget {
  const CoachsAdmin({super.key});

  @override
  State<CoachsAdmin> createState() => _CoachsAdminState();
}

class _CoachsAdminState extends State<CoachsAdmin> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          SizedBox(
            width: 953,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 3, 46, 82),
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromARGB(255, 238, 235, 235),
                  ),
                ),
                const Text(
                  'Liste des coachs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4E5394),
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Container(
                  width: 161,
                  height: 161,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 900,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Images',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xE02D3030),
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  'Noms',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xE02D3030),
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  'Adresses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xE02D3030),
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  'Actions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xE02D3030),
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 953,
            height: 398,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 3, color: Color(0xFF4E5394)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: ListView(
              children: [
                Container(
                  width: 500,
                  height: 91,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(1, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/profil.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(
                            side:
                                BorderSide(width: 4, color: Color(0xFF9D9D9D)),
                          ),
                        ),
                      ),
                      Text(
                        'TRAORE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6499999761581421),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Text(
                        '000000000',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6499999761581421),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            Icon(Icons.edit_square),
                            Icon(Icons.delete_sharp)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
