import 'package:flutter/material.dart';

import '../../../video_editor.dart';

typedef VideoPreviewWidgetBuilder = Widget Function(
  BuildContext context,
  BaseVideoEditorController controller,
);

class VideoEditorTheme<T extends BaseVideoEditorController>
    extends InheritedTheme {
  const VideoEditorTheme({
    super.key,
    required this.coverStyle,
    required this.cropStyle,
    required this.trimStyle,
    required this.previewBuilder,
    required super.child,
  });

  final CoverSelectionStyle coverStyle;
  final CropGridStyle cropStyle;
  final TrimSliderStyle trimStyle;
  final VideoPreviewWidgetBuilder previewBuilder;

  static CoverSelectionStyle coverStyleOf(BuildContext context) {
    final VideoEditorTheme? videoEditorTheme =
        context.dependOnInheritedWidgetOfExactType<VideoEditorTheme>();
    return videoEditorTheme?.coverStyle ?? const CoverSelectionStyle();
  }

  static CropGridStyle cropStyleOf(BuildContext context) {
    final VideoEditorTheme? videoEditorTheme =
        context.dependOnInheritedWidgetOfExactType<VideoEditorTheme>();
    return videoEditorTheme?.cropStyle ?? const CropGridStyle();
  }

  static TrimSliderStyle trimStyleOf(BuildContext context) {
    final VideoEditorTheme? videoEditorTheme =
        context.dependOnInheritedWidgetOfExactType<VideoEditorTheme>();
    return videoEditorTheme?.trimStyle ?? TrimSliderStyle();
  }

  static VideoPreviewWidgetBuilder previewBuilderOf(
    BuildContext context,
  ) {
    final VideoEditorTheme? videoEditorTheme =
        context.dependOnInheritedWidgetOfExactType<VideoEditorTheme>();
    if (videoEditorTheme == null) {
      throw Exception(
        'VideoEditorTheme is not found in the widget tree. Please add VideoEditorTheme.of(context) in the widget tree.',
      );
    }
    return videoEditorTheme.previewBuilder;
  }

  @override
  bool updateShouldNotify(VideoEditorTheme oldWidget) =>
      coverStyle != oldWidget.coverStyle ||
      cropStyle != oldWidget.cropStyle ||
      trimStyle != oldWidget.trimStyle ||
      previewBuilder != oldWidget.previewBuilder;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return VideoEditorTheme(
      coverStyle: coverStyle,
      cropStyle: cropStyle,
      trimStyle: trimStyle,
      previewBuilder: previewBuilder,
      child: child,
    );
  }
}
