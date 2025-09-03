import 'package:flutter/material.dart';

import '../components/colors.dart';
import '../components/custom_appbar.dart';
import '../models/profissional.dart';
import '../controller/profissional_controller.dart';
import '../components/side_menu.dart';

class ProfissionaisView extends StatefulWidget {
  const ProfissionaisView({super.key});

  @override
  State<ProfissionaisView> createState() => _ProfissionaisViewState();
}

class _ProfissionaisViewState extends State<ProfissionaisView> {
  final _profissionalController = ProfissionalController();
  List<Profissional> _profissionais = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfissionais();
  }

  void _loadProfissionais() async {
    await _profissionalController.readAll();
    setState(() {
      _profissionais = _profissionalController.profissionalList;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(
        selected: [false, false, false, true, false, false],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppBar(texto: 'Nossos Profissionais'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColor.violet),
            )
          : _profissionais.isEmpty
          ? const Center(
              child: Text(
                'Nenhum profissional encontrado.',
                style: TextStyle(fontSize: 18, color: AppColor.graphite),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _profissionais.length,
              itemBuilder: (context, index) {
                final profissional = _profissionais[index];
                return _buildProfissionalCard(profissional);
              },
            ),
    );
  }

  Widget _buildProfissionalCard(Profissional profissional) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profissional.nome,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.violet,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Categoria: ${profissional.categoria}',
              style: const TextStyle(fontSize: 16, color: AppColor.graphite),
            ),
            const SizedBox(height: 8),
            Text(
              'Serviços: ${profissional.servicos.map((s) => s.nome).join(', ')}',
              style: const TextStyle(fontSize: 14, color: AppColor.graphite),
            ),
          ],
        ),
      ),
    );
  }
}
