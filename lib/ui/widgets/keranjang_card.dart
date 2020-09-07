part of 'widgets.dart';

class KeranjangCard extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  final Kategori kategori;

  KeranjangCard({this.widthSize, this.kategori, this.heightSize});

  @override
  Widget build(BuildContext context) {
    bool isCheckToko = true;
    bool isCheckBarang = true;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
      height: heightSize * 0.3,
      width: widthSize - 2 * defaultMargin,
      color: Colors.amber,
    );
  }
}
