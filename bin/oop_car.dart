class Car {
  String color;
  int price;
  int km;
  String model;

  Car({
    required this.color,
    required this.price,
    required this.km,
    required this.model,
  });

  void start() => print('$model started');
  void forward() => print('$model moving forward');
  void backward() => print('$model moving backward');
  void stop() => print('$model stopped');

  @override
  String toString() => 'Car(color:$color, price:$price, km:$km, model:$model)';
}

void main() {
  // Membuat OBJECT dari CLASS Car (instance)
  final myCar = Car(color: 'red', price: 23000, km: 1200, model: 'Audi');

  print(myCar); // Car(color:red, price:23000, km:1200, model:Audi)
  myCar.start(); // Audi started
  myCar.forward(); // Audi moving forward
  myCar.stop(); // Audi stopped
}
