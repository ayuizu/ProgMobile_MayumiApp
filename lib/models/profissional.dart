import './servico.dart';

class Profissional {
  final int id;
  final String nome;
  final String telefone;
  final String email;
  final String senha;
  final String categoria;
  final List<Servico> servicos;

  Profissional({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.senha,
    required this.categoria,
    required this.servicos,
  });
}
