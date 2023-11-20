import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mongrh/mes_logiques/mes_classes.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PageInscription(
                            isLoginPage: true,
                          )),
                );
              },
              child: const Text('Créer compte'),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PageInscription(isLoginPage: false)));
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
  const PageInscription({Key? key, this.isLoginPage = false}) : super(key: key);
  final bool isLoginPage;

  @override
  _PageInscriptionState createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  bool _obscureText = true;

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
                // if (widget.isLoginPage) ...[
                //   _buildTextField("Nom d'utilisateur", Icons.person),
                // ],
                // const SizedBox(height: 10),
                // _buildTextField("E-mail", Icons.email),
                // const SizedBox(height: 10),
                // const IntlPhoneField(
                //   decoration: InputDecoration(
                //     hintText: "Numéro de téléphone",
                //     suffixIcon: Icon(Icons.call),
                //     border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                //   ),
                //   initialCountryCode: 'ML',
                // ),
                // const SizedBox(height: 10),
                // _buildPasswordTextField("Mot de passe", Icons.call),
                // const SizedBox(height: 10),

                _buildTextField(
                    "Nom d'utilisateur", Icons.email, _usernameController),
                const SizedBox(height: 10),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    hintText: "Numéro de téléphone",
                    suffixIcon: Icon(Icons.call),
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
                    Icons.visibility_off, _motDePasseController),
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                // Remplacer s'inscrire par connectez-vous si c'est la page de connexion
                ElevatedButton(
                  onPressed: () async {
                    // try {
                    //   // Créer un nouvel utilisateur dans Firebase Auth
                    //   UserCredential userCredential = await FirebaseAuth
                    //       .instance
                    //       .createUserWithEmailAndPassword(
                    //     email: _emailController.text.trim(),
                    //     password: _motDePasseController.text,
                    //   );
                    //   // Mettre à jour le profil de l'utilisateur avec le nom d'utilisateur
                    //   await userCredential.user!
                    //       // ignore: deprecated_member_use
                    //       .updateProfile(displayName: _usernameController.text);

                    //   // Récupérer les informations mises à jour de l'utilisateur
                    //   User? updatedUser = FirebaseAuth.instance.currentUser;

                    //   // Vérifier que le mot de passe et la confirmation du mot de passe sont identiques
                    //   if (_motDePasseController.text !=
                    //       _confirmerMotdePasse.text) {
                    //     throw FirebaseAuthException(
                    //       code: 'invalid-email',
                    //       message: 'Les mots de passe ne correspondent pas.',
                    //     );
                    //   }

                    //   // Envoyer un e-mail de vérification à l'utilisateur nouvellement créé
                    //   await userCredential.user!.sendEmailVerification();

                    //   // Afficher un message à l'utilisateur pour l'informer qu'il doit vérifier son e-mail
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text(
                    //           'Un e-mail de vérification a été envoyé à votre adresse e-mail. Veuillez vérifier votre e-mail pour terminer votre inscription.'),
                    //     ),
                    //   );
                    //   // Enregistrer les informations de l'utilisateur
                    //   MyUser user = MyUser(
                    //     id: userCredential.user!.uid,
                    //     username: _usernameController.text,
                    //     email: _emailController.text.trim(),
                    //     motDePasse: _motDePasseController.text,
                    //     numero: int.parse(_numeroController.text),
                    //   );

                    //   // Sauvegarder les informations de l'utilisateur
                    //   await FirebaseFirestore.instance
                    //       .collection('users')
                    //       .doc(user.id)
                    //       .set(user.toMap());
                    //   // Rediriger l'utilisateur vers la page d'accueil une fois l'inscription terminée
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const Principal(),
                    //     ),
                    //   );
                    // } on FirebaseAuthException catch (e) {
                    //   // Gérer l'erreur d'authentification
                    //   print(e.message);
                    // }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Principal()));
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
        decoration: InputDecoration(
          hintText: label,
          suffixIcon: Icon(icon),
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
      icon: Icon(widget.obscureText ? Icons.visibility_off : Icons.visibility),
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

  // final _usernameController = TextEditingController();
  // final _numeroController = TextEditingController();
  final _emailController = TextEditingController();
  final _motDePasseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

                // _buildTextField(
                //     "Nom d'utilisateur", Icons.email, _usernameController),
                // const SizedBox(height: 10),
                // IntlPhoneField(
                //   decoration: InputDecoration(
                //     hintText: "Numéro de téléphone",
                //     suffixIcon: Icon(Icons.call),
                //     border:
                //         OutlineInputBorder(borderSide: BorderSide(width: 1)),
                //   ),
                //   initialCountryCode: 'ML',
                //   controller: _numeroController,
                // ),
                // const SizedBox(height: 10),
                _buildTextField("E-mail", Icons.email, _emailController),
                const SizedBox(height: 10),
                _buildPasswordTextField(
                    "Mot de passe", Icons.call, _motDePasseController),
                // const SizedBox(height: 10),
                //   _buildPasswordTextField("Confirmer le mot de passe",
                //       Icons.visibility_off, _motDePasseController),

                const SizedBox(height: 20),
                // Remplacer s'inscrire par connectez-vous si c'est la page de connexion
                ElevatedButton(
                  onPressed: () {},
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
      String label, IconData icon, TextEditingController usernameController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label,
          suffixIcon: Icon(icon),
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
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  void _onDetail() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const DetailProfil(
                username: 'username',
                numero: 'numero',
                email: 'email',
                motDePasse: 'motDePasse')));
  }

  void _onModifier() {
    // Do something when the modify item is tapped
  }

  void _onImage() {
    // Do something when the image item is tapped
  }

  @override
  Widget build(BuildContext context) {
    TextStyle mesTextes = const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
        color: Colors.black);

    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
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
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: AssetImage('assets/images/profil.png'),
                radius: 50,
              ),
            ),
          ),
          Text('TOMOTA', style: mesTextes),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
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
                        'assets/images/contrat.jpg',
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
                            builder: (context) => const InterfaceEntretien()));
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
                        "CV",
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
                            builder: (context) => const Motivation()));
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Cvs.webp',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        "Motivation",
                        style: mesTextes,
                      )
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

