import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mardi 28 janvier",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 5),
            const Text(
              "Bonsoir, Rachel",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ReminderCard()), // Carte Rappels
                  const SizedBox(width: 20),
                  Expanded(child: ProjectCard()), // Carte Projets
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🏠 MENU LATÉRAL (Drawer)
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Text(
              "DRC-GovTrack",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          _drawerItem(Icons.home, "Accueil", true),
          _drawerItem(Icons.shopping_cart, "Activités", false),
          _drawerItem(Icons.mail, "Boîte de réception", false),
          _drawerItem(Icons.warning, "Gestion des plaintes", false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Text("PROJETS",
                style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          ),
          _drawerItem(Icons.list, "Transforme", false),
          _drawerItem(Icons.group, "Soutien aux Femmes", false),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, bool selected) {
    return ListTile(
      leading: Icon(icon, color: selected ? Colors.blue : Colors.black),
      title: Text(title,
          style: TextStyle(color: selected ? Colors.blue : Colors.black)),
      tileColor: selected ? Colors.blue[50] : Colors.transparent,
      onTap: () {},
    );
  }
}

// 📌 CARTE RAPPELS
class ReminderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Rappels",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _reminderItem("Plaintes: De. Azuri Masika", "Problème lors de..."),
            _reminderItem("Activité: Formation",
                "Formation sur le plan d’affaire, lundi..."),
            _reminderItem("Activité: Formation",
                "Formation sur le plan d’affaire, jeudi..."),
            _reminderItem("Plaintes: De. Nathalie Bumba", "Ma structure n’..."),
            _reminderItem("Plaintes: De. Azuri Masika", "Problème lors de..."),
            const SizedBox(height: 10),
            const Text("Afficher plus", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  Widget _reminderItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text("• $title  -  $subtitle",
          style: TextStyle(color: Colors.grey[700])),
    );
  }
}

// 📌 CARTE PROJETS
class ProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Projets",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _projectItem(Icons.add, "Créer un projet", Colors.grey[300]!),
            _projectItem(Icons.list, "Transforme", Colors.orange[200]!),
            _projectItem(Icons.list, "Soutient aux femmes", Colors.blue[200]!),
          ],
        ),
      ),
    );
  }

  Widget _projectItem(IconData icon, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: color, child: Icon(icon, color: Colors.black)),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
