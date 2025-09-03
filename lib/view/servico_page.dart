import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/colors.dart';
import '../components/custom_appbar.dart';
import '../models/servico.dart';
import '../controller/servico_controller.dart';
import '../components/side_menu.dart';

class ServicosView extends StatefulWidget {
  const ServicosView({super.key});

  @override
  State<ServicosView> createState() => _ServicosViewState();
}

class _ServicosViewState extends State<ServicosView> {
  final _servicoController = ServicoController();
  List<Servico> _servicos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadServicos();
  }

  void _loadServicos() async {
    await _servicoController.readAll();
    setState(() {
      _servicos = _servicoController.servicoList;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return Scaffold(
      drawer: const SideMenu(
        selected: [false, false, false, false, true, false],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppBar(texto: 'Nossos Serviços'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColor.violet),
            )
          : _servicos.isEmpty
          ? const Center(
              child: Text(
                'Nenhum serviço encontrado.',
                style: TextStyle(fontSize: 18, color: AppColor.graphite),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _servicos.length,
              itemBuilder: (context, index) {
                final servico = _servicos[index];
                return _buildServicoCard(servico, numberFormat);
              },
            ),
    );
  }

  Widget _buildServicoCard(Servico servico, NumberFormat numberFormat) {
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
              servico.nome,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.violet,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Preço: ${numberFormat.format(servico.preco)}',
              style: const TextStyle(fontSize: 16, color: AppColor.graphite),
            ),
          ],
        ),
      ),
    );
  }
}
