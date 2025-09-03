import '../models/servico.dart';
import '../models/profissional.dart';

class ProfissionalRepository {
  List<Profissional> getProfissionais() {
    return [
      Profissional(
        id: 1,
        nome: 'Mayumi',
        telefone: '51999999999',
        email: 'mayumi@mail.com',
        senha: '123456',
        categoria: 'Massoterapeuta',
        servicos: [
          Servico(id: 101, nome: 'Massagem Relaxante', preco: 80.0),
          Servico(id: 102, nome: 'Massagem Desportiva', preco: 120.0),
          Servico(id: 104, nome: 'Drenagem Linfática', preco: 150.0),
        ],
      ),
      Profissional(
        id: 2,
        nome: 'Daniela',
        telefone: '51888888888',
        email: 'dani@mail.com',
        senha: '123456',
        categoria: 'Massoterapeuta',
        servicos: [
          Servico(id: 103, nome: 'Reflexologia', preco: 70.0),
          Servico(id: 101, nome: 'Massagem Relaxante', preco: 90.0),
        ],
      ),
      Profissional(
        id: 3,
        nome: 'Ana',
        telefone: '51777777777',
        email: 'ana@mail.com',
        senha: '123456',
        categoria: 'Acupunturista',
        servicos: [
          Servico(id: 105, nome: 'Acupuntura', preco: 180.0),
          Servico(id: 106, nome: 'Moxaterapia', preco: 100.0),
        ],
      ),
    ];
  }
}
