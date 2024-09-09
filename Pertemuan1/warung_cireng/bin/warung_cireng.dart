import 'dart:async'; // Import untuk penggunaan async dan await

// Kelas MenuItem untuk merepresentasikan item di menu
class MenuItem {
  String name;
  double price;

  MenuItem(this.name, this.price);
}

// Kelas Order untuk menyimpan data pemesanan
class Order {
  List<Map<String, dynamic>> items = [];

  // Fungsi untuk menambah item ke pesanan
  void addItem(MenuItem item, int quantity) {
    items.add({'item': item, 'quantity': quantity});
    print("${quantity}x ${item.name} berhasil ditambahkan ke pesanan.");
  }

  // Fungsi untuk menghitung total harga pesanan
  double calculateTotal() {
    double total = 0;
    for (var entry in items) {
      MenuItem item = entry['item'];
      int quantity = entry['quantity'];
      total += item.price * quantity;
    }
    return total;
  }
}

// Kelas Restaurant untuk mengelola warung cireng
class WarungCireng {
  List<MenuItem> menu;

  WarungCireng(this.menu);

  // Fungsi untuk menampilkan menu
  void showMenu() {
    print("Daftar Menu Warung Cireng:");
    for (var item in menu) {
      print("${item.name} - Rp${item.price}");
    }
  }

  // Fungsi untuk memproses pesanan secara async
  Future<void> processOrder(Order order) async {
    print("Memproses pesanan...");
    await Future.delayed(Duration(seconds: 2)); // Simulasi waktu proses
    double total = order.calculateTotal();
    print("Pesanan selesai diproses. Total: Rp${total.toStringAsFixed(2)}");
  }
}

void main() async {
  // Membuat beberapa item menu
  MenuItem cirengAyam = MenuItem("Cireng Isi Ayam Suir", 4500);
  MenuItem cirengAti = MenuItem("Cireng Isi Ati Ampela", 4000);
  MenuItem cirengKulit = MenuItem("Cireng Isi Kulit", 4000);

  // Membuat warung cireng dan menambahkan menu
  WarungCireng warungCireng = WarungCireng([cirengAyam, cirengAti, cirengKulit]);

  // Menampilkan menu
  warungCireng.showMenu();

  // Membuat pesanan
  Order order = Order();
  order.addItem(cirengAyam, 5); // Pesan 3 cireng isi ayam
  order.addItem(cirengAti, 3); // Pesan 2 cireng isi hati
  order.addItem(cirengKulit, 4); // Pesan 4 cireng isi kornet

  // Memproses pesanan
  await warungCireng.processOrder(order);
}
