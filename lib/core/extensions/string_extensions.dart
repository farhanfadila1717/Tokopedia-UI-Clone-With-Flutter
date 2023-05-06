extension StringExtensions on String {
  String get imagesJPEG => 'assets/images/$this.jpeg';
  String get imagesJPG => 'assets/images/$this.jpg';
  String get imagesPNG => 'assets/images/$this.png';
  String get imagesSVG => 'assets/images/$this.svg';
  String get imagesWEBP => 'assets/images/$this.webp';
}
