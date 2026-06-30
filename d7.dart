import 'dart:math';
import 'dart:collection';

void main() {
  final Queue<Pessoa> fila = Queue<Pessoa>();

  populaFila(fila);

  print('---------------');

  esvaziaFila(fila);
}

void populaFila(Queue<Pessoa> fila) {
  GeradorNomes gerador = GeradorNomes();
  while (fila.length < 10) {
    final pessoa = gerador.gerarNomeAleatorio();
    fila.addLast(pessoa);
    print('$pessoa entrou na fila');
  }
}

void esvaziaFila(Queue<Pessoa> fila) {
  while (fila.isNotEmpty) {
    final pessoa = fila.removeFirst();
    print('$pessoa foi atendido(a)');
  }
  print('Fila Vazia!');
}

class GeradorNomes {
  final List<String> nomes = [
    'Ana',
    'Carlos',
    'João',
    'Mariana',
    'Pedro',
    'Rafaela',
    'Lucas',
    'Patrícia',
    'Gabriel',
    'Helena',
  ];

  final List<String> sobrenomes = [
    'Silva',
    'Ferreira',
    'Almeida',
    'Azevedo',
    'Braga',
    'Barros',
    'Campos',
    'Cardoso',
    'Teixeira',
    'Santos',
  ];

  final random = Random();

  Pessoa gerarNomeAleatorio() {
    final nome = nomes[random.nextInt(nomes.length)];
    final sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];
    return Pessoa(nome, sobrenome);
  }
}

class Pessoa {
  Pessoa(this.nome, this.sobrenome);

  String nome;
  String sobrenome;

  @override
  String toString() {
    return '$nome $sobrenome';
  }
}
