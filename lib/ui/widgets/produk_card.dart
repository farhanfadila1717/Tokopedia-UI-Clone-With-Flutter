part of 'widgets.dart';

class ProdukCard extends StatelessWidget {
  final Produk produk;
  final double height;
  final double width;

  final bool isPromo;

  ProdukCard(
      {this.produk,
      this.isPromo = false,
      this.height = double.infinity,
      this.width = 120});

  @override
  Widget build(BuildContext context) {
    double discount = produk.hargaProduk * produk.promo;
    double tampilHarga = produk.hargaProduk - discount;
    double tampilDiscount = produk.promo * 10;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600].withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: width,
            width: width,
            decoration: BoxDecoration(
              color: accentColor3,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                image: AssetImage(produk.fotoProduk),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (isPromo == true)
                      ? Container(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.pink[200],
                                ),
                                child: Text(
                                  "${tampilDiscount.toString().replaceAll('.', '')} %",
                                  style: whiteTextFont.copyWith(
                                    color: Colors.pink[600],
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp ',
                                          decimalDigits: 0,
                                        ).format(produk.hargaProduk),
                                        style: greyTextFont.copyWith(
                                          fontSize: 10,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      child: Container(
                                        width: 70,
                                        height: 1,
                                        color: accentColor3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  (isPromo == false)
                      ? Container(
                          child: Text(
                            produk.namaProduk,
                            style: blackTextFont,
                            maxLines: 2,
                          ),
                        )
                      : SizedBox(),
                  Container(
                    child: Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(tampilHarga),
                      style: blackTextFont.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  (isPromo == false)
                      ? Container(
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                padding: EdgeInsets.all(3),
                                margin: EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: mainColor,
                                ),
                                child: Icon(
                                  Icons.account_balance,
                                  color: Colors.amber,
                                  size: 10,
                                ),
                              ),
                              Container(
                                width: width - 46,
                                child: Text(
                                  produk.kotaTokoProduk,
                                  style: greyTextFont.copyWith(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  (isPromo == false)
                      ? Row(
                          children: [
                            RatingBar(
                                initialRating: produk.ratingProduk,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                onRatingUpdate: null),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "(${produk.totalBeliProduk})",
                              style: greyTextFont.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  Container(
                    height: 15,
                    child: SvgPicture.asset(
                      "assets/icons/bebas_ongkir.svg",
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  (isPromo == true)
                      ? Container(
                          height: 6,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: accentColor2.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 6,
                              width: 50,
                              decoration: BoxDecoration(
                                color: accentColor2,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  (isPromo == true)
                      ? Text(
                          "Tersedia",
                          style: blackTextFont.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[900],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
