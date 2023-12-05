import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mongrh/mes_logiques/mes_classes.dart';
import 'package:mongrh/mes_logiques/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import 'package:flutter_pdfview/flutter_pdfview.dart';

class Pdf extends StatefulWidget {
  const Pdf({Key? key}) : super(key: key);

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PdfViewerScreen()),
            );
          },
          child: const Text('Open PDF Viewer'),
        ),
      ),
    );
  }
}

class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: const PDFView(
        filePath: 'assets/codetravail.pdf', // Path to the PDF file in assets
      ),
    );
  }
}

// class PdfViewerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: PdfViewer(
//         path: 'assets/codetravail.pdf', // Path to the PDF file in assets
//         viewerNavigation: PdfViewerNavigation(
//           documentIndicatorPosition: PdfDocumentIndicatorPosition.none,
//           showDocumentIndicator: false,
//           showNavigation: true,
//         ),
//         viewerPrefs: PdfViewerPrefs(
//           doubleTapZoom: 1.0,
//         ),
//       ),
//     );
//   }
// }

// class PageInscription extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Inscription'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildTextField("Nom d'utilisateur", Icons.person),
//             _buildTextField("E-mail", Icons.email),
//             _buildTextField("Numéro de téléphone", Icons.phone),
//             _buildTextField("Mot de passe", Icons.lock),
//             _buildTextField("Confirmer le mot de passe", Icons.lock),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Gérer la soumission du formulaire ici
//               },
//               child: Text('S\'inscrire'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, IconData icon) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         suffixIcon: Icon(icon),
//       ),
//     );
//   }
// }

class PremierePage extends StatelessWidget {
  const PremierePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Flexible(
              child: Image.asset(
                'assets/images/logo.png',
                height: 250,
                width: 250,
              ),
            ),
            Flexible(
              child: Image.asset(
                'assets/images/milieu.png',
                height: 350,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PageInscription()),
                );
              },
              child: const Text('Créer compte'),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Connexion()));
              },
              child: const Text(
                "J'ai déjà un compte",
                style: TextStyle(
                    color: Color(0xFF4E5394),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

//Page d'inscription
class PageInscription extends StatefulWidget {
  const PageInscription({
    Key? key,
  }) : super(key: key);

  @override
  _PageInscriptionState createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  bool _obscureText = true;
  final _userphotoController = TextEditingController();
  final _usernameController = TextEditingController();
  final _numeroController = TextEditingController();
  final _emailController = TextEditingController();
  final _motDePasseController = TextEditingController();
  final _confirmerMotdePasse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Ajout des attributs de l'utilisateur dans les champs de texte
    // _usernameController.text = widget.user.username;
    // _numeroController.text = widget.user.numero.toString();
    // _emailController.text = widget.user.email;
    // _motDePasseController.text = widget.user.motDePasse;

    return MaterialApp(
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Flexible(
                    child: Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                  width: 250,
                )),
                _buildTextField(
                  "Nom d'utilisateur",
                  Icons.person,
                  _usernameController,
                ),
                const SizedBox(height: 10),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    hintText: "Numéro de téléphone",
                    suffixIcon: Icon(
                      Icons.call,
                      color: Color(0xFF4E5394),
                    ),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                  initialCountryCode: 'ML',
                  controller: _numeroController,
                ),
                const SizedBox(height: 10),
                _buildTextField("E-mail", Icons.email, _emailController),
                const SizedBox(height: 10),
                _buildPasswordTextField(
                    "Mot de passe", Icons.call, _motDePasseController),
                const SizedBox(height: 10),
                _buildPasswordTextField("Confirmer le mot de passe",
                    Icons.visibility_off, _confirmerMotdePasse),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Code d'inscription
                    try {
                      String userEmail = _emailController.text;
                      String userMotdePasse = _motDePasseController.text;
                      int userNumero = int.parse(_numeroController.text);
                      String userNom = _usernameController.text;

                      // Créer un nouvel utilisateur dans Firebase Auth
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _motDePasseController.text,
                      );

                      // Envoyer un e-mail de vérification à l'utilisateur nouvellement créé
                      await userCredential.user!.sendEmailVerification();
                      // Afficher un pop-up
                      showDialog(
                        context: context,
                        builder: (context) {
                          final screenHeight =
                              MediaQuery.of(context).size.height;
                          final targetHeight = screenHeight * 0.25;
                          return Center(
                            child: AlertDialog(
                              content: SizedBox(
                                height: targetHeight,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "assets/images/valide.jpg"),
                                        height: 70,
                                        width: 70,
                                      ),
                                      Text(
                                        ' $userNom',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const Text(
                                        'Bienvenue dans MonGrh',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      Future.delayed(const Duration(seconds: 3), () async {
                        Navigator.pop(context);
                        // Enregistrer les informations de l'utilisateur
                        Users user = Users(
                          photo: _userphotoController.text,
                          id: userCredential.user!.uid,
                          username: _usernameController.text,
                          email: _emailController.text.trim(),
                          motDePasse: _motDePasseController.text,
                          numero: int.parse(_numeroController.text),
                        );
                        // Sauvegarder les informations de l'utilisateur
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.id)
                            .set(user.toMap())
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Principal(
                                users: user,
                              ),
                            ),
                          );
                        });
                      });
                    } on FirebaseAuthException catch (e) {
                      // Gérer l'erreur d'authentification
                      print(e.message);
                    }
                  },
                  child: const Text('S\'inscrire'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, TextEditingController usernameController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          hintText: label,
          suffixIcon: Icon(
            icon,
            color: const Color(0xFF4E5394),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(
      String label, IconData icon, TextEditingController motDePasseController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: TextFormField(
        controller: motDePasseController,
        decoration: InputDecoration(
          hintText: label,
          suffixIcon: PasswordToggle(
            obscureText: _obscureText,
            onToggle: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: InputBorder.none,
        ),
        obscureText:
            _obscureText, // Utiliser !_obscureText pour masquer ou révéler le texte du mot de passe
        obscuringCharacter:
            '*', // Remplacer les caractères saisis par des points
      ),
    );
  }
}

class PasswordToggle extends StatefulWidget {
  final bool obscureText;
  final void Function() onToggle;

  const PasswordToggle(
      {Key? key, required this.obscureText, required this.onToggle})
      : super(key: key);

  @override
  _PasswordToggleState createState() => _PasswordToggleState();
}

class _PasswordToggleState extends State<PasswordToggle> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.obscureText ? Icons.visibility_off : Icons.visibility,
        color: const Color(0xFF4E5394),
      ),
      onPressed: widget.onToggle,
    );
  }
}

