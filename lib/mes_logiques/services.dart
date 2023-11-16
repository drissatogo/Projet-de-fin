import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mongrh/mes_logiques/mes_classes.dart';

class ElementEntretienService {
  Future<String> ajouterElementEntretien(ElementEntretien elementEntretien) async {
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
