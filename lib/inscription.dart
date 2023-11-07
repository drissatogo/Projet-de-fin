import 'package:flutter/material.dart';

class PageInscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("Nom d'utilisateur", Icons.person),
            _buildTextField("E-mail", Icons.email),
            _buildTextField("Numéro de téléphone", Icons.phone),
            _buildTextField("Mot de passe", Icons.lock),
            _buildTextField("Confirmer le mot de passe", Icons.lock),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Gérer la soumission du formulaire ici
              },
              child: Text('S\'inscrire'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
      ),
    );
  }
}