//Page de connexion
class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool _obscureText = true;

  final _emailController = TextEditingController();
  final _motDePasseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // key: _scaffoldKey,
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Flexible(
                    child: Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                  width: 250,
                )),
                const SizedBox(height: 10),
                _buildTextField("E-mail", Icons.email, _emailController),
                const SizedBox(height: 10),
                _buildPasswordTextField(
                    "Mot de passe", Icons.call, _motDePasseController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String userEmail = _emailController.text;
                    String userMotdePasse = _motDePasseController.text;
                    if (userEmail.isNotEmpty && userMotdePasse.isNotEmpty) {
                      await signInWithEmailAndPassword(
                              userEmail, userMotdePasse)
                          .then((value) async {
                        /*print(FirebaseAuth.instance.currentUser!.uid);*/
                        DocumentSnapshot userSnapshot = await FirebaseFirestore
                            .instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .get();

                        Users user = Users.fromMap(
                            userSnapshot.data() as Map<String, dynamic>);

                        showDialog(
                          context: context,
                          builder: (context) {
                            final screenHeight =
                                MediaQuery.of(context).size.height;
                            final targetHeight = screenHeight * 0.25;

                            return Center(
                              child: AlertDialog(
                                content: SizedBox(
                                  height: targetHeight,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                              "assets/images/valide.jpg"),
                                          height: 70,
                                          width: 70,
                                        ),
                                        Text(
                                          user.username,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        const Text(
                                          'Connexion Reussie',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                        Future.delayed(const Duration(seconds: 3), () async {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Principal(
                                users: user,
                              ),
                            ),
                          );
                        });
                      });
                    } else {
                      print("Veuillez remplir tous les champs.");
                    }
                  },
                  child: const Text('Se connecter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, TextEditingController emailController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          hintText: label,
          suffixIcon: Icon(icon, color: const Color(0xFF4E5394)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(
      String label, IconData icon, TextEditingController motDePasseController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: TextFormField(
        controller: _motDePasseController,
        decoration: InputDecoration(
          hintText: label,
          suffixIcon: PasswordToggle(
              obscureText: _obscureText,
              onToggle: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              }),
          border: InputBorder.none,
        ),
        obscureText:
            _obscureText, // Utiliser !_obscureText pour masquer ou révéler le texte du mot de passe
        obscuringCharacter:
            '*', // Remplacer les caractères saisis par des points
      ),
    );
  }
}

//Page principale
class Principal extends StatefulWidget {
  const Principal({super.key, required this.users});

  final Users users;

  @override
  State<Principal> createState() => _PrincipalState();
}

class ImageUploader {
  static Future<String?> uploadImage(File imageFile, String userId) async {
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref('user_images/$userId/$imageName.jpg');
      await storageReference.putFile(imageFile);

      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (error) {
      print('Erreur lors du téléversement de l\'image : $error');
      return null;
    }
  }
}

class _PrincipalState extends State<Principal> {
   ImageProvider<Object>? _avatarImage;
  void _onDetail() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Users user = Users.fromMap(userSnapshot.data() as Map<String, dynamic>);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailProfil(
                  users: user,
                )));
  }

  void _onModifier() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Users user = Users.fromMap(userSnapshot.data() as Map<String, dynamic>);
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numeroController = TextEditingController();
// Ajoutez d'autres contrôleurs au besoin

    // Initialisez les contrôleurs avec les valeurs actuelles
    usernameController.text = user.username;
    emailController.text = user.email;
    numeroController.text = user.numero.toString();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ModifierProfil(
                  users: user,
                )));
    // Do something when the modify item is tapped
  }

  Users user = Users(
      id: 'id',
      username: 'username',
      numero: 0,
      email: 'email',
      motDePasse: 'motDePasse',
      photo: '');
  Future<void> _onImage() async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      Users user = Users.fromMap(userSnapshot.data() as Map<String, dynamic>);

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        try {
          String? downloadURL = await ImageUploader.uploadImage(
            imageFile,
            FirebaseAuth.instance.currentUser!.uid,
          );

          if (downloadURL != null) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({'photo': downloadURL});

            setState(() {
              user.photo = downloadURL;
            _avatarImage = NetworkImage(downloadURL) as ImageProvider<Object>;
            });

            print('Image téléversée avec succès');
          }
        } catch (error) {
          print('Erreur lors du téléversement de l\'image : $error');
        }
      }
    } catch (error) {
      print('Erreur lors de la récupération des données utilisateur : $error');
      setState(() {
        // user.photo = 'assets/images/profil.png';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    TextStyle mesTextes = const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
        color: Colors.black);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 140,
          ),
          GestureDetector(
            onTap: () {
              showMenu<String>(
                context: context,
                position: const RelativeRect.fromLTRB(250, 250, 50, 50),
                items: [
                  PopupMenuItem<String>(
                    value: 'detail',
                    onTap: _onDetail,
                    child: const Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(width: 10),
                        Text('Détail'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'modifier',
                    onTap: _onModifier,
                    child: const Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10),
                        Text('Modifier'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'image',
                    onTap: _onImage,
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(width: 10),
                        Text('Image'),
                      ],
                    ),
                  ),
                ],
                elevation: 8.0,
              ).then((String? value) {
                if (value != null) {
                  switch (value) {
                    case 'detail':
                      // Handle detail action
                      break;
                    case 'modifier':
                      // Handle modify action
                      break;
                    case 'image':
                      // Handle image action
                      break;
                  }
                }
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 3)),
              child:
                CircleAvatar(
      backgroundColor: Colors.white,
      foregroundImage: _avatarImage ?? const AssetImage('assets/images/profil.png'),
      radius: 50,
    ),
            ),
          ),
          // SvgPicture.asset("assets/images/prof.svg"),
          Text(widget.users.username, style: mesTextes),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Contrats(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/accord.png',
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          "Contrat",
                          style: mesTextes,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const InterfaceEntretien()));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/entretien.jpg',
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          "Entretien",
                          style: mesTextes,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Cv()));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/Cvs.webp',
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          "Dossiers",
                          style: mesTextes,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PdfViewerPage()));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/Cvs.webp',
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          "Loi",
                          style: mesTextes,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Contrats
