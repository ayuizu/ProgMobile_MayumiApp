import 'package:collection/collection.dart';
import '../models/servico.dart';
import '../repository/servico_repository.dart';

class ServicoController {
  final _repository = ServicoRepository();
  List<Servico> servicoList = [];

  Future<void> readAll() async {
    servicoList = _repository.getServicos();
  }

  String getNomeById(int id) {
    final servico = _repository.getServicos().firstWhereOrNull(
      (p) => p.id == id,
    );
    return servico?.nome ?? 'Servicço não encontrado';
  }
}
