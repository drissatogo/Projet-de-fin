import 'package:flutter/widgets.dart';
import 'package:mongrh/admin.dart';
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
  var selectedIndex = 0;
  List<StatefulWidget> pages = [];
  StatefulWidget get page {
    return pages[selectedIndex];
  }

  EntretienAdminController() {
    pages = [
      const EntretienAdmin(),
      const AjoutEntretien(),
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
}

class ContratAdminPage extends StatelessWidget {
  const ContratAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<ContratAdminController>().page;
  }
}



class ContratAdminController extends ChangeNotifier {
  var selectedIndex = 0;
  List<StatefulWidget> pages = [];
  StatefulWidget get page {
    return pages[selectedIndex];
  }

  ContratAdminController() {
    pages = [
      const ContratAdmin(),
      const AjoutContrat(),
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
}



