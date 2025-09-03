import '../models/agenda.dart';
import '../repository/agenda_repository.dart';

class AgendaController {
  final _repository = AgendaRepository();
  List<Agenda> agendaList = [];

  Future<void> readAll() async {
    await Future.delayed(const Duration(seconds: 1));
    agendaList = _repository.getAgendamentos();
  }
}
