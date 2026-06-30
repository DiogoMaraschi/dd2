import 'dart:math';

void main() {
  final gerenciador = Gerenciador();

  final shampoo = Produto('Shampoo', 1);
  final cremeDeLeite = Produto('Creme de Leite', 4);
  final arroz = Produto('Arroz', 2);

  gerenciador.adicionarDesejado(shampoo);
  gerenciador.adicionarDesejado(cremeDeLeite);
  gerenciador.adicionarDesejado(arroz);

  gerenciador.exibirDesejados();

  gerenciador.marcarComoComprado(shampoo);
  gerenciador.marcarComoComprado(arroz);

  gerenciador.marcarSemEstoque(cremeDeLeite);

  gerenciador.exibirProgresso();

  final aleatorio = gerenciador.escolherAleatorio();
  print('Aleatorio pendente: $aleatorio');
}

class Gerenciador {
  final List<Produto> _desejados = [];
  final List<Produto> _comprados = [];
  final List<Produto> _semEstoque = [];

  final Random _random = Random();

  //incluir itens desejados
  void adicionarDesejado(Produto produto) {
    _desejados.add(produto);
  }

  //marcar como comprado (move entre listas)
  void marcarComoComprado(Produto produto) {
    _desejados.remove(produto);
    _semEstoque.remove(produto);
    _comprados.add(produto);
  }

  //marcar como sem estoque (move entre listas)
  void marcarSemEstoque(Produto produto) {
    _desejados.remove(produto);
    _comprados.remove(produto);
    _semEstoque.add(produto);
  }

  //exibir itens desejados
  void exibirDesejados() {
    print('Itens desejados:');
    for (final p in _desejados) {
      print(p);
    }
  }

  //escolher item pendente aleatorio
  Produto escolherAleatorio() {
    return _desejados[_random.nextInt(_desejados.length)];
  }

  //mostrar progresso
  void exibirProgresso() {
    final total = _desejados.length + _comprados.length + _semEstoque.length;
    print('Progresso: ${_comprados.length}/$total');
  }
}

class Produto {
  Produto(this.nome, this.quantidade);

  final String nome;
  final int quantidade;

  @override
  String toString() {
    return '$nome - $quantidade';
  }
}
