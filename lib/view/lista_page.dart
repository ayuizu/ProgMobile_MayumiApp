import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mayumi_app/controller/profissional_controller.dart';
import 'package:mayumi_app/controller/servico_controller.dart';
import 'package:mayumi_app/controller/cliente_controller.dart';

import '../components/colors.dart';
import '../components/custom_appbar.dart';
import '../components/side_menu.dart';
import '../models/agenda.dart';
import '../controller/agenda_controller.dart';

// TODO: Filtrar agendamentos para mostrar somente os do cliente logado

class FuturosAgendamentosView extends StatefulWidget {
  const FuturosAgendamentosView({super.key});

  @override
  State<FuturosAgendamentosView> createState() =>
      _FuturosAgendamentosViewState();
}

class _FuturosAgendamentosViewState extends State<FuturosAgendamentosView> {
  final _agendaController = AgendaController();
  final _profissionalController = ProfissionalController();
  final _servicoController = ServicoController();
  final _clienteController = ClienteController();

  List<Agenda> _agendamentosFuturos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAgendamentos();
  }

  void _loadAgendamentos() async {
    await Future.wait([
      _agendaController.readAll(),
      _profissionalController.readAll(),
      _servicoController.readAll(),
      _clienteController.readAll(),
    ]);

    final now = DateTime.now();
    setState(() {
      _agendamentosFuturos = _agendaController.agendaList.where((agenda) {
        // Compara data, ignorando o horário
        return agenda.data.isAfter(DateTime(now.year, now.month, now.day - 1));
      }).toList();

      _agendamentosFuturos.sort((a, b) {
        // Ordena por data
        final dateComparison = a.data.compareTo(b.data);
        if (dateComparison != 0) {
          return dateComparison;
        }
        // TODO: Corrigir lógica de ordenamento por horário se data for igual. Não está funcionando corretamente
        final aTime = DateFormat('HH:mm').parse(a.horario);
        final bTime = DateFormat('HH:mm').parse(b.horario);
        return aTime.compareTo(bTime);
      });
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
        child: CustomAppBar(texto: 'Meus Agendamentos'),
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
      color: AppColor.lilac,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Serviço: ${_servicoController.getNomeById(agenda.servicoId)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.violet,
              ),
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              Icons.person_pin,
              'Cliente: ${_clienteController.getNomeById(agenda.clienteId)}',
            ),
            _buildDetailRow(
              Icons.person,
              'Profissional: ${_profissionalController.getNomeById(agenda.profissionalId)}',
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
