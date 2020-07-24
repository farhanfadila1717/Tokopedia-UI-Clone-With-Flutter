part of 'widgets.dart';

class MenuList extends StatelessWidget {
  final String title;
  final String icon;
  MenuList({this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(icon), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 50,
            height: 26,
            child: Text(
              "$title",
              style: blackTextFont.copyWith(
                  fontSize: 10, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
