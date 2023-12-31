import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(const MaterialApp(
    home: Contrat(),
  ));
}

class PremierePage extends StatelessWidget {
  const PremierePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    builder: (context) => PageInscription(
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
                          PageInscription(isLoginPage: false)));
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
    );
  }
}

//Page d'inscription
class PageInscription extends StatefulWidget {
  const PageInscription({Key? key, this.isLoginPage = false}) : super(key: key);
  final bool isLoginPage;

  get user => null;

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
  // Définir _obscureText pour gérer l'état de masquage du mot de passe
  //bool isLoginPage = true;

  //masquer ou afficher les champs en fonction des pages
  /*void _togglePage() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // Ajout des attributs de l'utilisateur dans les champs de texte
    _usernameController.text = widget.user.username;
    _numeroController.text = widget.user.numero.toString();
    _emailController.text = widget.user.email;
    _motDePasseController.text = widget.user.motDePasse;

    return Scaffold(
      body: Padding(
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
            // if (widget.isLoginPage) ...[
            //   _buildPasswordTextField(
            //       "Confirmer le mot de passe", Icons.visibility_off),
            // ],

            _buildTextField(
                "Nom d'utilisateur", Icons.email, _usernameController),
            const SizedBox(height: 10),
            IntlPhoneField(
              decoration: InputDecoration(
                hintText: "Numéro de téléphone",
                suffixIcon: Icon(Icons.call),
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
              ),
              initialCountryCode: 'ML',
              controller: _numeroController,
            ),
            const SizedBox(height: 10),
            _buildPasswordTextField(
                "Mot de passe", Icons.call, _motDePasseController),
            const SizedBox(height: 10),
            if (widget.isLoginPage) ...[
              _buildPasswordTextField("Confirmer le mot de passe",
                  Icons.visibility_off, _motDePasseController),
            ],

            const SizedBox(height: 20),
            // Remplacer s'inscrire par connectez-vous si c'est la page de connexion
            ElevatedButton(
              onPressed: () {
                // Récupération des saisies de l'utilisateur
                String username = _usernameController.text;
                String numero = _numeroController.text;
                String email = _emailController.text;
                String motDePasse = _motDePasseController.text;

                // Enregistrement des données de l'utilisateur
                // ...

                // Redirection vers la page détail profil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProfil(
                      username: username,
                      numero: numero,
                      email: email,
                      motDePasse: motDePasse,
                    ),
                  ),
                );
              },
              child: Text(widget.isLoginPage ? 'S\'inscrire' : 'Se connecter'),
            ),
          ],
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
            builder: (context) => DetailProfil(
                username: 'username',
                numero: 'numero',
                email: 'email',
                motDePasse: 'motDePasse'
                )));
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
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              showMenu<String>(
                context: context,
                position: RelativeRect.fromLTRB(250, 250, 50, 50),
                items: [
                  PopupMenuItem<String>(
                    value: 'detail',
                    child: Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(width: 10),
                        Text('Détail'),
                      ],
                    ),
                    onTap: _onDetail,
                  ),
                  PopupMenuItem<String>(
                    value: 'modifier',
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10),
                        Text('Modifier'),
                      ],
                    ),
                    onTap: _onModifier,
                  ),
                  PopupMenuItem<String>(
                    value: 'image',
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(width: 10),
                        Text('Image'),
                      ],
                    ),
                    onTap: _onImage,
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
          Container(
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
                        builder: (context) => Contrats(),
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
                  onTap: () {},
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
                  onTap: () {},
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
                  onTap: () {},
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
              // alignment: WrapAlignment.center,
              // crossAxisAlignment: WrapCrossAlignment.center,
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
        // GestureDetector(
        //   child: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: Icon(Icons.keyboard_backspace_outlined)),
        // ),
        Image(
          image: AssetImage('assets/images/entretien.jpg'),
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contrat()));
          },
          child: Container(
            width: 250,
            height: 57,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              shadows: [
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 213,
                height: 45,
                decoration: BoxDecoration(
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
                child: Center(
                  child: Text('CDD'),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Principal()));
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description'),
              Container(
                width: 320,
                height: 100,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Description'),
              Container(
                width: 320,
                height: 100,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Description'),
              Container(
                width: 320,
                height: 100,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
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
