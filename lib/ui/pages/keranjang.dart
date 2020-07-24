part of 'pages.dart';

class KeranjangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: 210,
          width: widthSize,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dummyProduk.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: (index == 0) ? defaultMargin : 0,
                    right: (index == dummyProduk.length) ? defaultMargin : 16,
                  ),
                  child: ProdukCard(
                    produk: dummyProduk[index],
                    isPromo: true,
                  ),
                );
              }),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
