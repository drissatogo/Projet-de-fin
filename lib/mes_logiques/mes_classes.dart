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

  Contrat({required this.type});
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

  ElementEntretien({required this.titre, required this.contenu});

  Map<String, dynamic> toMap() {
    return {
      'nom': titre,
      'contenu': contenu,
    };
  }
}
