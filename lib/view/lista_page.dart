import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/colors.dart';
import '../components/custom_appbar.dart';
import '../components/side_menu.dart';
import '../models/agenda.dart';
import '../controller/agenda_controller.dart';

class FuturosAgendamentosView extends StatefulWidget {
  const FuturosAgendamentosView({super.key});

  @override
  State<FuturosAgendamentosView> createState() =>
      _FuturosAgendamentosViewState();
}

class _FuturosAgendamentosViewState extends State<FuturosAgendamentosView> {
  final _agendaController = AgendaController();
  List<Agenda> _agendamentosFuturos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAgendamentos();
  }

  void _loadAgendamentos() async {
    await _agendaController.readAll();

    final now = DateTime.now();
    setState(() {
      _agendamentosFuturos = _agendaController.agendaList.where((agenda) {
        // Compara apenas a data, ignorando o horário
        return agenda.data.isAfter(DateTime(now.year, now.month, now.day - 1));
      }).toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(
        selected: [false, false, true, false, false, false],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppBar(texto: 'Seus Agendamentos'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColor.violet),
            )
          : _agendamentosFuturos.isEmpty
          ? const Center(
              child: Text(
                'Você não tem agendamentos futuros.',
                style: TextStyle(fontSize: 18, color: AppColor.graphite),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _agendamentosFuturos.length,
              itemBuilder: (context, index) {
                final agenda = _agendamentosFuturos[index];
                return _buildAppointmentCard(agenda);
              },
            ),
    );
  }

  Widget _buildAppointmentCard(Agenda agenda) {
    final dateFormat = DateFormat('dd/MM/yyyy');
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
              'Serviço: ${agenda.servicoNome}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.violet,
              ),
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              Icons.person,
              'Profissional: ${agenda.profissionalNome}',
            ),
            _buildDetailRow(
              Icons.calendar_today,
              'Data: ${dateFormat.format(agenda.data)}',
            ),
            _buildDetailRow(Icons.access_time, 'Horário: ${agenda.horario}'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // TODO: Implementar lógica de edição
                    debugPrint('Editar agendamento ${agenda.id}');
                  },
                  icon: const Icon(Icons.edit, color: AppColor.violet),
                  label: const Text('Editar'),
                ),
                TextButton.icon(
                  onPressed: () {
                    // TODO: Implementar lógica de exclusão
                    debugPrint('Excluir agendamento ${agenda.id}');
                  },
                  icon: const Icon(Icons.delete, color: AppColor.violet),
                  label: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColor.graphite),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: AppColor.graphite),
            ),
          ),
        ],
      ),
    );
  }
}
