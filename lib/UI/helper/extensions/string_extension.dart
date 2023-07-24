extension StringExtension on String {
  String capitalizeFirstLetter() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