class Contrats extends StatefulWidget {
  const Contrats({Key? key}) : super(key: key);

  @override
  State<Contrats> createState() => _ContratsState();
}

class _ContratsState extends State<Contrats> {
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
        );
      }).toList();

      setState(() {
        lescontrats = items;
      });
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 100,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/images/Back.svg',
                    height: 35,
                    width: 35,
                  )),
              const Image(
                image: AssetImage('assets/images/entretien.jpg'),
                width: 120,
                height: 120,
              ),
              Container()
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: lescontrats
                .map((contrat) => buildContratContainer(contrat))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildContratContainer(Contrat contrat) {
    return GestureDetector(
      onTap: () {
        // Naviguez vers la page pour afficher les détails du contrat
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AfficherContrat(contrat: contrat)),
        );
      },
      child: Container(
        width: 250,
        height: 57,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(1, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            contrat.type,
            style: const TextStyle(
              fontSize: 12,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

//Contrat

class AfficherContrat extends StatefulWidget {
  const AfficherContrat({super.key, required this.contrat});
  final Contrat contrat;
  @override
  State<AfficherContrat> createState() => _ContratState();
}

class _ContratState extends State<AfficherContrat> {
  late Contrat contrat;

  @override
  void initState() {
    super.initState();
    contrat = widget.contrat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('CDD'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset('assets/images/Back.svg'),
                /* icon: const Icon(
                  Icons.keyboard_backspace,
                  size: 30,
                  color: Colors.grey,
                ),*/
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFF4E5394),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    contrat.type,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  DocumentSnapshot userSnapshot = await FirebaseFirestore
                      .instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get();
                  Users user = Users.fromMap(
                      userSnapshot.data() as Map<String, dynamic>);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Principal(users: user)));
                },
                icon:
                    const Icon(Icons.home, size: 30, color: Color(0xFF4E5394)),
              )
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Description'),
              Container(
                width: 320,
                height: MediaQuery.of(context).size.height * 0.17,
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
                child: SingleChildScrollView(child: Text(contrat.description)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Droits'),
              Container(
                width: 320,
                height: MediaQuery.of(context).size.height * 0.17,
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
                child: SingleChildScrollView(child: Text(contrat.droits)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Devoirs'),
              Container(
                width: 320,
                height: MediaQuery.of(context).size.height * 0.17,
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
                child: SingleChildScrollView(child: Text(contrat.devoirs)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//DetailProfil

class DetailProfil extends StatefulWidget {
  const DetailProfil({super.key, required this.users});
  final Users users;

  @override
  _DetailProfilState createState() => _DetailProfilState();
}

class _DetailProfilState extends State<DetailProfil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/images/Back.svg',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 3)),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage('assets/images/profil.png'),
                      radius: 50,
                    ),
                  ),
                  Container()
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              // width: 250,
              height: 40,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.users.username),
                  const Icon(
                    Icons.person_2_sharp,
                    size: 25,
                    color: Color(0xFF4E5394),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 40,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.users.email),
                  const Icon(
                    Icons.mail,
                    size: 25,
                    color: Color(0xFF4E5394),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 40,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.users.numero.toString()),
                  const Icon(
                    Icons.phone_sharp,
                    size: 25,
                    color: Color(0xFF4E5394),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 40,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.users.motDePasse),
                  const Icon(
                    Icons.lock,
                    size: 25,
                    color: Color(0xFF4E5394),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ModifierProfil extends StatefulWidget {
  const ModifierProfil({super.key, required this.users});
  final Users users;

  @override
  State<ModifierProfil> createState() => _ModifierProfilState();
}

class _ModifierProfilState extends State<ModifierProfil> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialiser les contrôleurs avec les valeurs existantes de l'utilisateur
    _usernameController.text = widget.users.username;
    _emailController.text = widget.users.email;
    _numeroController.text = widget.users.numero.toString();
    _motDePasseController.text = widget.users.motDePasse;
  }

  @override
  Widget build(BuildContext context) {
    // TextField buildEditableField(
    //     TextEditingController controller, IconData icon, String hintText) {
    //   return TextField(
    //     controller: controller,
    //     decoration: InputDecoration(
    //       hintText: hintText,
    //       icon: Icon(icon, size: 25, color: const Color(0xFF4E5394)),
    //     ),
    //   );
    // }

    SizedBox buildEditableField(
      TextEditingController controller,
      IconData icon,
      String hintText,
    ) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 40,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(icon, size: 25, color: const Color(0xFF4E5394)),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/images/Back.svg',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 3)),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage('assets/images/profil.png'),
                      radius: 50,
                    ),
                  ),
                  Container()
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   // width: 250,
            //   height: 40,
            //   decoration: const ShapeDecoration(
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // Text(widget.users.username),
            //       // const Icon(
            //       //   Icons.person_2_sharp,
            //       //   size: 25,
            //       //   color: Color(0xFF4E5394),
            //       // ),
            //       buildEditableField(
            //         _usernameController,
            //         Icons.person_2_sharp,
            //         'Nom d\'utilisateur',
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: buildEditableField(
                _usernameController,
                Icons.person_2_sharp,
                'Nom d\'utilisateur',
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   height: 40,
            //   decoration: const ShapeDecoration(
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // Text(widget.users.email),
            //       // const Icon(
            //       //   Icons.mail,
            //       //   size: 25,
            //       //   color: Color(0xFF4E5394),
            //       // ),
            //       buildEditableField(
            //         _emailController,
            //         Icons.mail,
            //         'Email',
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: buildEditableField(
                _emailController,
                Icons.mail,
                'Email',
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   height: 40,
            //   decoration: const ShapeDecoration(
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // Text(widget.users.numero.toString()),
            //       // const Icon(
            //       //   Icons.phone_sharp,
            //       //   size: 25,
            //       //   color: Color(0xFF4E5394),
            //       // ),
            //       buildEditableField(
            //           _numeroController, Icons.phone_sharp, 'Numero')
            //     ],
            //   ),
            // ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: buildEditableField(
                _numeroController,
                Icons.phone_sharp,
                'Numero',
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   height: 40,
            //   decoration: const ShapeDecoration(
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // Text(widget.users.motDePasse),
            //       // const Icon(
            //       //   Icons.lock,
            //       //   size: 25,
            //       //   color: Color(0xFF4E5394),
            //       // ),
            //       buildEditableField(
            //           _motDePasseController, Icons.lock, 'motDePasse')
            //     ],
            //   ),
            // ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: buildEditableField(
                _motDePasseController,
                Icons.lock,
                'motDePasse',
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                // Enregistrer les modifications dans Firebase
                String newUsername = _usernameController.text;
                String newEmail = _emailController.text;
                int newNumero = int.parse(_numeroController.text);
                String newMotDePasse = _motDePasseController.text;

                // Mettre à jour les informations de l'utilisateur dans Firebase
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.users.id)
                    .update({
                  'username': newUsername,
                  'email': newEmail,
                  'numero': newNumero,
                  'motDePasse': newMotDePasse,
                });

                // Mettre à jour l'objet Users avec les nouvelles informations
                Users updatedUser = Users(
                  photo: widget.users.photo,
                  id: widget.users.id,
                  username: newUsername,
                  email: newEmail,
                  numero: newNumero,
                  motDePasse: newMotDePasse,
                );

                // Renvoyer l'objet Users mis à jour vers la page précédente
                Navigator.pop(context, updatedUser);
              },
              child: const Text('Enregistrer les modifications'),
            ),
          ],
        ),
      )),
    );
  }
}

