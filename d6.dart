import 'dart:collection';

class Carta {
  final String valor;
  final String naipe;

  Carta(this.valor, this.naipe);

  @override
  String toString() {
    return "$valor ($naipe)";
  }
}

class Baralho {
  final Queue<Carta> cartas = Queue<Carta>();

  void empilhar(Carta carta) {
    cartas.addLast(carta); //topo do baralho
  }

  Carta remover() {
    return cartas.removeLast(); //sempre remove o topo
  }
}

void main() {
  final baralho = Baralho();

  final String paus = "\u2663";
  final String copas = "\u2665";
  final String espadas = "\u2660";
  final String ouros = "\u2666";

  //Empilhar cartas na ordem solicitada
  baralho.empilhar(Carta("A", paus));
  baralho.empilhar(Carta("A", copas));
  baralho.empilhar(Carta("A", espadas));
  baralho.empilhar(Carta("A", ouros));

  //Remover todas as cartas sempre do topo
  while (!baralho.cartas.isEmpty) {
    print(baralho.remover());
  }
}
