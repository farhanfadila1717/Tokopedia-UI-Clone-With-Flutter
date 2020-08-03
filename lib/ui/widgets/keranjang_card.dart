part of 'widgets.dart';

class KeranjangCard extends StatelessWidget {
  final double widthSize;

  KeranjangCard({this.widthSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
      height: 150,
      width: widthSize - 2 * defaultMargin,
      color: Colors.amber,
    );
  }
}