//Document CV et lettre de motivation

class Cv extends StatefulWidget {
  const Cv({super.key});

  @override
  State<Cv> createState() => _CvState();
}

class _CvState extends State<Cv> {
  TextStyle mesTextes = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: Colors.black);
  List<Documents> documents = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      CollectionReference<Map<String, dynamic>> documentsCollection =
          FirebaseFirestore.instance.collection('Documents');

      QuerySnapshot<Map<String, dynamic>> documentsSnapshot =
          await documentsCollection.get();

      List<Documents> items = documentsSnapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic> data = doc.data();
        return Documents(
          nom: data['nom'] as String,
          contenu: data['contenu'] as String,
          // Utilisez l'image par défaut si 'imagePath' est null ou vide
          explication: data['explication'] as String,
        );
      }).toList();

      setState(() {
        documents = items;
      });
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                "assets/images/Back.svg",
                height: 30,
                width: 30,
              ),
            ),
            Image.asset(
              'assets/images/Cvs.webp',
              width: 100,
              height: 100,
            ),
            Container(),
          ],
        ),
        Text(
          'Cv',
          style: mesTextes,
        ),
        const SizedBox(
          height: 40,
        ),
        // Container(
        //   width: 250,
        //   height: 400, // Ajustez la hauteur selon vos besoins
        //   decoration: ShapeDecoration(
        //     color: Colors.white,
        //     shape: RoundedRectangleBorder(
        //       side: const BorderSide(width: 0.50),
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        //   child:
           Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
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
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    for (var lesdocuments in documents)
                      buildListItem(lesdocuments),
                  ],
                ),
              ),
            ],
          ),
        // ),
        // Spacer(),
        //    Container(
        // height: 40,
        // width: MediaQuery.of(context).size.width * 0.8,
