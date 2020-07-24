part of 'widgets.dart';

class KategoriCard extends StatelessWidget {
  final String namaKategori;

  final List<Color> color;
  final Function onTap;
  final bool isSelected;
  final double width;

  KategoriCard(
      {this.namaKategori,
      this.color,
      this.onTap,
      this.isSelected = false,
      this.width = 70});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: color,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 2,
              width: 20,
              margin: EdgeInsets.only(bottom: 5),
              color: (isSelected == true) ? Colors.white : Colors.transparent,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  namaKategori,
                  style: whiteTextFont.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
