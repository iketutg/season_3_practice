void main() {
  //0 ,1 ,2
  List<String> nama = [];

  print("sebelum ditambah: $nama");
  // 1. Menambah data ke list
  nama.add("Yacob");

  nama.add("Ole");
  print("Setelah ditambah: $nama");

  // // 2. Mengambil data di list dengan index
  print("Data index ke-1: ${nama[1]}");

  // // 3. Mengubah data di list
  // nama[1] = "Andi";
  // print("Setelah diubah index 1: $nama");

  // // 4. Menghapus data berdasarkan index

  nama.removeAt(0);

  print("Setelah hapus index 0: $nama");
  print("Length :  ${nama.length}");
}
