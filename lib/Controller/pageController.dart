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
    selectedIndex = 1;
    notifyListeners();
  }
}