//Contrats
class Contrats extends StatefulWidget {
  const Contrats({super.key});

  @override
  State<Contrats> createState() => _ContratsState();
}

class _ContratsState extends State<Contrats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/entretien.jpg'),
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Contrat()));
          },
          child: Container(
            width: 250,
            height: 57,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Contrat à durée déterminée',
                style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }
}

//Contrat

class Contrat extends StatefulWidget {
  const Contrat({super.key});

  @override
  State<Contrat> createState() => _ContratState();
}

class _ContratState extends State<Contrat> {
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.keyboard_backspace,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 213,
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text('CDD'),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Principal()));
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Description'),
              Container(
                width: 320,
                height: 100,
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
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Description'),
              Container(
                width: 320,
                height: 100,
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
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Description'),
              Container(
                width: 320,
                height: 100,
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
  const DetailProfil(
      {super.key,
      required String username,
      required String numero,
      required String email,
      required String motDePasse});

  String get username => '';

  String get numero => '';

  String get email => '';

  String get motDePasse => '';

  @override
  State<DetailProfil> createState() => _DetailProfilState();
}

class _DetailProfilState extends State<DetailProfil> {
  late final String username;
  late final String numero;
  late final String email;
  late final String motDePasse;

  @override
  void initState() {
    super.initState();
    username = widget.username;
    numero = widget.numero;
    email = widget.email;
    motDePasse = widget.motDePasse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          // Nom d'utilisateur
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            child: Text(
              'Nom d\'utilisateur: $username',
            ),
          ),

          // Numéro
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            child: Text(
              'Numéro: $numero',
            ),
          ),

          // Email
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            child: Text(
              'Email: $email',
            ),
          ),

          // Mot de passe
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            child: Text(
              'Mot de passe: $motDePasse',
            ),
          ),
        ]),
      ),
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
            Image.asset(
              'assets/images/Cvs.webp',
              width: 100,
              height: 100,
            ),
            Container()
          ],
        ),
        Text(
          'Cv',
          style: mesTextes,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 250,
          height: 300,
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
              Container(
                width: 200,
                height: 60,
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
                      Image.asset('assets/images/Cvs.webp'),
                      Text(
                        'Généralité',
                        style: mesTextes,
                      )
                    ]),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
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
                        Image.asset('assets/images/Cvs.webp'),
                        Text(
                          'Structure',
                          style: mesTextes,
                        )
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
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
                        Image.asset('assets/images/Cvs.webp'),
                        Text(
                          'Exemplaire',
                          style: mesTextes,
                        )
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
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
                        Image.asset('assets/images/Cvs.webp'),
                        Text(
                          'Rédaction',
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

//Document lettre de motivation

class Motivation extends StatefulWidget {
  const Motivation({super.key});

  @override
  State<Motivation> createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
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
            Image.asset(
              'assets/images/Cvs.webp',
              width: 100,
              height: 100,
            ),
            Container()
          ],
        ),
        Text(
          'Lettre de Motivation',
          style: mesTextes,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 250,
          height: 300,
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
              Container(
                width: 200,
                height: 60,
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
                      Image.asset('assets/images/Cvs.webp'),
                      Text(
                        'Généralité',
                        style: mesTextes,
                      )
                    ]),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
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
                        Image.asset('assets/images/Cvs.webp'),
                        Text(
                          'Structure',
                          style: mesTextes,
                        )
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
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
                        Image.asset('assets/images/Cvs.webp'),
                        Text(
                          'Exemplaire',
                          style: mesTextes,
                        )
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
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
                        Image.asset('assets/images/Cvs.webp'),
                        Text(
                          'Rédaction',
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

// class _InterfaceEntretienState extends State<InterfaceEntretien> {
//   List<ElementEntretien> entretienEntretien = [];
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Appeler une fonction pour récupérer les données et mettre à jour la liste
//   //   fetchData();
//   // }

//   // Fonction pour récupérer les données (vous devrez l'implémenter selon votre source de données)
//   // void fetchData() {
//   //   // Simulons l'ajout de quelques éléments à la liste
//   //   setState(() {

//   //     entretienEntretien = [
//   //       ElementEntretien(
//   //           imagePath: 'assets/images/entretien.jpg',
//   //           contenu: 'contenu',
//   //           titre: 'titre'),
//   //       ElementEntretien(imagePath: '', contenu: 'contenu', titre: 'titre')
//   //     ];
//   //   });
//   // }

//   void fetchData() async {
//     try {
//       // Récupérer une référence à la collection 'entretien' dans Firestore
//       CollectionReference<Object?> entretienCollection =
//           FirebaseFirestore.instance.collection('EntretienElement');

//       // Récupérer les documents de la collection
//       QuerySnapshot<Object?> entretienSnapshot =
//           await entretienCollection.get();

//       // Extraire les données des documents
//       List<ElementEntretien> entretienEntretien =
//           entretienSnapshot.docs.map((QueryDocumentSnapshot<Object?> doc) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         return ElementEntretien(
//           titre: data['titre'] as String,
//           contenu: data['contenu'] as String,
//           imagePath: data['imagePath'] as String? ??
//               'assets/images/entretien.jpg', // Utilisez une image par défaut si 'imagePath' est null
//         );
//       }).toList();

//       // Mettre à jour l'état avec les données récupérées
//       setState(() {
//         entretienEntretien = entretienEntretien;
//       });
//     } catch (e) {
//       print('Erreur lors de la récupération des données : $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SvgPicture.asset(
//                 'assets/images/Back.svg',
//                 height: 30,
//                 width: 30,
//               ),
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: ShapeDecoration(
//                   image: const DecorationImage(
//                     image: AssetImage("assets/images/entretien.jpg"),
//                     fit: BoxFit.fill,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               Container(),
//             ],
//           ),
//           const SizedBox(height: 50),
//           Expanded(
//             child: Container(
//               height: 100,
//               decoration: ShapeDecoration(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(width: 0.50),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child:
//                   //  ListView(
//                   //   children: [
//                   //     buildListItem(
//                   //         entretienEntretien[0], "assets/images/entretien"),
//                   //     buildListItem(entretienEntretien[1], ""),
//                   //   ],
//                   // ),
//                   ListView(
//                 children: [
//                   if (entretienEntretien.isNotEmpty)
//                     buildListItem(
//                         entretienEntretien[0], "assets/images/entretien"),
//                   if (entretienEntretien.length > 1)
//                     buildListItem(entretienEntretien[1], ""),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListItem(ElementEntretien elementEntretien, String imagePath) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     ContenuEntretien(elementEntretien: elementEntretien)));
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         height: 60,
//         width: 100,
//         decoration: ShapeDecoration(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
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
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               width: 79,
//               height: 61,
//               decoration: imagePath.isNotEmpty
//                   ? ShapeDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(imagePath),
//                         fit: BoxFit.fill,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     )
//                   : null,
//             ),
//             Text(
//               elementEntretien.titre,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Color(0xE02D3030),
//                 fontSize: 15,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w400,
//                 height: 0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
              SvgPicture.asset(
                'assets/images/Back.svg',
                height: 30,
                width: 30,
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
              height: 100,
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
        width: 100,
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

// class _InterfaceEntretienState extends State<InterfaceEntretien> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SvgPicture.asset(
//                   'assets/svg/Back.svg',
//                   height: 30,
//                   width: 30,
//                 ),
//                 Container(
//                   width: 120,
//                   height: 120,
//                   decoration: ShapeDecoration(
//                     image: const DecorationImage(
//                       image: AssetImage("assets/images/entretien.jpg"),
//                       fit: BoxFit.fill,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 Container()
//               ],
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Expanded(
//               child: Container(
//                 width: 300,
//                 height: 800,
//                 decoration: ShapeDecoration(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     side: const BorderSide(width: 0.50),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ListView.builder(
//                       itemCount:
//                           2, // Remplacez par le nombre total d'éléments que vous avez
//                       itemBuilder: (context, index) {
//                         // Vous pouvez ajuster les données en fonction de votre structure de données
//                         String title;
//                         String imagePath;

//                         if (index == 0) {
//                           title = 'Préparation';
//                           imagePath = "assets/images/entretien.jpg";
//                         } else {
//                           title = 'Questions courantes';
//                           imagePath =
//                               ''; // Ajoutez le chemin de l'image si nécessaire
//                         }

//                         return Container(
//                           width: 260,
//                           height: 60,
//                           decoration: ShapeDecoration(
//                             color: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             shadows: const [
//                               BoxShadow(
//                                 color: Color(0x3F000000),
//                                 blurRadius: 4,
//                                 offset: Offset(1, 1),
//                                 spreadRadius: 0,
//                               )
//                             ],
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Container(
//                                 width: 79,
//                                 height: 61,
//                                 decoration: ShapeDecoration(
//                                   image: imagePath.isNotEmpty
//                                       ? DecorationImage(
//                                           image: AssetImage(imagePath),
//                                           fit: BoxFit.fill,
//                                         )
//                                       : null,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 title,
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                   color: Color(0xE02D3030),
//                                   fontSize: 15,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w400,
//                                   height: 0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),

//                     // Container(
//                     //   width: 260,
//                     //   height: 60,
//                     //   decoration: ShapeDecoration(
//                     //     color: Colors.white,
//                     //     shape: RoundedRectangleBorder(
//                     //       borderRadius: BorderRadius.circular(5),
//                     //     ),
//                     //     shadows: const [
//                     //       BoxShadow(
//                     //         color: Color(0x3F000000),
//                     //         blurRadius: 4,
//                     //         offset: Offset(1, 1),
//                     //         spreadRadius: 0,
//                     //       )
//                     //     ],
//                     //   ),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     //     children: [
//                     //       Container(
//                     //         width: 79,
//                     //         height: 61,
//                     //         decoration: ShapeDecoration(
//                     //           image: const DecorationImage(
//                     //             image: AssetImage("assets/images/entretien.jpg"),
//                     //             fit: BoxFit.fill,
//                     //           ),
//                     //           shape: RoundedRectangleBorder(
//                     //             borderRadius: BorderRadius.circular(10),
//                     //           ),
//                     //         ),
//                     //       ),
//                     //       const Text(
//                     //         'Préparation',
//                     //         textAlign: TextAlign.center,
//                     //         style: TextStyle(
//                     //           color: Color(0xE02D3030),
//                     //           fontSize: 15,
//                     //           fontFamily: 'Poppins',
//                     //           fontWeight: FontWeight.w400,
//                     //           height: 0,
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                     // Container(
//                     //   width: 260,
//                     //   height: 60,
//                     //   decoration: ShapeDecoration(
//                     //     color: Colors.white,
//                     //     shape: RoundedRectangleBorder(
//                     //       borderRadius: BorderRadius.circular(5),
//                     //     ),
//                     //     shadows: const [
//                     //       BoxShadow(
//                     //         color: Color(0x3F000000),
//                     //         blurRadius: 4,
//                     //         offset: Offset(1, 1),
//                     //         spreadRadius: 0,
//                     //       )
//                     //     ],
//                     //   ),
//                     //   child: const Row(
//                     //     mainAxisAlignment: MainAxisAlignment.center,
//                     //     children: [
//                     //       // Container(
//                     //       //   width: 79,
//                     //       //   height: 61,
//                     //       //   decoration: ShapeDecoration(
//                     //       //     image: const DecorationImage(
//                     //       //       image: AssetImage("assets/images/entretien.jpg"),
//                     //       //       fit: BoxFit.fill,
//                     //       //     ),
//                     //       //     shape: RoundedRectangleBorder(
//                     //       //       borderRadius: BorderRadius.circular(10),
//                     //       //     ),
//                     //       //   ),
//                     //       // ),
//                     //       Text(
//                     //         'Questions courantes',
//                     //         textAlign: TextAlign.center,
//                     //         style: TextStyle(
//                     //           color: Color(0xE02D3030),
//                     //           fontSize: 15,
//                     //           fontFamily: 'Poppins',
//                     //           fontWeight: FontWeight.w400,
//                     //           height: 0,
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                     Container(
//                       width: 260,
//                       height: 60,
//                       decoration: ShapeDecoration(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         shadows: const [
//                           BoxShadow(
//                             color: Color(0x3F000000),
//                             blurRadius: 4,
//                             offset: Offset(1, 1),
//                             spreadRadius: 0,
//                           )
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             width: 79,
//                             height: 61,
//                             decoration: ShapeDecoration(
//                               image: const DecorationImage(
//                                 image: AssetImage(
//                                     "assets/images/conversation.png"),
//                                 fit: BoxFit.fill,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const Text(
//                             'Contacter coach',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xE02D3030),
//                               fontSize: 15,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 260,
//                       height: 60,
//                       decoration: ShapeDecoration(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         shadows: const [
//                           BoxShadow(
//                             color: Color(0x3F000000),
//                             blurRadius: 4,
//                             offset: Offset(1, 1),
//                             spreadRadius: 0,
//                           )
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             width: 79,
//                             height: 61,
//                             decoration: ShapeDecoration(
//                               image: const DecorationImage(
//                                 image: AssetImage(
//                                     "assets/images/conversation.png"),
//                                 fit: BoxFit.fill,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const Text(
//                             'Conversations',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xE02D3030),
//                               fontSize: 15,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class ContenuEntretien extends StatefulWidget {
  const ContenuEntretien({super.key, required this.elementEntretien});

  final ElementEntretien elementEntretien;

  @override
  State<ContenuEntretien> createState() => _ContenuEntretienState();
}

class _ContenuEntretienState extends State<ContenuEntretien> {
  // final TextEditingController _controller = TextEditingController();
  // String dataFromFirebase = '';

  // @override
  // void initState() {
  //   super.initState();
  //   // Appel à une fonction pour récupérer des données depuis Firebase
  //   fetchDataFromFirebase();
  // }

  // // Fonction pour récupérer des données depuis Firebase Firestore
  // void fetchDataFromFirebase() async {
  //   var document = await FirebaseFirestore.instance
  //       .collection('ElementEntretien')
  //       .doc('AGsrV4WZ27nj5aP349Ld')
  //       .get();

  //   // Vérifiez si le document existe avant de récupérer les données
  //   if (document.exists) {
  //     setState(() {
  //       // Récupérez les données et mettez à jour l'état
  //       dataFromFirebase = document.data()?['titre'] ?? '';
  //      widget.elementEntretien.titre = dataFromFirebase;
  //     });
  //   }
  // }

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
                  height: 500,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF4E5394)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:  Text(
        widget.elementEntretien.contenu,
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
