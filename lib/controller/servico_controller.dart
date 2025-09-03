import '../models/servico.dart';
import '../repository/servico_repository.dart';

class ServicoController {
  final _repository = ServicoRepository();
  List<Servico> servicoList = [];

  Future<void> readAll() async {
    servicoList = _repository.getServicos();
  }
}
