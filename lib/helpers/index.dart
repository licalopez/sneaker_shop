String addCommaToNumString (double num) {
  return num
    .toStringAsFixed(2)
    .replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), 
      (Match m) => '${m[1]},'
    );
}