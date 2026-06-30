import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  final formas = <FormaGeometrica>[
    Circulo('Circulo A', 3),
    Circulo('Circulo B', 8),
    Retangulo('Retangulo A', 4, 3),
    Retangulo('Retangulo B', 19, 11),
    Quadrado('Quadrado', 5),
    TrianguloEquilatero('Triangulo Equilatero', 6),
    TrianguloRetangulo('Triangulo Retangulo', 3, 4),
    PentagonoRegular('Pentagono', 5),
    HexagonoRegular('Hexagono', 4),
  ];

  FormaGeometrica maiorArea = formas.first;
  FormaGeometrica maiorPerimetro = formas.first;

  for (final forma in formas) {
    maiorArea = comparador.maiorArea(maiorArea, forma);
    maiorPerimetro = comparador.maiorPerimetro(maiorPerimetro, forma);
  }

  print('Maior area: ${maiorArea.nome} = ${maiorArea.area}');
  print(
    'Maior perimetro: ${maiorPerimetro.nome} = ${maiorPerimetro.perimetro}',
  );
}

//base da hierarquia de formas geometricas
abstract class FormaGeometrica {
  String get nome;
  double get area;
  double get perimetro;
}

//representa a forma geometrica circulo
class Circulo extends FormaGeometrica {
  //construtor que recebe o raio do circulo
  Circulo(this.nome, this.raio);

  final String nome;
  final double raio;

  double get area => math.pi * math.pow(raio, 2);

  double get perimetro => 2 * math.pi * raio;
}

//representa a forma geometrica retangulo
class Retangulo extends FormaGeometrica {
  Retangulo(this.nome, this.altura, this.largura);

  final String nome;
  final double largura;
  final double altura;

  double get area => altura * largura;

  double get perimetro => (altura * 2) + (largura * 2);
}

//representa a forma geometrica quadrado
class Quadrado extends FormaGeometrica {
  Quadrado(this.nome, this.lado);

  final String nome;
  final double lado;

  double get area => lado * lado;

  double get perimetro => lado * 4;
}

//representa triangulo equilatero
class TrianguloEquilatero extends FormaGeometrica {
  TrianguloEquilatero(this.nome, this.lado);

  @override
  final String nome;
  final double lado;

  double get area => (math.sqrt(3) / 4) * math.pow(lado, 2);

  double get perimetro => 3 * lado;
}

//representa triangulo retangulo
class TrianguloRetangulo extends FormaGeometrica {
  TrianguloRetangulo(this.nome, this.base, this.altura);

  @override
  final String nome;
  final double base;
  final double altura;

  //calcula hipotenusa
  double get hipotenusa => math.sqrt(math.pow(base, 2) + math.pow(altura, 2));

  double get area => (base * altura) / 2;

  double get perimetro => base + altura + hipotenusa;
}

//representa pentagono regular
class PentagonoRegular extends FormaGeometrica {
  PentagonoRegular(this.nome, this.lado);

  @override
  final String nome;
  final double lado;

  double get area => (5 * math.pow(lado, 2)) / (4 * math.tan(math.pi / 5));

  double get perimetro => 5 * lado;
}

//representa hexagono regular
class HexagonoRegular extends FormaGeometrica {
  HexagonoRegular(this.nome, this.lado);

  @override
  final String nome;
  final double lado;

  double get area => (3 * math.sqrt(3) / 2) * math.pow(lado, 2);

  double get perimetro => 6 * lado;
}

//classe responsavel por comparar formas geometricas
class ComparadorFormasGeometricas {
  //retorna forma com maior area
  FormaGeometrica maiorArea(FormaGeometrica formaA, FormaGeometrica formaB) {
    return formaA.area >= formaB.area ? formaA : formaB;
  }

  //retorna forma com maior perimetro
  FormaGeometrica maiorPerimetro(
    FormaGeometrica formaA,
    FormaGeometrica formaB,
  ) {
    return formaA.perimetro >= formaB.perimetro ? formaA : formaB;
  }
}
