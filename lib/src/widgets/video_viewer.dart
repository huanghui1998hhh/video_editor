import 'package:flutter/material.dart';

import '../controller.dart';
import 'theme/video_editor_theme.dart';

class VideoViewer extends StatelessWidget {
  const VideoViewer({super.key, required this.controller, this.child});

  final BaseVideoEditorController controller;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
      },
      child: Center(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: controller.videoDimension.aspectRatio,
              child: VideoEditorTheme.previewBuilderOf(
                context,
              )(
                context,
                controller,
              ),
            ),
            if (child != null)
              AspectRatio(
                aspectRatio: controller.videoDimension.aspectRatio,
                child: child,
              ),
          ],
        ),
      ),
    );
  }
}
