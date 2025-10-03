enum Status { pending, success, failed }

void main() {
  Object data1 = 'Hello';
  Object data2 = 123;
  Object data3 = true;

  print(data1); // Hello
  print(data2); // 123
  print(data3); // true

  //
  var orderStatus = Status.pending;

  if (orderStatus == Status.pending) {
    print("Pesanan masih diproses");
  }
}
