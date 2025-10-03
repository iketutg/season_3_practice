class Mobil {
  String merk;
  int tahun;

  Mobil(this.merk, this.tahun);

  void info() {
    print('Mobil: $merk, Tahun: $tahun');
  }
}

void main() {
  var avanza = Mobil('Toyota', 2020);
  avanza.info(); // Mobil: Toyota, Tahun: 2020
}

class Mahasiswa {
  String nim;
  String nama;
  int nilai;
}
