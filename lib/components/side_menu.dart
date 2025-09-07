import 'package:flutter/material.dart';
import 'colors.dart';

class SideMenu extends StatelessWidget {
  final List<bool> selected;
  const SideMenu({
    Key? key,
    this.selected = const [false, false, false, false, false, false],
  }) : super(key: key);

  bool _isItemAvailable(int index) {
    return index < selected.length;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppColor.white),
            child: Text(
              'Menu',
              style: TextStyle(
                color: AppColor.darkViolet,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: AppColor.graphite),
            title: const Text('Home'),
            selected: _isItemAvailable(0) ? selected[0] : false,
            selectedTileColor: AppColor.violet.withOpacity(0.1),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: AppColor.graphite),
            title: const Text('Agendar'),
            selected: _isItemAvailable(1) ? selected[1] : false,
            selectedTileColor: AppColor.violet.withOpacity(0.1),
            onTap: () {
              Navigator.pushNamed(context, '/agendamento');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list, color: AppColor.graphite),
            title: const Text('Meus Horários'),
            selected: _isItemAvailable(2) ? selected[2] : false,
            selectedTileColor: AppColor.violet.withOpacity(0.1),
            onTap: () {
              Navigator.pushNamed(context, '/lista');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people, color: AppColor.graphite),
            title: const Text('Profissionais'),
            selected: _isItemAvailable(3) ? selected[3] : false,
            selectedTileColor: AppColor.violet.withOpacity(0.1),
            onTap: () {
              Navigator.pushNamed(context, '/profissionais');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.medical_services,
              color: AppColor.graphite,
            ),
            title: const Text('Serviços'),
            selected: _isItemAvailable(4) ? selected[4] : false,
            selectedTileColor: AppColor.violet.withOpacity(0.1),
            onTap: () {
              Navigator.pushNamed(context, '/servicos');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColor.graphite),
            title: const Text('Sobre'),
            selected: _isItemAvailable(5) ? selected[5] : false,
            selectedTileColor: AppColor.violet.withOpacity(0.1),
            onTap: () {
              Navigator.pushNamed(context, '/sobre');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColor.graphite),
            title: const Text('Sair'),
            onTap: () {
              // TODO: Implementar lógica de logout
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
