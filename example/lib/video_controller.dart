import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';

class VideoEditorController extends BaseVideoEditorController
    with VideoCoverHandler {
  VideoEditorController({
    required this.file,
    super.maxDuration,
    super.minDuration,
    this.coverThumbnailsQuality = 10,
    this.trimThumbnailsQuality = 10,
  }) : _video = VideoPlayerController.file(
          File(Platform.isIOS ? Uri.encodeFull(file.path) : file.path),
        );

  @override
  final File file;

  @override
  final int coverThumbnailsQuality;

  @override
  final int trimThumbnailsQuality;

  final VideoPlayerController _video;
  VideoPlayerController get video => _video;

  @override
  Listenable? get listenable => _video;

  @override
  bool get initialized => _video.value.isInitialized;

  @override
  bool get isPlaying => _video.value.isPlaying;

  @override
  Duration get videoPosition => _video.value.position;

  @override
  Duration get videoDuration => _video.value.duration;

  @override
  Size get videoDimension => _video.value.size;

  @override
  Future<void> pause() => _video.pause();

  @override
  Future<void> play() => _video.play();

  @override
  Future<void> seekTo(Duration position) => _video.seekTo(position);

  @override
  Future<void> initialize({double? aspectRatio}) async {
    await _video.initialize();

    _video.addListener(onPositionChanged);
    _video.setLooping(true);

    super.initialize(aspectRatio: aspectRatio);
  }

  @override
  Future<void> dispose() async {
    if (_video.value.isPlaying) await _video.pause();
    _video.removeListener(onPositionChanged);
    _video.dispose();
    return super.dispose();
  }
}
