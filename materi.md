# Materi Dasar Fundamental Dart Phase 2

Type Dart : 

- Number
    - Integers : bilangan bulat
    - Doubles : tedapat decimal
- String : dengan tanda kutip satu atau dua tanda kutip
- Booleans : bool  (true or false)
- Null : An empty value
- Iterable : looping
- Dynamic : Usually used for JSON parsing  (can be any value)
- Void : The value is never used  - digunakan sebagai return type
- List : List of one type
- Sets : Unique list of Items
- Maps : Key / Value pairs
- Object : Top-level class thats all classes subclass
- Enum : Enumeration of specific values
- Never  :  for functions that always throw an exception

### **Set**

- **Definisi:** Kumpulan elemen yang **unik** (tidak ada duplikat).
- **Kapan digunakan:** Kalau kita ingin menyimpan data tanpa duplikasi, misalnya daftar kategori, tag, atau ID unik.
- **Contoh:**
    
    ```dart
    void main() {
      var angka = {1, 2, 3, 3}; // otomatis {1, 2, 3}
      print(angka);
    
      angka.add(4);
      angka.add(2); // tidak ditambahkan karena sudah ada
      print(angka); // {1, 2, 3, 4}
    }
    
    ```
    

---

### 

### **Map**

- **Definisi:** Struktur data berupa **pasangan key-value**.
- **Kapan digunakan:** Kalau butuh akses cepat berdasarkan **key**, misalnya data user (`id → nama`), konfigurasi aplikasi, atau response JSON.
- **Contoh:**
    
    ```dart
    void main() {
      Map<String, String> user = {
        'id': '001',
        'nama': 'Budi',
        'email': 
      };
          print(user['nama']); // Budi
      user['email'] = 'budi@example.com'; // update value
      print(user);
    }
    
    ```
    

---

- **Contoh:**
    
    ```dart
    void main() { 
      List <String> products = ["Pencil", "Bulpoint", "Penghapus]
      
        Map<String, String> productsElectric = {
        'id': '001',
        'name': 'Handphone',
        'price': 2000000,
      };
    
      print(productsElectric['name']); //
      productsElectric['price'] = 3000000; // update value
      print(productsElectric);
    ```
    
     
    

### 4. **Object**

- **Definisi:** **Superclass dari semua tipe** di Dart. Artinya semua tipe adalah turunan dari `Object`.
- **Kapan digunakan:** Kalau ingin membuat variabel yang bisa menampung **tipe apa saja** (mirip `Any` di bahasa lain).
- **Contoh:**
    
    ```dart
    void main() {
      Object data1 = 'Hello';
      Object data2 = 123;
      Object data3 = true;
    
      print(data1); // Hello
      print(data2); // 123
      print(data3); // true
    }
    
    ```
    

---

### 5. **Enum**

- **Definisi:** Tipe khusus untuk mendefinisikan **kumpulan nilai konstan** (enumerasi).
- **Kapan digunakan:** Cocok untuk status yang terbatas, misalnya status order (`pending`, `success`, `failed`), role user, atau hari dalam seminggu.
- **Contoh:**
    
    ```dart
    enum Status { pending, success, failed }
    
    void main() {
      var orderStatus = Status.pending;
    
      if (orderStatus == Status.pending) {
        print("Pesanan masih diproses");
      }
    }
    
    ```
    

---

### **Never**

- **Definisi:** Tipe return function yang **tidak pernah selesai normal**. Biasanya digunakan untuk function yang selalu **throw exception** atau **infinite loop**.
- **Kapan digunakan:** Untuk menandakan function pasti gagal atau tidak pernah mengembalikan nilai.
- **Contoh:**
    
    ```dart
    Never error(String pesan) {
      throw Exception(pesan);
    }
    
    void main() {
      error("Terjadi kesalahan!"); // selalu throw
    }
    
    ```
    

---

### 1. Function yang selalu melempar error

```dart
Never gagal(String pesan) {
  throw Exception(pesan);
}

void main() {
  print("Sebelum error");
  gagal("Data tidak valid!");
  print("Sesudah error"); // ← ini tidak akan pernah dijalankan
}

```

