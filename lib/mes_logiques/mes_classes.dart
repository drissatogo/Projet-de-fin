class MyUser {
  String id;
  String username;
  int numero;
  String email;
  String motDePasse;

  MyUser(
      {required this.id,
      required this.username,
      required this.numero,
      required this.email,
      required this.motDePasse});

  // Constructeur nommé pour créer un utilisateur à partir d'une carte (Map)
  MyUser.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        email = map['email'],
        motDePasse = map['password'],
        numero = map['numero'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': motDePasse,
      'numero': numero,
    };
  }
}

class Contrat {
  String type;
  String description;
  String droits;
  String devoirs;

  Contrat(
      {required this.type,
      required this.description,
      required this.droits,
      required this.devoirs});
}

class Documents {
  String nom;
  String contenu;
  String explication;

  Documents(
      {required this.nom, required this.contenu, required this.explication});
}

class Droit {
  String nom;
  String description;

  Droit({required this.description, required this.nom});
}

class Devoir {
  String nom;
  final String description;

  Devoir({required this.description, required this.nom});
}

class ElementEntretien {
  String titre;
  String contenu;
  final String imagePath;

  ElementEntretien(
      {required this.titre, required this.contenu, required this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'titre': titre,
      'contenu': contenu,
    };
  }
}
