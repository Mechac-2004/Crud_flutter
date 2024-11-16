import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> student;
  final VoidCallback onDelete;

  const DetailPage({super.key, required this.student, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails sur un étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_circle, size: 80),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${student['nom']} ${student['prenom']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Email : ${student['email']}"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(student['description'] ?? "Aucune description"),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Retour à la liste des étudiants.
                  },
                  child: const Text("Retour"),
                ),
                ElevatedButton(
                  onPressed: () {
                    onDelete();
                    Navigator.pop(context); // Retour après suppression.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text("Supprimer"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
