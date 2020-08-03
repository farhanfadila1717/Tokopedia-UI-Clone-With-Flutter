part of 'models.dart';

class Produk {
  final String fotoProduk;
  final String namaProduk, namaToko, kotaTokoProduk, statusToko, detailProduk;
  final int hargaProduk, totalBeliProduk, sisaProduk;
  final double ratingProduk, promo;
  final bool isFavorite;

  Produk({
    this.namaProduk,
    this.fotoProduk,
    this.namaToko,
    this.hargaProduk,
    this.ratingProduk,
    this.kotaTokoProduk,
    this.totalBeliProduk,
    this.statusToko,
    this.sisaProduk,
    this.isFavorite = false,
    this.promo = 0.1,
    this.detailProduk =
        "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf.",
  });
}

List<Produk> dummyProduk = [
  Produk(
    namaProduk: "Shark Helmet",
    namaToko: "Toko Bangben",
    fotoProduk: "assets/img/helm.jpg",
    hargaProduk: 700000,
    ratingProduk: 4.5,
    kotaTokoProduk: "Kota Depok",
    totalBeliProduk: 10,
    statusToko: "official",
    sisaProduk: 4,
  ),
  Produk(
      namaProduk: "Samsung A 51",
      namaToko: "Toko Jaya Makmur",
      fotoProduk: "assets/img/hp_samsung.jpg",
      hargaProduk: 4699000,
      ratingProduk: 3.6,
      kotaTokoProduk: "Jakarta Selatan",
      totalBeliProduk: 12,
      statusToko: "official",
      sisaProduk: 4,
      isFavorite: true),
  Produk(
    namaProduk: "Xiaomi Note 9s",
    namaToko: "Xiaomi Official Store",
    fotoProduk: "assets/img/hp_xiaomi.jpg",
    hargaProduk: 3150000,
    ratingProduk: 4.7,
    kotaTokoProduk: "Kota Depok",
    totalBeliProduk: 78,
    statusToko: "official",
    sisaProduk: 4,
    isFavorite: true,
  ),
  Produk(
    namaProduk: "Mechanical Keyboard Gaming",
    namaToko: "Galaxy Gaming",
    fotoProduk: "assets/img/keyboard.jpg",
    hargaProduk: 150000,
    ratingProduk: 4.2,
    kotaTokoProduk: "Tanggerang Selatan",
    totalBeliProduk: 12,
    statusToko: "official",
    sisaProduk: 4,
  ),
  Produk(
    namaProduk: "Macbook Pro 2016",
    namaToko: "Sinar Gadget",
    fotoProduk: "assets/img/laptop.jpg",
    hargaProduk: 12000000,
    ratingProduk: 4,
    kotaTokoProduk: "Jakarta Pusat",
    totalBeliProduk: 5,
    statusToko: "official",
    sisaProduk: 3,
  ),
  Produk(
    namaProduk: "Huawei Matebook D14",
    namaToko: "Koye Electrinic",
    fotoProduk: "assets/img/matebook.jpg",
    hargaProduk: 10500000,
    ratingProduk: 4.4,
    kotaTokoProduk: "Kota Malang",
    totalBeliProduk: 12,
    statusToko: "official",
    sisaProduk: 10,
  ),
  Produk(
    namaProduk: "HP Monitor 24mh",
    namaToko: "Koye Electronic",
    fotoProduk: "assets/img/monitor_hp.jpg",
    hargaProduk: 150000,
    ratingProduk: 4.7,
    kotaTokoProduk: "Kota Malang",
    totalBeliProduk: 72,
    statusToko: "official",
    sisaProduk: 13,
  ),
  Produk(
    namaProduk: "HP Mouse Black",
    namaToko: "Koye Electronic",
    fotoProduk: "assets/img/mouse.jpg",
    hargaProduk: 150000,
    ratingProduk: 4.7,
    kotaTokoProduk: "Kota Malang",
    totalBeliProduk: 72,
    statusToko: "official",
    sisaProduk: 13,
  ),
  Produk(
    namaProduk: "Parfume For Woman",
    namaToko: "Leli Fashion Murah",
    fotoProduk: "assets/img/parfume.jpg",
    hargaProduk: 300000,
    ratingProduk: 4.5,
    kotaTokoProduk: "Kota Surabaya",
    totalBeliProduk: 61,
    statusToko: "official",
    sisaProduk: 13,
  ),
  Produk(
    namaProduk: "Playstation 5",
    namaToko: "Buye Electronic",
    fotoProduk: "assets/img/ps_5.jpg",
    hargaProduk: 7000000,
    ratingProduk: 4.2,
    kotaTokoProduk: "Kota Depok",
    totalBeliProduk: 28,
    statusToko: "official",
    sisaProduk: 3,
  ),
  Produk(
    namaProduk: "RD Shimano Alivio",
    namaToko: "Gede Sports",
    fotoProduk: "assets/img/rd_alivio.jpg",
    hargaProduk: 350000,
    ratingProduk: 4.1,
    kotaTokoProduk: "Kota Surabaya",
    totalBeliProduk: 99,
    statusToko: "official",
    sisaProduk: 9,
  ),
  Produk(
    namaProduk: "Sepeda MTB Polygon",
    namaToko: "Goes Santai",
    fotoProduk: "assets/img/sepeda_polygon.jpg",
    hargaProduk: 7000000,
    ratingProduk: 4.7,
    kotaTokoProduk: "Jakarta Timur",
    totalBeliProduk: 28,
    statusToko: "official",
    sisaProduk: 34,
  ),
  Produk(
    namaProduk: "Nutrica Aptamil",
    namaToko: "Nutre Official",
    fotoProduk: "assets/img/susu_bayi.jpg",
    hargaProduk: 130000,
    ratingProduk: 4.3,
    kotaTokoProduk: "Kota Surabaya",
    totalBeliProduk: 71,
    statusToko: "official",
    sisaProduk: 21,
  ),
  Produk(
    namaProduk: "SGM Ananda 0-6 Bulan",
    namaToko: "Keoko Mart",
    fotoProduk: "assets/img/susu_sgm.jpg",
    hargaProduk: 70000,
    ratingProduk: 4.5,
    kotaTokoProduk: "Kota Depok",
    totalBeliProduk: 99,
    statusToko: "official",
    sisaProduk: 18,
  ),
];

class Kategori {
  final String namaKategori;
  final List<Color> ketegoriColor;

  Kategori({this.namaKategori, this.ketegoriColor});
}

List<Kategori> dummyKategori = [
  Kategori(namaKategori: "For Farhan", ketegoriColor: [
    Colors.purple[900],
    Colors.purple[600],
  ]),
  Kategori(namaKategori: "Special Discount", ketegoriColor: [
    Colors.amber[700],
    Colors.amber,
  ]),
  Kategori(namaKategori: "Aktivitasmu", ketegoriColor: [
    Colors.green[900],
    Colors.green[700],
  ]),
  Kategori(namaKategori: "Fashion", ketegoriColor: [
    Colors.indigo[900],
    Colors.indigo[600],
  ]),
];
