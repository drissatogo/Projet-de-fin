import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mongrh/mes_logiques/mes_classes.dart';

class ElementEntretienService {
  Future<String> ajouterElementEntretien(
      ElementEntretien elementEntretien) async {
    // Initialisez Firebase.
    print("test");
    await Firebase.initializeApp();
    print("init");
    // Créez une instance de la classe `FirebaseFirestore`.
    final firestore = FirebaseFirestore.instance;

    // Créez un document dans la collection `elements_entretiens`.
    final document = firestore.collection('ElementEntretien').doc();
    print("doc");

    // Ajoutez des données au document.
    await document.set({
      'titre': elementEntretien.titre,
      'contenu': elementEntretien.contenu,
    }).then((value) {
      print("success");
    }).catchError((onError) {
      print(onError);
    });
    print("finish");
    return "ok";
  }
}


class ContratService{
  Future<String> ajouterContrat(
      Contrat contrat) async {
    // Initialisez Firebase.
    print("test");
    await Firebase.initializeApp();
    print("init");
    // Créez une instance de la classe `FirebaseFirestore`.
    final firestore = FirebaseFirestore.instance;

    // Créez un document dans la collection `elements_entretiens`.
    final document = firestore.collection('Contrat').doc();
    print("doc");

    // Ajoutez des données au document.
    await document.set({
      'type': contrat.type,
      'description': contrat.description,
      'droits': contrat.droits,
      'devoirs':contrat.devoirs
    }).then((value) {
      print("success");
    }).catchError((onError) {
      print(onError);
    });
    print("finish");
    return "ok";
  }
}


class DocService{
  Future<String> ajouteDoc(
      Documents documents) async {
    // Initialisez Firebase.
    print("test");
    await Firebase.initializeApp();
    print("init");
    // Créez une instance de la classe `FirebaseFirestore`.
    final firestore = FirebaseFirestore.instance;

    // Créez un document dans la collection `elements_entretiens`.
    final document = firestore.collection('Documents').doc();
    print("doc");

    // Ajoutez des données au document.
    await document.set({
      'nom': documents.nom,
      'contenu': documents.contenu,
      'explication': documents.explication,
    }).then((value) {
      print("success");
    }).catchError((onError) {
      print(onError);
    });
    print("finish");
    return "ok";
  }
}

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("Connecté en tant que ${userCredential.user!.email}");
  } on FirebaseAuthException catch (e) {
    print("Erreur de connexion : $e");
  }
}


Future<Users?> getUserById(String userId) async {
  try {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (userSnapshot.exists) {
      // Le document pour cet utilisateur existe
      // Convertissez les données du document en objet Users
      Users user = Users.fromMap(userSnapshot.data() as Map<String, dynamic>);
      return user;
    } else {
      // Aucun utilisateur trouvé avec cet UID
      return null;
    }
  } catch (e) {
    print("Erreur lors de la récupération de l'utilisateur : $e");
    return null;
  }
}


void fetchData() async {
  try {
    CollectionReference<Map<String, dynamic>> contratCollection =
    FirebaseFirestore.instance.collection('Contrat');

    QuerySnapshot<Map<String, dynamic>> contratSnapshot =
    await contratCollection.get();

    List<Contrat> items = contratSnapshot.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      Map<String, dynamic> data = doc.data();
      return Contrat(
        // sigle: data['sigle'] as String,
        type: data['Type'] as String,
        description: data['Description'] as String,
        droits: data['Droits']as String,
        devoirs: data['Devoirs'] as String,
      );
    }).toList();

    /*setState(() {
      lescontrats = items;
    });*/
  } catch (e) {
    print('Erreur lors de la récupération des données : $e');
  }
}



