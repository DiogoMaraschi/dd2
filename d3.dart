void main() {
  final biblioteca = Biblioteca();

  biblioteca.adicionar(Musica('Yellow', 'Coldplay', 'Parachutes', 269));

  biblioteca.adicionar(Musica('Lose Control', 'Teddy Swims', 'No Album', 209));

  biblioteca.adicionar(Musica('Counting Stars', 'OneRepublic', 'Native', 283));

  //Mostrar musicas
  print("Biblioteca:");
  for (final musica in biblioteca.listarMusicas()) {
    print(
      '${musica.titulo} - '
      '${musica.artista} - '
      '${musica.album}',
    );
  }

  //Mostra número de músicas
  final numeroMusicas = biblioteca.listaMusica.length;
  print("Número de músicas na biblioteca: $numeroMusicas");

  //Mostra tempo total da biblioteca
  final totalTempo = biblioteca.duracaoBiblioteca();
  print("Total de tempo das músicas: ${totalTempo.toStringAsFixed(2)}h");

  //Buscas
  final buscas = ['Yellow', 'Teddy Swims', 'Native', 'Ana Castela'];
  //Primeiro termo buscar por Musica
  //Segundo termo buscar por Artista
  //Terceiro termo buscar por Album
  //Quarto simula um item que não está na lista

  for (var pesquisa in buscas) {
    final busca = biblioteca.buscaMusica(pesquisa);

    print(
      busca != null
          ? '${busca.titulo} - ${busca.artista} - ${busca.album}'
          : 'Música não encontrada',
    );
  }
}

class Biblioteca {
  final List<Musica> listaMusica = [];

  void adicionar(Musica musica) {
    listaMusica.add(musica);
  }

  List<Musica> listarMusicas() {
    return listaMusica;
  }

  double duracaoBiblioteca() {
    double tempoTotal = 0;
    for (var musica in listaMusica) {
      tempoTotal += musica.duracao;
    }
    tempoTotal = tempoTotal / 60 / 60;
    return tempoTotal;
  }

  Musica? buscaMusica(String query) {
    for (var musica in listaMusica) {
      if (musica.album == query ||
          musica.artista == query ||
          musica.titulo == query) {
        return musica;
      }
    }
    return null;
  }
}

class Musica {
  Musica(this.titulo, this.artista, this.album, this.duracao);

  final String titulo;
  final String artista;
  final String album;
  final int duracao;
}