// Check for null context
        // color: Color.fromARGB(255, 51, 6, 109),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(20),
        //     topRight: Radius.circular(20),
        //   ),
        // ),
// )
      ],
    );
  }

// }

  Widget buildListItem(Documents documents) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Affichagedoc(documents: documents),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/Cvs.webp"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          Text(
            documents.nom,
            textAlign: TextAlign.center,
            style: mesTextes,
            // style: const TextStyle(
            //   color: Color(0xE02D3030),
            //   fontSize: 15,
            //   fontFamily: 'Poppins',
            //   fontWeight: FontWeight.w400,
            //   height: 0,
            // ),
          ),
        ],
      ),
    );
  }
}

class Affichagedoc extends StatefulWidget {
  const Affichagedoc({super.key, required this.documents});

  final Documents documents;

  @override
  State<Affichagedoc> createState() => _AffichagedocState();
}

class _AffichagedocState extends State<Affichagedoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/images/Back.svg',
                height: 30,
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/Cvs.webp"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Dossiers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                'assets/images/home.svg',
                height: 30,
                width: 30,
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.documents.nom,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xE02D3030),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 400,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF4E5394)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    widget.documents.contenu,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}

//Document lettre de motivation

// class PdfViewerPage extends StatefulWidget {
//   const PdfViewerPage({super.key});

