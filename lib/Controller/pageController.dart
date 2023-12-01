import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:mongrh/admin.dart';
import 'package:mongrh/mes_logiques/mes_classes.dart';
import 'package:provider/provider.dart';

class EntretienPage extends StatelessWidget {
  const EntretienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<EntretienAdminController>().page;
  }
}

// class ContratPage extends StatelessWidget {
//   const ContratPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return context.watch<ContratAdminController>().pages;
//   }
// }

class EntretienAdminController extends ChangeNotifier {
  Future<void> updateEntretien(ElementEntretien element) async {
    try {
      // Utilisez l'id du contrat pour mettre à jour le document correspondant dans Firestore
      await FirebaseFirestore.instance
          .collection('ElementEntretien')
          .doc(element.id)
          .update({
        'titre': element.titre,
        'contenu': element.contenu,
      });
    } catch (e) {
      print('Erreur lors de la mise à jour de cet élément : $e');
    }
  }

  ElementEntretien? element;
  var selectedIndex = 0;
  List<StatefulWidget> pages = [];
  StatefulWidget get page {
    return pages[selectedIndex];
  }

  EntretienAdminController() {
    pages = [
      const EntretienAdmin(),
      const AjoutEntretien(),
      ModifierEntretien()
    ];
  }
  gotoAddEntretien() {
    selectedIndex = 1;
    notifyListeners();
  }

  gotoListEntretien() {
    selectedIndex = 0;
    notifyListeners();
  }

  gotoUpdateElementEntretien(ElementEntretien elements) {
    element = elements;
    selectedIndex = 2;
    notifyListeners();
  }
}

class ContratAdminPage extends StatelessWidget {
  const ContratAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<ContratAdminController>().page;
  }
}

class ContratAdminController extends ChangeNotifier {
  Future<void> updateContrat(Contrat contrat) async {
    try {
      // Utilisez l'id du contrat pour mettre à jour le document correspondant dans Firestore
      await FirebaseFirestore.instance
          .collection('Contrat')
          .doc(contrat.id)
          .update({
        'type': contrat.type,
        'description': contrat.description,
        'droits': contrat.droits,
        'devoirs': contrat.devoirs,
      });
    } catch (e) {
      print('Erreur lors de la mise à jour du contrat : $e');
    }
  }

  var selectedIndex = 0;
  Contrat? contrat;
  List<StatefulWidget> pages = [];
  StatefulWidget get page {
    return pages[selectedIndex];
  }

  ContratAdminController() {
    pages = [
      const ContratAdmin(),
      const AjoutContrat(),
      ModifierContrat(),
    ];
  }

  gotoAddContrat() {
    selectedIndex = 1;
    notifyListeners();
  }

  gotoListContrat() {
    selectedIndex = 0;
    notifyListeners();
  }

  modifierContrat(Contrat contrats) {
    contrat = contrats;
    selectedIndex = 2;
    notifyListeners();
  }
}

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<DocumentController>().page;
  }
}

class DocumentController extends ChangeNotifier {
  var selectedIndex = 0;
  List<StatefulWidget> pages = [];
  StatefulWidget get page {
    return pages[selectedIndex];
  }

  DocumentController() {
    pages = [
      CvAdmin(),
      AjouterDoc(),
    ];
  }

  gotoListDoc() {
    selectedIndex = 0;
    notifyListeners();
  }

  gotoAddDoc() {
    selectedIndex = 1;
    notifyListeners();
  }
}
