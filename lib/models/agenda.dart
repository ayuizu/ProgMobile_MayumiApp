class Agenda {
  final int id;
  final String clienteNome;
  final String profissionalNome;
  final String servicoNome;
  final DateTime data;
  final String horario;

  Agenda({
    required this.id,
    required this.clienteNome,
    required this.profissionalNome,
    required this.servicoNome,
    required this.data,
    required this.horario,
  });
}
