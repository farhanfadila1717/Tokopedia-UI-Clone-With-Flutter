part of 'pages.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  Color statusBarColor;
  List<bool> checkBox;
  bool checkAll = true;
  int totalHarga = 0;
  DateTime timeNow = DateTime.now();
  var i;
  @override
  void initState() {
    statusBarColor = mainColor;
    total();
    super.initState();
  }

  int total() {
    List<Produk> keranjangProduk = dummyProduk.sublist(1, 3);

    for (i = 0; i < keranjangProduk.length;) {
      setState(() {
        totalHarga += keranjangProduk[i].hargaProduk;
      });

      i++;
    }

    return totalHarga;
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    List<Produk> keranjangProduk = dummyProduk.sublist(1, 3);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: statusBarColor,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 110),
                width: widthSize,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 16),
                        color: accentColor1.withOpacity(0.2),
                        child: Stack(
                          children: [
                            Positioned(
                              top: -5,
                              left: -5,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: accentColor1.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "i",
                                    style: whiteTextFont.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin, vertical: 10),
                              child: Text(
                                "Bonus 10 kuota Bebas Ongkir hingga ${timeNow.dateAndTime}. Sisa kuotamu 19x(untuk 1 pesanan/transaksi).",
                                style: blackTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: listOfKeranjang(widthSize, heightSize),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: widthSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: defaultMargin),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Keranjang",
                            style: blackTextFont.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: widthSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 3,
                            color: accentColor3.withOpacity(0.5),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: defaultMargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      margin: EdgeInsets.only(right: 8),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            value: checkAll,
                                            activeColor: mainColor,
                                            hoverColor: accentColor2,
                                            onChanged: (value) {
                                              setState(() {
                                                checkAll = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Pilih Semua Barang",
                                      style: blackTextFont.copyWith(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Hapus",
                                style: greenTextFont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 60,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: defaultMargin),
                  width: widthSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: accentColor3.withOpacity(0.3),
                        blurRadius: 3,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 55,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: accentColor3.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: mainColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "%",
                                  style: whiteTextFont,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Makin Hemat Pakai Promo",
                              style: blackTextFont.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: accentColor3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Harga",
                                    style: blackTextFont.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                    ).format(totalHarga),
                                    style: whiteTextFont.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepOrange[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: double.infinity,
                              width: widthSize * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange[600],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  "Beli (${keranjangProduk.length.toString()})",
                                  style: whiteTextFont.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  List<Widget> listOfKeranjang(double widthSize, double heightSize) {
    List<Kategori> newKategori = dummyKategori;

    return newKategori
        .map(
          (e) => KeranjangCard(
            heightSize: heightSize,
            widthSize: widthSize,
            kategori: e,
          ),
        )
        .toList();
  }
}
