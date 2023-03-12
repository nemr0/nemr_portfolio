/// Line abstract class for different implementations of line shape
abstract class Line {}

/// a normal solid line
class SolidLine extends Line {}

/// a dashed line
class DashedLine extends Line {
  /// size of dash itself
  final double? dashSize;

  /// size of gap between dashes
  final double? gapSize;

  DashedLine({this.dashSize, this.gapSize});
}
