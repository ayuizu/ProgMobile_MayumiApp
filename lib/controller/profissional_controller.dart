import '../models/profissional.dart';
import '../repository/profissional_repository.dart';

class ProfissionalController {
  final _repository = ProfissionalRepository();
  List<Profissional> profissionalList = [];

  Future<void> readAll() async {
    profissionalList = _repository.getProfissionais();
  }
}
