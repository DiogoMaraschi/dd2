import 'dart:math';

void main() {
  final Album album = Album();

  while (!album.estaCompleto()) {
    final pacote = PacoteDeFiguras();
    for (final f in pacote.pacoteFiguras) {
      album.colaNoAlbum(f);
    }
  }

  print('--- Álbum Completo! ---');
  print(
    'Total de figuras repetidas acumuladas: ${album.figurasRepetidas.length}',
  );
  album.imprimirAlbum();
}

class Figura {
  Figura(this.codigoUnico, this.nome);

  String nome;
  int codigoUnico;

  @override
  String toString() {
    return '$codigoUnico $nome';
  }
}

class Catalogo {
  static final List<Figura> _listaFiguras = [
    Figura(1, 'Pelé'),
    Figura(2, 'Ronaldo'),
    Figura(3, 'Neymar'),
    Figura(4, 'Romário'),
    Figura(5, 'Ronaldinho'),
    Figura(6, 'Zico'),
    Figura(7, 'Kaká'),
    Figura(8, 'Rivaldo'),
    Figura(9, 'Cafu'),
    Figura(10, 'Roberto Carlos'),
    Figura(11, 'Adriano'),
    Figura(12, 'Sócrates'),
    Figura(13, 'Tostão'),
    Figura(14, 'Garrincha'),
    Figura(15, 'Djalma Santos'),
    Figura(16, 'Jairzinho'),
    Figura(17, 'Careca'),
    Figura(18, 'Bebeto'),
    Figura(19, 'Rogério Ceni'),
    Figura(20, 'Juninho Pernambucano'),
  ];

  static List<Figura> get listaFiguras => _listaFiguras;
}

class PacoteDeFiguras {
  final random = Random();

  final List<Figura> _figuras = [];

  PacoteDeFiguras() {
    while (_figuras.length < 4) {
      final figura =
          Catalogo.listaFiguras[random.nextInt(Catalogo.listaFiguras.length)];

      _figuras.add(figura);
    }
  }

  List<Figura> get pacoteFiguras => _figuras;
}

class Album {
  final List<Figura> _album = [];
  final List<Figura> figurasRepetidas = [];

  // controle rápido de existência
  final Set<int> _codigosJaColados = {};

  void colaNoAlbum(Figura novaFigura) {
    if (_codigosJaColados.contains(novaFigura.codigoUnico)) {
      figurasRepetidas.add(novaFigura);
      return;
    }

    _album.add(novaFigura);
    _codigosJaColados.add(novaFigura.codigoUnico);
  }

  void imprimirAlbum() {
    _album.sort((a, b) => a.codigoUnico.compareTo(b.codigoUnico));

    print('Minhas figurinhas coladas:');
    for (final figura in _album) {
      print(figura);
    }
  }

  bool estaCompleto() => _codigosJaColados.length == 20;
}