### 2. Infinite loop

```dart
Never loopTakBerhenti() {
  while (true) {
    print("Jalan terus...");
  }
}

void main() {
  loopTakBerhenti();
  print("Tidak akan pernah sampai sini"); // unreachable
}

```

---

### 3. Dalam flow `switch` (sering dipakai di Flutter)

```dart
enum Status { loading, success, failed }

String handleStatus(Status s) {
  switch (s) {
    case Status.loading:
      return "Sedang memuat...";
    case Status.success:
      return "Berhasil!";
    case Status.failed:
      return "Gagal!";
  }

  // Jika ada status baru yang belum di-handle,
  // langsung throw (Never)
  throw Exception("Status tidak dikenal: $s");
}

```

## Expression

Salah satu fitur yang sangat berguna dari Dart adalah interpolasi string. Anda dapat memasukkan nilai dari suatu ekspresi ke dalam string dengan menggunakan ${ekspresi}.

```dart
*void main() {* 
    *double price = 100.75;*
    *print('Price is: \$${price}');*
*}*
```

---

# Yang di pelajari

- **Class & Object** → dasar OOP.
- **Constructor, Method, Property** → membangun object dengan fungsi & variabel.
- **Inheritance, Interface, Abstract class** → pewarisan & kontrak desain.
- **Collection** → struktur data (List, Set, Map).
- **Async/Await & Future** → pemrograman asynchronous di Dart.

## **OOP**

![Screenshot 2025-10-01 at 09.48.39.png](attachment:5bd15c5d-dfdc-4d6f-808e-c333167fee74:Screenshot_2025-10-01_at_09.48.39.png)

- **Class = House (blueprint)**
    
    Seperti gambar rumah arsitek: mendefinisikan properti (pintu, jendela, warna) dan method (openDoor(), turnOnLight()).
    
- **Object = myHouse (instance)**
    
    Rumah nyata yang dibangun dari blueprint. Bisa punya nilai berbeda (warna biru, 3 pintu, 4 jendela). 
    
    **Empat Pilar :** 
    
- **Encapsulation (pembungkusan)** 
menyembunyikan detail internal dengan *public API* yang rapi (getter/setter/metode). Tujuannya menjaga invariants & memudahkan perubahan internal tanpa “merusak” pemakai class.
    
    Data sensitif (mis. `alarmCode`) disembunyikan (private) dan diakses via getter/setter agar aman dan terkontrol. 
    
- **Inheritance (pewarisan)**
    
    Mewarisi perilaku/atribut dari superclass. *Catatan*: di aplikasi modern lebih sering **composition over inheritance** (komposisi > pewarisan) agar fleksibel dan mudah diuji.
    
    `SmartHouse` mewarisi `House` lalu menambah fitur (`wifiControl`). Semua kemampuan `House` tetap ada.
    
- **Abstraction (abstraksi)**
    
    Menonjolkan hal penting, menyederhanakan akses melalui *interface/abstract class* (kontrak). Implementasi bisa diganti tanpa mengubah pemakai.
    
    Mis. antarmuka `Lockable` yang hanya menetapkan kontrak `lock()`/`unlock()` tanpa detail implementasi. 
    
- **Polymorphism (polimorfisme) 
S**atu kontrak, banyak implementasi. Anda memanggil `pay()` tanpa peduli itu QRIS, kartu, atau e-wallet—yang penting semua “bicara” interface yang sama.
    
    Method yang sama berperilaku berbeda. Contoh `ringBell()` di `SmartHouse` menyalakan kamera, sedangkan di `House` biasa hanya bunyi bel.
    

**Prinsip SOLID ( relevansi Flutter):**

