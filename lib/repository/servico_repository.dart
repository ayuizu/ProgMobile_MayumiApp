import 'package:collection/collection.dart';
import '../models/servico.dart';

class ServicoRepository {
  List<Servico> getServicos() {
    return [
      Servico(id: 101, nome: 'Massagem Relaxante', preco: 80.0),
      Servico(id: 102, nome: 'Massagem Desportiva', preco: 120.0),
      Servico(id: 103, nome: 'Reflexologia', preco: 70.0),
      Servico(id: 104, nome: 'Drenagem Linfática', preco: 150.0),
      Servico(id: 105, nome: 'Acupuntura', preco: 180.0),
      Servico(id: 106, nome: 'Moxaterapia', preco: 100.0),
    ];
  }

  Servico? getServicoById(int id) {
    return getServicos().firstWhereOrNull((servico) => servico.id == id);
  }
}
