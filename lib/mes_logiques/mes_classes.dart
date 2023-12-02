class Users {
  String id;
  String username;
  int numero;
  String email;
  String motDePasse;
  String? photo; // Changer String en String?

  Users({
    required this.id,
    required this.username,
    required this.numero,
    required this.email,
    required this.motDePasse,
     this.photo,
  });

  // Constructeur nommé pour créer un utilisateur à partir d'une carte (Map)
  Users.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        username = map['username'] ?? '',
        email = map['email'] ?? '',
        motDePasse = map['password'] ?? '',
        numero = map['numero'] ?? 0,
        photo = map['photo'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': motDePasse,
      'numero': numero,
      'photo': photo, // Ajout de 'photo' à la carte
    };
  }
}

class Contrat {
  // String sigle;
  String type;
  String description;
  String droits;
  String devoirs;
  String? id;

  Contrat(
      {
      // required this.sigle,
      required this.type,
      required this.description,
      required this.droits,
      required this.devoirs,
      this.id});

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
  String imagePath;
  String? id;

  ElementEntretien({
    required this.titre,
    required this.contenu,
    required this.imagePath,
    this.id
  });

  Map<String, dynamic> toMap() {
    return {
      'titre': titre,
      'contenu': contenu,
      'imagePath':imagePath
    };
  }
}
