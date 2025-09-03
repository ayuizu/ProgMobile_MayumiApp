import 'package:flutter/material.dart';
import '../components/colors.dart';
import '../components/custom_appbar.dart';
import '../components/side_menu.dart';

class SobreView extends StatelessWidget {
  const SobreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(texto: 'Sobre'),
      ),
      drawer: const SideMenu(
        selected: [false, false, false, false, false, true],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Desenvolvedores',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColor.violet,
                ),
              ),
              const SizedBox(height: 20),
              _buildDeveloperCard('Adrianne Ayumi Izu', 'Desenvolvedor'),
              _buildDeveloperCard('Nome 2', 'Role 2'),
              _buildDeveloperCard('Nome 3', 'Role 3'),
              _buildDeveloperCard('Nome 4', 'Role 4'),
              _buildDeveloperCard('Nome 5', 'Role 5'),
              _buildDeveloperCard('Nome 6', 'Role 6'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperCard(String name, String role) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.person, color: AppColor.violet),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(role),
      ),
    );
  }
}
