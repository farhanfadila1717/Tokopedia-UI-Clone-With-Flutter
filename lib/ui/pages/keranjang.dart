part of 'pages.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  Color statusBarColor;
  List<bool> checkBox;
  bool checkAll = true;

  @override
  void initState() {
    statusBarColor = mainColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int totalHarga = 0;
    double widthSize = MediaQuery.of(context).size.width;
    List<Produk> keranjangProduk = dummyProduk.sublist(5, 8);

    for (var i = 0; i < keranjangProduk.length; i++) {
      totalHarga += keranjangProduk[i].hargaProduk;
    }
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
                                "Bonus 10 kuota Bebas Ongkir hingga 31 Juli 2020. Sisa kuotamu 19x(untuk 1 pesanan/transaksi).",
                                style: blackTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: accentColor1,
                        child: Placeholder(),
                      ),
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
                  height: 60,
                  width: widthSize,
                  color: mainColor,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
