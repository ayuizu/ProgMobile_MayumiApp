// agenda.dart

class Agenda {
  final int id;
  final int clienteId;
  final int profissionalId;
  final int servicoId;
  final DateTime data;
  final String horario;
  final String? clienteNome;
  final String? profissionalNome;
  final String? servicoNome;

  Agenda({
    required this.id,
    required this.clienteId,
    required this.profissionalId,
    required this.servicoId,
    required this.data,
    required this.horario,
    this.clienteNome,
    this.profissionalNome,
    this.servicoNome,
  });
}
