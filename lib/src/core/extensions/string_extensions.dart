extension ImagePath on String {
  String get toSvg => "assets/icons/svg_$this.svg";

  String get toPng => "assets/images/ig_$this.png";

  String get toJpg => "assets/images/ig_$this.jpg";

  String get toGif => "assets/images/gif_$this.gif";

  String get toJson => "assets/lottie/$this.json";
}

extension StringValidatorExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrNoEmpty => this != null && this!.isNotEmpty;
}
