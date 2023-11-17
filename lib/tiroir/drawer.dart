import 'package:flutter/material.dart';

// import 'package:myapp/home.dart';
// import 'package:myapp/about.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
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
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.50,
          decoration: ShapeDecoration(
            color: Color(0xFF4E5394),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 5, color: Color(0xFF4E5394)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 150,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/conticon.png',
                    width: 35,
                    height: 35,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 150,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/entretienicon.png',
                      width: 35,
                      height: 35,
                    ),
                    const Text(
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
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coach.png',
                    width: 35,
                    height: 35,
                  ),
                  const Text(
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
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ecrit.png',
                    width: 35,
                    height: 35,
                  ),
                  const Text(
                    'Document',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E5394),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ],
    );

    // Container(
    //   width: MediaQuery.of(context).size.width * 0.15,
    //   height: MediaQuery.of(context).size.height * 0.50,
    //   child: Drawer(
    //     child: Container(
    //       color: const Color.fromARGB(255, 2, 46, 82),
    //       child: ListView(
    //         children: <Widget>[
    //           Column(
    //             children: [
    //               ListTile(
    //                 title: Text('Home'),
    //                 textColor: Colors.white,
    //                 trailing: Icon(
    //                   Icons.home,
    //                   color: Colors.white,
    //                 ),
    //                 onTap: () => Navigator.of(context).push(MaterialPageRoute(
    //                     builder: (context) => HomeScreen(title: "Home"))),
    //               ),
    //             ],
    //           ),
    //           ListTile(
    //             title: Text('About'),
    //             textColor: Colors.white,
    //             trailing: Icon(
    //               Icons.info_rounded,
    //               color: Colors.white,
    //             ),
    //             onTap: () => Navigator.of(context)
    //                 .push(MaterialPageRoute(builder: (context) => About())),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
