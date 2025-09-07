import 'package:collection/collection.dart';
import '../models/profissional.dart';
import '../repository/profissional_repository.dart';

class ProfissionalController {
  final _repository = ProfissionalRepository();
  List<Profissional> profissionalList = [];

  Future<void> readAll() async {
    profissionalList = _repository.getProfissionais();
  }

  String getNomeById(int id) {
    final profissional = _repository.getProfissionais().firstWhereOrNull(
      (p) => p.id == id,
    );
    return profissional?.nome ?? 'Profissional não encontrado';
  }
}