- **S**ingle Responsibility: tiap class punya satu alasan berubah → `AuthRepository` khusus autentikasi, `UserService` khusus bisnis user, Widget UI fokus presentasi.
- **O**pen/Closed: mudah ditambah fitur tanpa ubah kode lama → tambah `QrisPayment` implement interface tanpa utak-atik pemakai.
- **L**iskov Substitution: subclass harus bisa menggantikan base tanpa “kagetin” pemakai → jangan ubah kontrak perilaku.
- **I**nterface Segregation: buat interface kecil & fokus → `HasLogger`, `Cacheable`.
- **D**ependency Inversion: bergantung pada abstraksi, bukan implementasi → injeksi `AuthRepository` (interface) alih-alih `FirebaseAuth` langsung.

## OOP Konteks Kampus

### 1. **Class (Blueprint)**

- `Person` → kelas umum (superclass).
    - **Atribut:** nama, umur, alamat
    - **Method:** makan(), tidur()

### 2. **Inheritance (Pewarisan)**

- `Mahasiswa` dan `Dosen` adalah turunan (`extends`) dari `Person`.
    - `Mahasiswa` punya tambahan atribut: NIM, jurusan, IPK, metode: kuliah(), mengerjakanTugas().
    - `Dosen` punya tambahan atribut: NIP, mataKuliah, metode: mengajar(), memberiNilai().

### 3. **Encapsulation (Pembungkusan)**

- Data sensitif seperti `NIM` atau `NIP` disimpan private, hanya bisa diakses dengan `getNIM()`, `getNIP()`, dll.

### 4. **Polymorphism (Polimorfisme)**

- Method `absen()` bisa berbeda:
    - Mahasiswa → absen sebagai peserta kuliah.
    - Dosen → absen sebagai pengajar.

### 5. **Abstraction (Abstraksi)**

- Misalnya ada interface `KegiatanKampus` dengan method `hadirKuliah()`, `ikutKegiatan()`.
    
    Baik Mahasiswa maupun Dosen bisa punya implementasi masing-masing.
    

## 1. Class & Object (OOP Dasar)

- **Class** adalah blueprint (cetak biru) untuk membuat object.
- **Object** adalah instance dari class.

```dart
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

```

---

## 2. Constructor, Method, Property

- **Constructor**: fungsi khusus untuk membuat object.
- **Property**: variabel dalam class.
- **Method**: fungsi dalam class.

```dart
class Mahasiswa {
  String nama;
  int umur;

  // Constructor
  Mahasiswa(this.nama, this.umur);

  // Method
  void perkenalan() {
    print('Halo, saya $nama, umur $umur tahun');
  }
}

void main() {
  var mhs = Mahasiswa('Budi', 21);
  mhs.perkenalan(); // Halo, saya Budi, umur 21 tahun
}

```

---

## 3. Inheritance, Interface, Abstract Class

- **Inheritance**: mewarisi class lain.
- **Abstract class**: tidak bisa diinstansiasi langsung, hanya sebagai template.
- **Interface**: kontrak yang harus diimplementasikan.

```dart
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
  anjing.suara(); // Guk guk!

  var kucing = Kucing();
  kucing.suara(); // Meong
  kucing.lari();  // Kucing berlari cepat
}

```

---

## 4.  List and Class

- 

```dart
class Person{String _firstName;String _lastName;String _phone;Person(this._firstName, this._lastName, this._phone);toString(){return "${_firstName} ${_lastName} ${_phone}"; }}void main() {List<Person> list = [Person("Mark", "Clow", "4043124462"), Person("Brant","Sandermine", "4243124462"), Person("Phillip", "Perry","4243124444") ];print("Not sorted: ${list}");list.sort((a, b) => a._firstName.compareTo(b._firstName));print("Sorted by first name: ${list}");list.sort((a, b) => a._firstName.compareTo(b._lastName));print("Sorted by last name: ${list}"); }

```

---

## 5. Async / Await & Future

- **Future**: nilai yang tersedia nanti (asynchronous).
- **async / await**: menunggu proses async selesai.

```dart
Future<String> getData() async {
  await Future.delayed(Duration(seconds: 2)); // simulasi delay
  return 'Data berhasil diambil!';
}

void main() async {
  print('Mulai fetch...');
  String hasil = await getData();
  print(hasil); // Data berhasil diambil!
  print('Selesai');
}

```

---