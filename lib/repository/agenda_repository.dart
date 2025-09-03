import '../models/agenda.dart';

class AgendaRepository {
  List<Agenda> getAgendamentos() {
    return [
      Agenda(
        id: 1,
        clienteNome: 'João Silva',
        profissionalNome: 'Mayumi',
        servicoNome: 'Massagem Relaxante',
        data: DateTime.now().add(const Duration(days: 3)),
        horario: '10:00',
      ),
      Agenda(
        id: 2,
        clienteNome: 'Maria Santos',
        profissionalNome: 'Daniela',
        servicoNome: 'Reflexologia',
        data: DateTime.now().add(const Duration(days: 10)),
        horario: '15:30',
      ),
      // Agendamento passado para demonstração
      Agenda(
        id: 3,
        clienteNome: 'Carlos Oliveira',
        profissionalNome: 'Ana',
        servicoNome: 'Acupuntura',
        data: DateTime.now().subtract(const Duration(days: 5)),
        horario: '09:00',
      ),
      Agenda(
        id: 4,
        clienteNome: 'João Silva',
        profissionalNome: 'Mayumi',
        servicoNome: 'Massagem Desportiva',
        data: DateTime.now().add(const Duration(days: 10)),
        horario: '10:00',
      ),
      Agenda(
        id: 5,
        clienteNome: 'Maria Santos',
        profissionalNome: 'Daniela',
        servicoNome: 'Reflexologia',
        data: DateTime.now().add(const Duration(days: 14)),
        horario: '15:30',
      ),
      // Agendamento passado para demonstração
      Agenda(
        id: 6,
        clienteNome: 'Carlos Oliveira',
        profissionalNome: 'Ana',
        servicoNome: 'Moxaterapia',
        data: DateTime.now().subtract(const Duration(days: 12)),
        horario: '09:00',
      ),
      Agenda(
        id: 7,
        clienteNome: 'Pedro Costa',
        profissionalNome: 'Mayumi',
        servicoNome: 'Massagem Desportiva',
        data: DateTime.now().add(const Duration(days: 5)),
        horario: '11:30',
      ),
      Agenda(
        id: 8,
        clienteNome: 'Julia Lima',
        profissionalNome: 'Daniela',
        servicoNome: 'Massagem Relaxante',
        data: DateTime.now().add(const Duration(days: 11)),
        horario: '14:00',
      ),
      Agenda(
        id: 9,
        clienteNome: 'Mariana Almeida',
        profissionalNome: 'Mayumi',
        servicoNome: 'Massagem Relaxante',
        data: DateTime.now().add(const Duration(days: 7)),
        horario: '16:00',
      ),
      Agenda(
        id: 10,
        clienteNome: 'Gustavo Pereira',
        profissionalNome: 'Daniela',
        servicoNome: 'Reflexologia',
        data: DateTime.now().add(const Duration(days: 16)),
        horario: '08:00',
      ),
      Agenda(
        id: 11,
        clienteNome: 'Leticia Ramos',
        profissionalNome: 'Mayumi',
        servicoNome: 'Massagem Desportiva',
        data: DateTime.now().add(const Duration(days: 9)),
        horario: '13:00',
      ),
    ];
  }
}
