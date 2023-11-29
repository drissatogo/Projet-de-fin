class Users {
  String id;
  String username;
  int numero;
  String email;
  String motDePasse;

  Users(
      {required this.id,
      required this.username,
      required this.numero,
      required this.email,
      required this.motDePasse});

  // Constructeur nommé pour créer un utilisateur à partir d'une carte (Map)
  Users.fromMap(Map<String, dynamic> map)
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
  // String sigle;
  String type;
  String description;
  String droits;
  String devoirs;

  Contrat(
      {
        // required this.sigle,
      required this.type,
      required this.description,
      required this.droits,
      required this.devoirs});

  factory Contrat.fromMap(Map<String, dynamic> map) {
    return Contrat(
      // sigle: map['sigle'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      droits: map['droits'] ?? '',
      devoirs: map['devoirs'] ?? '',
    );
  }
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