//   @override
//   State<PdfViewerPage> createState() => _PDFViewerPageState();
// }

// class _PDFViewerPageState extends State<PdfViewerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           child: SfPdfViewer.network(
//             // Path to the PDF file
//             'https://firebasestorage.googleapis.com/v0/b/mongrh2.appspot.com/o/codetravail.pdf?alt=media&token=bc211df8-5402-4564-9bce-fc166be4e2f9',
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PdfViewerPage extends StatefulWidget {
//   const PdfViewerPage({super.key});

//   @override
//   _CodeDuTravailPageState createState() => _CodeDuTravailPageState();
// }

// class _CodeDuTravailPageState extends State<PdfViewerPage> {
//   Uint8List? _documentBytes;
//   String path =
//       'https://firebasestorage.googleapis.com/v0/b/mongrh2.appspot.com/o/codetravail.pdf?alt=media&token=bc211df8-5402-4564-9bce-fc166be4e2f9';
//   @override
//   void initState() {
//     getPdfBytes();
//     super.initState();
//   }

//   void getPdfBytes() async {
//     if (kIsWeb) {
//       var firebaseStorage;
//       var pdfRef = firebaseStorage.FirebaseStorage.instanceFor(
//               bucket: 'mongrh2.appspot.com')
//           .refFromURL(path);
//       //size mentioned here is max size to download from firebase.
//       await pdfRef.getData(104857600).then((value) {
//         _documentBytes = value;
//         setState(() {});
//       });
//     } else {
//       HttpClient client = HttpClient();
//       final Uri url = Uri.base.resolve(path);
//       final HttpClientRequest request = await client.getUrl(url);
//       final HttpClientResponse response = await request.close();
//       _documentBytes = await consolidateHttpClientResponseBytes(response);
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget child = const Center(child: CircularProgressIndicator());
//     if (_documentBytes != null) {
//       child = SfPdfViewer.memory(
//         _documentBytes!,
//       );
//     }
//     return Scaffold(
//       body: child,

//     );
//   }
// }

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({Key? key}) : super(key: key);

  @override
  _CodeDuTravailPageState createState() => _CodeDuTravailPageState();
}

class _CodeDuTravailPageState extends State<PdfViewerPage> {
  Uint8List? _documentBytes;
  String path =
      'https://firebasestorage.googleapis.com/v0/b/mongrh2.appspot.com/o/codetravail.pdf?alt=media&token=bc211df8-5402-4564-9bce-fc166be4e2f9';

  @override
  void initState() {
    getPdfBytes();
    super.initState();
  }

