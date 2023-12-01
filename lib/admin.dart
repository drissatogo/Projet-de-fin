import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mongrh/Controller/pageController.dart';
import 'package:mongrh/main.dart';
import 'package:mongrh/mes_logiques/services.dart';
import 'package:provider/provider.dart';

import 'mes_logiques/mes_classes.dart';

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
                                        const ConnexionAdmin()));
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

class ConnexionAdmin extends StatefulWidget {
  const ConnexionAdmin({super.key});

  @override
  State<ConnexionAdmin> createState() => _ConnexionAdminState();
}

class _ConnexionAdminState extends State<ConnexionAdmin> {
  @override
  Widget build(BuildContext context) {
    // Initialise le package flutter_screenutil
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 746,
              top: 108,
              child: Container(
                width: 506,
                height: 270,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.50),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 785,
              top: 170,
              child: Container(
                width: 431,
                height: 52,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
                ),
              ),
            ),
            Positioned(
              left: 785,
              top: 268,
              child: Container(
                width: 431,
                height: 52,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
                ),
              ),
            ),
            Positioned(
              left: 808,
              top: 182,
              child: SizedBox(
                width: 400,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.31),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 802,
              top: 280,
              child: SizedBox(
                width: 400,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Mot de passe',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.31),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 196,
              top: 82,
              child: Container(
                width: 387,
                height: 385,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 901,
              top: 444,
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
                                    builder: (context) => const MyHomePage()));
                          },
                          child: const Text(
                            'Se connecter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ContratAdmin extends StatefulWidget {
//   const ContratAdmin({super.key});

//   @override
//   State<ContratAdmin> createState() => _ContratAdminState();
// }

// class _ContratAdminState extends State<ContratAdmin> {

//  List<Contrat> lescontrats = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   void fetchData() async {
//     try {
//       CollectionReference<Map<String, dynamic>> lescontratsCollection =
//           FirebaseFirestore.instance.collection('Contrat');

//       QuerySnapshot<Map<String, dynamic>> lescontratsSnapshot =
//           await lescontratsCollection.get();

//       List<Contrat> items = lescontratsSnapshot.docs
//           .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
//         Map<String, dynamic> data = doc.data();
//         return Contrat(
//           // sigle: data['sigle'] as String,
//           type: data['type'] as String,
//           description: data['description'] as String,
//           droits: data['droits'] as String,
//           devoirs: data['devoirs'] as String,
//         );
//       }).toList();

//       setState(() {
//         lescontrats = items;
//       });
//     } catch (e) {
//       print('Erreur lors de la récupération des données : $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final ajouterContrat = context.watch<ContratAdminController>();

//     return Scaffold(
//       body: Directionality(
//         textDirection: TextDirection.ltr,
//         child: SizedBox(
//           width: 1300,
//           height: 600,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   Container(),
//                   const Expanded(
//                     child: Text(
//                       'Les types de contrat du travail',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF4E5394),
//                         fontSize: 40,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w700,
//                         height: 0,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 172,
//                     height: 173,
//                     decoration: const ShapeDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/logo.png"),
//                         fit: BoxFit.fill,
//                       ),
//                       shape: OvalBorder(),
//                     ),
//                   )
//                 ],
//               ),
//               Expanded(
//                 child: Container(
//                   width: 1039,
//                   height: 408,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       side:
//                           const BorderSide(width: 3, color: Color(0xFF4E5394)),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 width: 138,
//                                 height: 152,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("assets/images/contrat.jpg"),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'CDD',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xFF4E5394),
//                                       fontSize: 20,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w500,
//                                       height: 0,
//                                     ),
//                                   ),
//                                   Icon(Icons.delete,color: Colors.red,),
//                                   Icon(Icons.edit_square, color: Color(0xFF4E5394),)
//                                 ],
//                               )
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 138,
//                                 height: 152,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("assets/images/contrat.jpg"),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'CDD',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xFF4E5394),
//                                       fontSize: 20,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w500,
//                                       height: 0,
//                                     ),
//                                   ),
//                                   Icon(Icons.delete,color: Colors.red,),
//                                   Icon(Icons.edit_square, color: Color(0xFF4E5394),)
//                                 ],
//                               )
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 138,
//                                 height: 152,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("assets/images/contrat.jpg"),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'CDD',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xFF4E5394),
//                                       fontSize: 20,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w500,
//                                       height: 0,
//                                     ),
//                                   ),
//                                   Icon(Icons.delete,color: Colors.red,),
//                                   Icon(Icons.edit_square, color: Color(0xFF4E5394),)
//                                 ],
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 width: 138,
//                                 height: 152,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("assets/images/contrat.jpg"),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'CDD',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xFF4E5394),
//                                       fontSize: 20,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w500,
//                                       height: 0,
//                                     ),
//                                   ),
//                                   Icon(Icons.delete,color: Colors.red,),
//                                   Icon(Icons.edit_square, color: Color(0xFF4E5394),)
//                                 ],
//                               )
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 138,
//                                 height: 152,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("assets/images/contrat.jpg"),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'CDD',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xFF4E5394),
//                                       fontSize: 20,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w500,
//                                       height: 0,
//                                     ),
//                                   ),
//                                   Icon(Icons.delete,color: Colors.red,),
//                                   Icon(Icons.edit_square, color: Color(0xFF4E5394),)
//                                 ],
//                               )
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 138,
//                                 height: 152,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("assets/images/contrat.jpg"),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'CDD',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xFF4E5394),
//                                       fontSize: 20,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w500,
//                                       height: 0,
//                                     ),
//                                   ),
//                                   Icon(Icons.delete,color: Colors.red,),
//                                   Icon(Icons.edit_square, color: Color(0xFF4E5394),)
//                                 ],
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               // await ajouterContrat.gotoAddContrat();
//                               context
//                                   .read<ContratAdminController>()
//                                   .gotoAddContrat();
//                             },
//                             child: const Icon(
//                               Icons.add_circle,
//                               color: Color.fromARGB(255, 3, 57, 102),
//                               size: 40,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
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
  List<Contrat> lescontrats = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      CollectionReference<Map<String, dynamic>> lescontratsCollection =
          FirebaseFirestore.instance.collection('Contrat');

      QuerySnapshot<Map<String, dynamic>> lescontratsSnapshot =
          await lescontratsCollection.get();

      List<Contrat> items = lescontratsSnapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic> data = doc.data();
        return Contrat(
            // sigle: data['sigle'] as String,
            type: data['type'] as String,
            description: data['description'] as String,
            droits: data['droits'] as String,
            devoirs: data['devoirs'] as String,
            id: doc.id);
      }).toList();
      setState(() {
        lescontrats = items;
      });
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }

  Future<void> supprimerContrat(String? contratId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Contrat')
          .doc(contratId)
          .delete();
      fetchData(); // Rafraîchissez la liste après la suppression
    } catch (e) {
      print('Erreur lors de la suppression du contrat : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          width: 1300,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            // await ajouterContrat.gotoAddContrat();
                            context
                                .read<ContratAdminController>()
                                .gotoAddContrat();
                          },
                          child: const Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 3, 57, 102),
                            size: 40,
                          ),
                        )
                      ],
                    ),
                    const Expanded(
                      child: Text(
                        'Les types de contrat du travail',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4E5394),
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
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
              Expanded(
                child: Container(
                  width: 1039,
                  height: 408,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 3, color: Color(0xFF4E5394)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: (lescontrats.length / 3).ceil(),
                    itemBuilder: (context, index) {
                      int startIndex = index * 3;
                      int endIndex = (index + 1) * 3;
                      endIndex = endIndex > lescontrats.length
                          ? lescontrats.length
                          : endIndex;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(endIndex - startIndex, (i) {
                          var contrat = lescontrats[startIndex + i];
                          return buildContratWidget(contrat);
                        }),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContratWidget(Contrat contrat) {
    final modifier = context.watch<ContratAdminController>();
    return Column(
      children: [
        Column(
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
            Row(
              children: [
                Text(
                  contrat.type,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4E5394),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Supprimer le contrat"),
                            content: Text(
                                "Êtes-vous sûr de vouloir supprimer ce contrat ?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Fermez la boîte de dialogue
                                },
                                child: Text("Annuler"),
                              ),
                              TextButton(
                                onPressed: () {
                                  supprimerContrat(contrat
                                      .id); // Appelez la méthode de suppression
                                  Navigator.of(context)
                                      .pop(); // Fermez la boîte de dialogue
                                },
                                child: Text("Supprimer"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                GestureDetector(
                  onTap: () {
                    modifier.modifierContrat(contrat);
                  },
                  child: Icon(
                    Icons.edit_square,
                    color: Color(0xFF4E5394),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ModifierContrat extends StatefulWidget {
  // final Contrat contrat;
  ModifierContrat();

  @override
  State<ModifierContrat> createState() => _ModifierContratState();
}

class _ModifierContratState extends State<ModifierContrat> {
  // Ajoutez les contrôleurs de texte pour saisir les nouvelles valeurs
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController droitsController = TextEditingController();
  TextEditingController devoirsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialisez les contrôleurs de texte avec les anciennes valeurs du contrat
    // typeController.text = widget.contrat.type;
    // descriptionController.text = widget.contrat.description;
    // droitsController.text = widget.contrat.droits;
    // devoirsController.text = widget.contrat.devoirs;
  }

  @override
  Widget build(BuildContext context) {
    final modifier = context.watch<ContratAdminController>();
    // Initialisez les contrôleurs de texte avec les anciennes valeurs du contrat
    typeController.text = modifier.contrat?.type ?? '';
    descriptionController.text = modifier.contrat?.description ?? '';
    droitsController.text = modifier.contrat?.droits ?? '';
    devoirsController.text = modifier.contrat?.devoirs ?? '';

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context
                                .read<ContratAdminController>()
                                .gotoListContrat();
                        },
                        child: SvgPicture.asset('assets/images/Back.svg',height: 30,width: 30,)),
                    const Text(
                      'Modifier un contrat de travail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 30,
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
                          const Text('Type'),
                          Container(
                            width: 849,
                            height: 50,
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
                              child: TextFormField(
                                // initialValue: modifier.contrat?.type ?? '',
                                controller: typeController,
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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Description'),
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
                              child: TextFormField(
                                // initialValue: modifier.contrat?.description ?? '',
                                controller: descriptionController,
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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Droits'),
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
                              child: TextFormField(
                                // initialValue: modifier.contrat?.droits ?? '',
                                controller: droitsController,
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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Devoirs'),
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
                              child: TextFormField(
                                // initialValue: modifier.contrat?.devoirs ?? '',
                                controller: devoirsController,
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
                        context
                            .read<ContratAdminController>()
                            .gotoListContrat();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Couleur de fond du bouton
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
                        // Récupérez les nouvelles valeurs des champs de texte
                        String newType = typeController.text;
                        String newDescription = descriptionController.text;
                        String newDroits = droitsController.text;
                        String newDevoirs = devoirsController.text;

                        // Obtenez le contrat actuel à partir du ContratAdminController
                        Contrat? contratActuel = modifier.contrat;

                        // Créez un nouveau contrat avec les nouvelles valeurs
                        Contrat nouveauContrat = Contrat(
                          // Vous devez inclure l'id du contrat lors de la mise à jour
                          id: contratActuel?.id,
                          type: newType,
                          description: newDescription,
                          droits: newDroits,
                          devoirs: newDevoirs,
                        );

                        // Appelez la fonction de mise à jour dans le ContratAdminController
                        await context
                            .read<ContratAdminController>()
                            .updateContrat(nouveauContrat);

                        // Naviguez vers la liste des contrats après la mise à jour
                        context
                            .read<ContratAdminController>()
                            .gotoListContrat();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4E5394),
                      ),
                      child: const Text(
                        "Enregistrer",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )

                    // ElevatedButton(
                    //   onPressed: () async {},
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: const Color(
                    //         0xFF4E5394), // Couleur de fond du bouton
                    //   ),
                    //   child: const Text(
                    //     "Enregistrer",
                    //     style: TextStyle(
                    //       color: Colors.white, // Couleur du texte du bouton
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
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
    final ajoutDoc = context.watch<DocumentController>();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ajoutDoc.gotoAddDoc();
                          },
                          child: Icon(
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
  List<ElementEntretien> elements = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      CollectionReference<Map<String, dynamic>> elementsCollection =
          FirebaseFirestore.instance.collection('ElementEntretien');

      QuerySnapshot<Map<String, dynamic>> elementsSnapshot =
          await elementsCollection.get();

      List<ElementEntretien> items = elementsSnapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic>? data = doc.data();
        // Vérifiez la nullité avant d'extraire les valeurs
        return ElementEntretien(
          titre: data?['titre'] as String? ?? '',
          contenu: data?['contenu'] as String? ?? '',
          // Vérifiez si imagePath est nul, sinon utilisez une image par défaut
          imagePath:
              data?['imagePath'] as String? ?? 'assets/images/entretien.jpg',
          id: doc.id,
        );
      }).toList();

      setState(() {
        elements = items;
      });
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }

  Future<void> supprimerEntretien(String? elementId) async {
    try {
      await FirebaseFirestore.instance
          .collection('ElementEntretien')
          .doc(elementId)
          .delete();
      fetchData(); // Rafraîchissez la liste après la suppression
    } catch (e) {
      print('Erreur lors de la suppression du contrat : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          width: 1300,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            // await ajouterContrat.gotoAddContrat();
                            context
                                .read<EntretienAdminController>()
                                .gotoAddEntretien();
                          },
                          child: const Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 3, 57, 102),
                            size: 40,
                          ),
                        )
                      ],
                    ),
                    const Expanded(
                      child: Text(
                        'Les éléments de l\'entretien',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4E5394),
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
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
              Expanded(
                child: Container(
                  width: 1039,
                  height: 408,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 3, color: Color(0xFF4E5394)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: (elements.length / 3).ceil(),
                    itemBuilder: (context, index) {
                      int startIndex = index * 3;
                      int endIndex = (index + 1) * 3;
                      endIndex = endIndex > elements.length
                          ? elements.length
                          : endIndex;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(endIndex - startIndex, (i) {
                          var element = elements[startIndex + i];
                          return buildContratWidget(element);
                        }),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContratWidget(ElementEntretien elements) {
    final modifier = context.watch<EntretienAdminController>();
    return Column(
      children: [
        Column(
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
            Row(
              children: [
                Text(
                  elements.titre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4E5394),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Supprimer l'élément"),
                            content: Text(
                                "Êtes-vous sûr de vouloir supprimer cet élément ?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Fermez la boîte de dialogue
                                },
                                child: Text("Annuler"),
                              ),
                              TextButton(
                                onPressed: () {
                                  supprimerEntretien(elements
                                      .id); // Appelez la méthode de suppression
                                  Navigator.of(context)
                                      .pop(); // Fermez la boîte de dialogue
                                },
                                child: Text("Supprimer"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                GestureDetector(
                  onTap: () {
                    modifier.gotoUpdateElementEntretien(elements);
                  },
                  child: Icon(
                    Icons.edit_square,
                    color: Color(0xFF4E5394),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ModifierEntretien extends StatefulWidget {
  ModifierEntretien();

  @override
  State<ModifierEntretien> createState() => _ModifierEntretienState();
}

class _ModifierEntretienState extends State<ModifierEntretien> {
 TextEditingController titreController = TextEditingController();
  TextEditingController contenuController = TextEditingController();
   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final modifier = context.watch<EntretienAdminController>();
    // Initialisez les contrôleurs de texte avec les anciennes valeurs du contrat
    titreController.text = modifier.element?.titre ?? '';
    contenuController.text = modifier.element?.contenu ?? '';
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      child: SvgPicture.asset("assets/images/Back.svg",height: 30,width: 30,),
                    ),
                    const Text(
                      'Modifier un élément de l’entretien',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 30,
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
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Couleur de fond du bouton
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
                         // Récupérez les nouvelles valeurs des champs de texte
                        String newTitre = titreController.text;
                        String newContenu = contenuController.text;

                        // Obtenez le contrat actuel à partir du ContratAdminController
                        ElementEntretien? elementActuel = modifier.element;

                        // Créez un nouveau contrat avec les nouvelles valeurs
                        ElementEntretien nouveauElement = ElementEntretien(
                          // Vous devez inclure l'id du contrat lors de la mise à jour
                          id: elementActuel?.id,
                          titre: newTitre,
                          contenu: newContenu, imagePath: '',
                        );

                        // Appelez la fonction de mise à jour dans le ContratAdminController
                        await context
                            .read<EntretienAdminController>()
                            .updateEntretien(nouveauElement);

                        // Naviguez vers la liste des contrats après la mise à jour
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF4E5394), // Couleur de fond du bouton
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      child: SvgPicture.asset("assets/images/Back.svg",height: 30,width: 30,),
                    ),
                    const Text(
                      'Ajouter un élément de l’entretien',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 30,
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
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Couleur de fond du bouton
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
                        print("hello");
                        // Créez l'objet ElementEntretien
                        final elementEntretien = ElementEntretien(
                          titre: titreController.text,
                          contenu: contenuController.text,
                          imagePath: '',
                        );
                        print("half");
                        await service.ajouterElementEntretien(elementEntretien);
                        print("hell");
                        // await enregistrer.gotoListEntretien();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF4E5394), // Couleur de fond du bouton
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
      ),
    );
  }
}

class AjoutContrat extends StatefulWidget {
  const AjoutContrat({super.key});

  @override
  State<AjoutContrat> createState() => _AjoutContratState();
}

class _AjoutContratState extends State<AjoutContrat> {
  @override
  Widget build(BuildContext context) {
    final service = ContratService();
    // Créez les champs de saisie
    final typeController = TextEditingController();
    final descriptionController = TextEditingController();
    final droitsController = TextEditingController();
    final devoirsController = TextEditingController();

// Récupérez les valeurs saisies par l'utilisateur
    final type = typeController;
    final description = descriptionController;
    final droits = droitsController;
    final devoirs = devoirsController;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                           context
                                .read<ContratAdminController>()
                                .gotoListContrat();
                        },
                        child: SvgPicture.asset('assets/images/Back.svg',height: 30,width: 30,)),
                    const Text(
                      'Ajouter un contrat de travail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4E5394),
                        fontSize: 30,
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
                          const Text('Type'),
                          Container(
                            width: 849,
                            height: 50,
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
                                controller: typeController,
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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Description'),
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
                                controller: descriptionController,
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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Droits'),
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
                                controller: droitsController,
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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Devoirs'),
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
                                controller: devoirsController,
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
                        context
                            .read<ContratAdminController>()
                            .gotoListContrat();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Couleur de fond du bouton
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
                        print("hello");
                        // Créez l'objet ElementEntretien
                        final contrat = Contrat(
                          type: typeController.text,
                          description: descriptionController.text,
                          droits: droitsController.text,
                          devoirs: devoirsController.text,
                        );
                        print("half");
                        await service.ajouterContrat(contrat);
                        print("hell");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF4E5394), // Couleur de fond du bouton
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

class AjouterDoc extends StatefulWidget {
  const AjouterDoc({super.key});

  @override
  State<AjouterDoc> createState() => _AjouterDocState();
}

class _AjouterDocState extends State<AjouterDoc> {
  @override
  Widget build(BuildContext context) {
    final service = DocService();

    final nomController = TextEditingController();
    final contenuController = TextEditingController();
    final explicationController = TextEditingController();

    final nom = nomController;
    final contenu = contenuController;
    final explication = explicationController;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<DocumentController>().gotoListDoc();
                      },
                      child: SvgPicture.asset("assets/images/Back.svg"),
                    ),
                    const Text(
                      'Ajouter les éléments d\'un document ',
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
                                controller: nomController,
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
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Contenu'),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Explication'),
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
                                controller: explicationController,
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
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Couleur de fond du bouton
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
                        // await enregistrer.gotoListEntretien();
                        final doc = Documents(
                            nom: nomController.text,
                            contenu: contenuController.text,
                            explication: explicationController.text);
                        service.ajouteDoc(doc);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF4E5394), // Couleur de fond du bouton
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
      ),
    );
  }
}

class AfficherDoc extends StatefulWidget {
  const AfficherDoc({super.key});

  @override
  State<AfficherDoc> createState() => _AfficherDocState();
}

class _AfficherDocState extends State<AfficherDoc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      child: SvgPicture.asset("assets/images/Back.svg"),
                    ),
                    const Text(
                      'Nom de l\'élément ',
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
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const SizedBox(
                //       height: 10,
                //     ),

                // Container(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text('Nom'),
                //       Container(
                //         width: 849,
                //         height: 78,
                //         decoration: ShapeDecoration(
                //           color: Colors.white,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           shadows: const [
                //             BoxShadow(
                //               color: Color(0x3F000000),
                //               blurRadius: 4,
                //               offset: Offset(1, 1),
                //               spreadRadius: 0,
                //             )
                //           ],
                //         ),
                //         child: Padding(
                //           padding:
                //               const EdgeInsets.symmetric(horizontal: 16.0),
                //           child: TextField(
                //             // controller: titreController,
                //             decoration: const InputDecoration(
                //               hintText: 'Saisissez ici',
                //               border: InputBorder.none,
                //             ),
                //             maxLines: null,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 40,
                // ),

                // Container(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text('Contenu'),
                //       Container(
                //         width: 849,
                //         height: 150,
                //         decoration: ShapeDecoration(
                //           color: Colors.white,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           shadows: const [
                //             BoxShadow(
                //               color: Color(0x3F000000),
                //               blurRadius: 4,
                //               offset: Offset(1, 1),
                //               spreadRadius: 0,
                //             )
                //           ],
                //         ),
                //         child: Padding(
                //           padding:
                //               const EdgeInsets.symmetric(horizontal: 16.0),
                //           child: TextField(
                //             // controller: contenuController,
                //             decoration: const InputDecoration(
                //               hintText: 'Saisissez ici',
                //               border: InputBorder.none,
                //             ),
                //             maxLines: null,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                //   ],
                // ),
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
                        context
                            .read<EntretienAdminController>()
                            .gotoListEntretien();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Couleur de fond du bouton
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
                        print("hello");
                        // Créez l'objet ElementEntretien
                        // final elementEntretien = ElementEntretien(
                        //   titre: titreController.text,
                        //   contenu: contenuController.text,
                        //   imagePath: '',
                        // );
                        // print("half");
                        // await service.ajouterElementEntretien(elementEntretien);
                        // print("hell");
                        // await enregistrer.gotoListEntretien();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF4E5394), // Couleur de fond du bouton
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
      ),
    );
  }
}
