void main() {
  //tipe data map
  //Object collection every element key uniq
  Map<String, String> user = {
    'id': '001',
    'nama': 'Budi',
    'email': 'budi@mail.com'
  };

  print(user['nama']);
  user['email'] = 'budi@example.com';
  print(user);

  Map<String, int> product = {'id': 1, 'price': 90, 'qty': 1};

  print(product);
  final Map<String, dynamic> alamat = {
    'id': 1,
    'name': 'Budi',
    'address': {
      'city': 'Denpasar',
      'geo': {'lat': -8.65, 'lng': 115.22}
    }
  };
  print(alamat['address']['geo']['lat']); // -8.65
}