  void getPdfBytes() async {
    if (kIsWeb) {
      var firebaseStorage;
      var pdfRef = firebaseStorage.FirebaseStorage.instanceFor(
              bucket: 'mongrh2.appspot.com')
          .refFromURL(path);
      await pdfRef.getData(104857600).then((value) {
        _documentBytes = value;
        setState(() {});
      });
    } else {
      HttpClient client = HttpClient();
      final Uri url = Uri.parse(path);
      final HttpClientRequest request = await client.getUrl(url);
      final HttpClientResponse response = await request.close();
      _documentBytes = await consolidateHttpClientResponseBytes(response);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const Center(child: CircularProgressIndicator());
    if (_documentBytes != null) {
      child = SfPdfViewer.memory(
        _documentBytes!,
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: child,
          ),
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (searchTerm) {
                // Ajoutez ici votre logique pour rechercher le terme dans le PDF.
                // Vous pouvez utiliser le texte du terme pour effectuer une recherche dans le PDF.
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class Motivation extends StatefulWidget {
//   const Motivation({super.key});

//   @override
//   State<Motivation> createState() => _MotivationState();
// }

// class _MotivationState extends State<Motivation> {
//   TextStyle mesTextes = const TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.normal,
//       decoration: TextDecoration.none,
//       color: Colors.black);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Icon(Icons.arrow_back),
//             ),
//             Image.asset(
//               'assets/images/Cvs.webp',
//               width: 100,
//               height: 100,
//             ),
//             Container()
//           ],
//         ),
//         Text(
//           'Lettre de Motivation',
//           style: mesTextes,
//         ),
//         const SizedBox(
//           height: 40,
//         ),
//         Container(
//           width: 250,
//           height: 300,
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(width: 0.50),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 width: 200,
//                 height: 60,
//                 decoration: ShapeDecoration(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   shadows: const [
//                     BoxShadow(
//                       color: Color(0x3F000000),
//                       blurRadius: 4,
//                       offset: Offset(1, 1),
//                       spreadRadius: 0,
//                     )
//                   ],
//                 ),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Image.asset('assets/images/Cvs.webp'),
//                       Text(
//                         'Généralité',
//                         style: mesTextes,
//                       )
//                     ]),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: 200,
//                   height: 60,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     shadows: const [
//                       BoxShadow(
//                         color: Color(0x3F000000),
//                         blurRadius: 4,
//                         offset: Offset(1, 1),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Image.asset('assets/images/Cvs.webp'),
//                         Text(
//                           'Structure',
//                           style: mesTextes,
//                         )
//                       ]),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: 200,
//                   height: 60,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     shadows: const [
//                       BoxShadow(
//                         color: Color(0x3F000000),
//                         blurRadius: 4,
//                         offset: Offset(1, 1),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Image.asset('assets/images/Cvs.webp'),
//                         Text(
//                           'Exemplaire',
//                           style: mesTextes,
//                         )
//                       ]),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: 200,
//                   height: 60,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     shadows: const [
//                       BoxShadow(
//                         color: Color(0x3F000000),
//                         blurRadius: 4,
//                         offset: Offset(1, 1),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Image.asset('assets/images/Cvs.webp'),
//                         Text(
//                           'Rédaction',
//                           style: mesTextes,
//                         )
//                       ]),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

//Entretien

class Entretien extends StatefulWidget {
  const Entretien({super.key});

  @override
  State<Entretien> createState() => _EntretienState();
}

class _EntretienState extends State<Entretien> {
  TextStyle mesTextes = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back),
            ),
            Container(
              width: 120,
              height: 120,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/entretien.jpg'),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container()
          ],
        ),
        Text(
          'Entretien',
          style: mesTextes,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 350,
          height: 400,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 275,
                  height: 84,
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
                  child: Row(children: [
                    Container(
                      width: 79,
                      height: 61,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/entretien.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text(
                      'Préparation',
                      style: mesTextes,
                    )
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 275,
                  height: 84,
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
                  child: Row(children: [
                    Container(
                      width: 79,
                      height: 61,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/entretien.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text(
                      'Préparation',
                      style: mesTextes,
                    )
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 275,
                  height: 84,
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
                  child: Row(children: [
                    Container(
                      width: 79,
                      height: 61,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/entretien.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text(
                      'Préparation',
                      style: mesTextes,
                    )
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 275,
                  height: 84,
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
                  child: Row(children: [
                    Container(
                      width: 79,
                      height: 61,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/entretien.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text(
                      'Préparation',
                      style: mesTextes,
                    )
                  ]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//Coach
class Coach extends StatefulWidget {
  const Coach({super.key});

  @override
  State<Coach> createState() => _CoachState();
}

class _CoachState extends State<Coach> {
  TextStyle mesTextes = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 54, 2, 65)),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/profil.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(width: 4, color: Color(0xFF9D9D9D)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.home,
                    color: Color.fromARGB(255, 54, 2, 65)),
              )
            ],
          ),
          Text(
            'TOURE',
            style: mesTextes,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 300,
                  height: 80,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DIARRA',
                            style: mesTextes,
                          ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   crossAxisCount: 2,
                          //   children: List.generate(10, (index) {
                          //     return Row(
                          //       children: [
                          //         Icon(
                          //           Icons.star,
                          //           color: Colors.amber,
                          //         )
                          //       ],
                          //     );
                          //   }),
                          // ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DIARRA',
                            style: mesTextes,
                          ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   crossAxisCount: 2,
                          //   children: List.generate(10, (index) {
                          //     return Row(
                          //       children: [
                          //         Icon(
                          //           Icons.star,
                          //           color: Colors.amber,
                          //         )
                          //       ],
                          //     );
                          //   }),
                          // ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DIARRA',
                            style: mesTextes,
                          ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   crossAxisCount: 2,
                          //   children: List.generate(10, (index) {
                          //     return Row(
                          //       children: [
                          //         Icon(
                          //           Icons.star,
                          //           color: Colors.amber,
                          //         )
                          //       ],
                          //     );
                          //   }),
                          // ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DIARRA',
                            style: mesTextes,
                          ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   crossAxisCount: 2,
                          //   children: List.generate(10, (index) {
                          //     return Row(
                          //       children: [
                          //         Icon(
                          //           Icons.star,
                          //           color: Colors.amber,
                          //         )
                          //       ],
                          //     );
                          //   }),
                          // ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DIARRA',
                            style: mesTextes,
                          ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   crossAxisCount: 2,
                          //   children: List.generate(10, (index) {
                          //     return Row(
                          //       children: [
                          //         Icon(
                          //           Icons.star,
                          //           color: Colors.amber,
                          //         )
                          //       ],
                          //     );
                          //   }),
                          // ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DIARRA',
                            style: mesTextes,
                          ),
                          // GridView.count(
                          //   shrinkWrap: true,
                          //   crossAxisCount: 2,
                          //   children: List.generate(10, (index) {
                          //     return Row(
                          //       children: [
                          //         Icon(
                          //           Icons.star,
                          //           color: Colors.amber,
                          //         )
                          //       ],
                          //     );
                          //   }),
                          // ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InterfaceEntretien extends StatefulWidget {
  const InterfaceEntretien({super.key});

  @override
  State<InterfaceEntretien> createState() => _InterfaceEntretienState();
}

class _InterfaceEntretienState extends State<InterfaceEntretien> {
  List<ElementEntretien> elementEntretien = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      CollectionReference<Map<String, dynamic>> entretienCollection =
          FirebaseFirestore.instance.collection('ElementEntretien');

      QuerySnapshot<Map<String, dynamic>> entretienSnapshot =
          await entretienCollection.get();

      List<ElementEntretien> items = entretienSnapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic> data = doc.data();
        return ElementEntretien(
          titre: data['titre'] as String,
          contenu: data['contenu'] as String,
          // Utilisez l'image par défaut si 'imagePath' est null ou vide
          imagePath:
              data['imagePath'] as String? ?? 'assets/images/entretien.jpg',
        );
      }).toList();

      setState(() {
        elementEntretien = items;
      });
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'assets/images/Back.svg',
                  height: 30,
                  width: 30,
                ),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/entretien.jpg"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(),
            ],
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              width: 80,
              height: 80,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: ListView(
                children: [
                  for (var entretien in elementEntretien)
                    buildListItem(entretien),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(ElementEntretien elementEntretien) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ContenuEntretien(elementEntretien: elementEntretien),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 60,
        width: 60,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
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
              width: 79,
              height: 61,
              decoration: elementEntretien.imagePath.isNotEmpty
                  ? ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(elementEntretien.imagePath),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  : null,
            ),
            Text(
              elementEntretien.titre,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xE02D3030),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContenuEntretien extends StatefulWidget {
  const ContenuEntretien({super.key, required this.elementEntretien});

  final ElementEntretien elementEntretien;

  @override
  State<ContenuEntretien> createState() => _ContenuEntretienState();
}

class _ContenuEntretienState extends State<ContenuEntretien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'assets/images/Back.svg',
                  height: 30,
                  width: 30,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/entretien.jpg"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Entretien',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/images/home.svg',
                  height: 30,
                  width: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.elementEntretien.titre,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xE02D3030),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 400,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF4E5394)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.elementEntretien.contenu,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
