import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name = 'Nom d\'utilisateur';
  final String email = 'email@exemple.com';
  final String phone = '+123 456 789';
  final String address = '123 Rue, Ville, Pays';
  final String profileImage = 'images/profile.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(height: 15),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Membre depuis Janvier 2021',
              style: TextStyle(color: Colors.grey[600]),
            ),
            Divider(
              height: 30,
              color: Colors.grey[400],
            ),
            buildUserInfo(Icons.email, 'Email', email),
            buildUserInfo(Icons.phone, 'Téléphone', phone),
            buildUserInfo(Icons.location_on, 'Adresse', address),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _navigateToEditProfile(context);
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Modifier"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    _confirmDeleteProfile(context);
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                  label: Text("Supprimer", style: TextStyle(color: Colors.red)),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfo(IconData icon, String label, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 15),
          Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              info,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()), // Create this page
    );
  }

  void _confirmDeleteProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmer la suppression"),
          content: Text("Êtes-vous sûr de vouloir supprimer votre profil ? Cette action est irréversible."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _deleteProfile(context); // Call the delete function
              },
              child: Text("Supprimer", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _deleteProfile(BuildContext context) {
    // Add the logic for deleting the profile here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Profil supprimé avec succès."),
        backgroundColor: Colors.red,
      ),
    );
    Navigator.pop(context); // Optionally navigate back
  }
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le Profil'),
      ),
      body: Center(
        child: Text('Page de modification du profil en cours de développement.'),
      ),
    );
  }
}
