import 'package:flutter/material.dart';

@immutable
class CoverSelectionStyle {
  /// Style for [CoverSelection]. It's use on VideoEditorController
  const CoverSelectionStyle({
    this.selectedBorderColor = Colors.white,
    this.borderWidth = 2,
    this.borderRadius = 5.0,
  });

  /// The [selectedBorderColor] param specifies the color of the border around the selected cover thumbnail
  ///
  /// Defaults to [Colors.white]
  final Color selectedBorderColor;

  /// The [borderWidth] param specifies the width of the border around each cover thumbnails
  ///
  /// Defaults to `2`
  final double borderWidth;

  /// The [borderRadius] param specifies the border radius of each cover thumbnail
  ///
  /// Defaults to `5`
  final double borderRadius;

  @override
  int get hashCode =>
      Object.hash(selectedBorderColor, borderWidth, borderRadius);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CoverSelectionStyle &&
        other.selectedBorderColor == selectedBorderColor &&
        other.borderWidth == borderWidth &&
        other.borderRadius == borderRadius;
  }
}
