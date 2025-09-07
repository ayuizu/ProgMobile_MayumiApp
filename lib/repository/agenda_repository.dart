// agenda_repository.dart

import 'package:collection/collection.dart';
import '../models/agenda.dart';

class AgendaRepository {
  List<Agenda> getAgendamentos() {
    return [
      Agenda(
        id: 1,
        clienteId: 1,
        profissionalId: 1,
        servicoId: 101,
        data: DateTime.now().add(const Duration(days: 3)),
        horario: '10:00',
      ),
      Agenda(
        id: 2,
        clienteId: 2,
        profissionalId: 2,
        servicoId: 103,
        data: DateTime.now().add(const Duration(days: 10)),
        horario: '15:00',
      ),
      Agenda(
        id: 3,
        clienteId: 3,
        profissionalId: 3,
        servicoId: 105,
        data: DateTime.now().subtract(const Duration(days: 5)),
        horario: '09:00',
      ),
      Agenda(
        id: 4,
        clienteId: 1,
        profissionalId: 1,
        servicoId: 102,
        data: DateTime.now().add(const Duration(days: 10)),
        horario: '10:00',
      ),
      Agenda(
        id: 5,
        clienteId: 2,
        profissionalId: 2,
        servicoId: 103,
        data: DateTime.now().add(const Duration(days: 14)),
        horario: '15:00',
      ),
      Agenda(
        id: 6,
        clienteId: 3,
        profissionalId: 3,
        servicoId: 106,
        data: DateTime.now().subtract(const Duration(days: 12)),
        horario: '09:00',
      ),
      Agenda(
        id: 7,
        clienteId: 4,
        profissionalId: 1,
        servicoId: 102,
        data: DateTime.now().add(const Duration(days: 5)),
        horario: '11:00',
      ),
      Agenda(
        id: 8,
        clienteId: 5,
        profissionalId: 2,
        servicoId: 101,
        data: DateTime.now().add(const Duration(days: 11)),
        horario: '14:00',
      ),
      Agenda(
        id: 9,
        clienteId: 6,
        profissionalId: 1,
        servicoId: 101,
        data: DateTime.now().add(const Duration(days: 7)),
        horario: '16:00',
      ),
      Agenda(
        id: 10,
        clienteId: 7,
        profissionalId: 2,
        servicoId: 103,
        data: DateTime.now().add(const Duration(days: 16)),
        horario: '08:00',
      ),
      Agenda(
        id: 11,
        clienteId: 8,
        profissionalId: 1,
        servicoId: 102,
        data: DateTime.now().add(const Duration(days: 9)),
        horario: '13:00',
      ),
      Agenda(
        id: 12,
        clienteId: 5,
        profissionalId: 1,
        servicoId: 104,
        data: DateTime.now().add(const Duration(days: 3)),
        horario: '14:00',
      ),
      Agenda(
        id: 13,
        clienteId: 6,
        profissionalId: 2,
        servicoId: 101,
        data: DateTime.now().add(const Duration(days: 5)),
        horario: '10:00',
      ),
      Agenda(
        id: 14,
        clienteId: 7,
        profissionalId: 3,
        servicoId: 105,
        data: DateTime.now().add(const Duration(days: 7)),
        horario: '11:30',
      ),
      Agenda(
        id: 15,
        clienteId: 8,
        profissionalId: 1,
        servicoId: 101,
        data: DateTime.now().add(const Duration(days: 18)),
        horario: '17:00',
      ),
      Agenda(
        id: 16,
        clienteId: 1,
        profissionalId: 2,
        servicoId: 103,
        data: DateTime.now().add(const Duration(days: 2)),
        horario: '09:00',
      ),
      Agenda(
        id: 17,
        clienteId: 2,
        profissionalId: 3,
        servicoId: 106,
        data: DateTime.now().subtract(const Duration(days: 1)),
        horario: '14:00',
      ),
      Agenda(
        id: 18,
        clienteId: 3,
        profissionalId: 1,
        servicoId: 102,
        data: DateTime.now().add(const Duration(days: 4)),
        horario: '08:00',
      ),
      Agenda(
        id: 19,
        clienteId: 4,
        profissionalId: 2,
        servicoId: 101,
        data: DateTime.now().add(const Duration(days: 6)),
        horario: '16:00',
      ),
      Agenda(
        id: 20,
        clienteId: 5,
        profissionalId: 1,
        servicoId: 104,
        data: DateTime.now().add(const Duration(days: 9)),
        horario: '09:00',
      ),
    ];
  }

  Agenda? getAgendamentoById(int id) {
    return getAgendamentos().firstWhereOrNull(
      (agendamento) => agendamento.id == id,
    );
  }
}
