// Abstract class
abstract class Hewan {
  void suara();
}

// Inheritance
class Anjing extends Hewan {
  @override
  void suara() => print('Guk guk!');
}

// Interface
class Berlari {
  void lari() => print('Berlari...');
}

class Kucing extends Hewan implements Berlari {
  @override
  void suara() => print('Meong');

  @override
  void lari() => print('Kucing berlari cepat');
}

void main() {
  var anjing = Anjing();
  anjing.suara();

  var kucing = Kucing();
  kucing.suara(); // Meong
  kucing.lari(); // Kucing berlari cepat
}
