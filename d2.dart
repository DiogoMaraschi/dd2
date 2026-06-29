import 'dart:math';

void main() {
  final pessoa = Pessoa();

  final fornecedores = [
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorUltraCalorico(),
  ];

  final random = Random();

  while (pessoa.precisaComer()) {
    final fornecedor = fornecedores[random.nextInt(fornecedores.length)];

    pessoa.refeicao(fornecedor);
  }

  pessoa.informacoes();
}

class Produto {
  Produto(this.nome, this.calorias);

  final String nome;
  final int calorias;
}

//Garantir implementação de fornecedores
abstract class Fornecedor {
  final random = Random();

  List<Produto> get produtos;

  Produto fornecer() {
    return produtos[random.nextInt(produtos.length)];
  }
}

//Criar novos fornecedores

class FornecedorDeBebidas extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Água', 0),
    Produto('Refrigerante', 200),
    Produto('Suco', 100),
    Produto('Café', 60),
  ];
}

class FornecedorDeSanduiches extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('X-Salada', 350),
    Produto('X-Bacon', 700),
  ];
}

class FornecedorDeBolos extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Bolo de chocolate', 300),
    Produto('Bolo de cenoura', 500),
  ];
}

class FornecedorDeSaladas extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Salada verde', 150),
    Produto('Salada Caesar', 250),
  ];
}

class FornecedorDePetiscos extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Batata frita', 200),
    Produto('Salgadinho', 150),
  ];
}

class FornecedorUltraCalorico extends Fornecedor {
  @override
  List<Produto> get produtos => [
    Produto('Combo gigante', 1200),
    Produto('Mega sobremesa', 1800),
  ];
}

//enum para status

enum StatusCalorias {
  deficitExtremo,
  deficit,
  satisfeito,
  excesso;

  String get descricao {
    switch (this) {
      case StatusCalorias.deficitExtremo:
        return 'Déficit extremo de calorias';

      case StatusCalorias.deficit:
        return 'Déficit de calorias';

      case StatusCalorias.satisfeito:
        return 'Pessoa está satisfeita';

      case StatusCalorias.excesso:
        return 'Excesso de calorias';
    }
  }
}

class Pessoa {
  //Calorias iniciais aleatórias
  int _caloriasConsumidas = Random().nextInt(2000);

  int _refeicoes = 0;

  // Definir necessidade de refeições
  bool precisaComer() {
    return _caloriasConsumidas < 2500;
  }

  StatusCalorias get status {
    if (_caloriasConsumidas <= 500) {
      return StatusCalorias.deficitExtremo;
    }

    if (_caloriasConsumidas <= 1800) {
      return StatusCalorias.deficit;
    }

    if (_caloriasConsumidas <= 2500) {
      return StatusCalorias.satisfeito;
    }

    return StatusCalorias.excesso;
  }

  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();

    print(
      'Consumindo ${produto.nome} '
      '(${produto.calorias} calorias)',
    );

    _caloriasConsumidas += produto.calorias;

    _refeicoes++;
  }

  // OBJETIVO: imprimir refeições realizadas
  void informacoes() {
    print('\n--- INFORMAÇÕES ---');

    print(
      'Calorias consumidas: '
      '$_caloriasConsumidas',
    );

    print(
      'Refeições realizadas: '
      '$_refeicoes',
    );

    print('Status: ${status.descricao}');
  }
}
