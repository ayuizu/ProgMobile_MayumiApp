import 'package:collection/collection.dart';
import '../models/cliente.dart';
import '../repository/cliente_repository.dart';

class ClienteController {
  final _repository = ClienteRepository();
  List<Cliente> clienteList = [];

  Future<void> readAll() async {
    clienteList = _repository.getClientes();
  }

  String getNomeById(int id) {
    final cliente = _repository.getClientes().firstWhereOrNull(
      (p) => p.id == id,
    );
    return cliente?.nome ?? 'Cliente não encontrado';
  }
}
