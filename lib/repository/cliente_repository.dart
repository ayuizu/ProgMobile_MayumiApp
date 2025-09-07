import 'package:collection/collection.dart';
import '../models/cliente.dart';

class ClienteRepository {
  List<Cliente> getClientes() {
    return [
      Cliente(
        id: 1,
        nome: 'João Silva',
        telefone: '51999999999',
        email: 'joao_silva@mail.com',
        senha: '123456',
      ),
      Cliente(
        id: 2,
        nome: 'Maria Santos',
        telefone: '51888888888',
        email: 'maria_santos@mail.com',
        senha: '123456',
      ),
      Cliente(
        id: 3,
        nome: 'Carlos Oliveira',
        telefone: '519999998888',
        email: 'carlos_oliveira@mail.com',
        senha: '123456',
      ),
      Cliente(
        id: 4,
        nome: 'Pedro Costa',
        telefone: '51999997777',
        email: 'pedro_costa@mail.com',
        senha: '123456',
      ),
      Cliente(
        id: 5,
        nome: 'Julia Lima',
        telefone: '518888877777',
        email: 'julia_lima@mail.com',
        senha: '123456',
      ),
      Cliente(
        id: 6,
        nome: 'Mariana Almeida',
        telefone: '51888886666',
        email: 'mariana_almeida@mail.com',
        senha: '123456',
      ),
      Cliente(
        id: 7,
        nome: 'Gustavo Pereira',
        telefone: '519888877777',
        email: 'gustavo_pereira@mail.com',
        senha: '123456',
      ),
      Cliente(
        id: 8,
        nome: 'Leticia Ramos',
        telefone: '51998877777',
        email: 'leticia_ramos@mail.com',
        senha: '123456',
      ),
    ];
  }

  Cliente? getClienteById(int id) {
    return getClientes().firstWhereOrNull((cliente) => cliente.id == id);
  }
}
