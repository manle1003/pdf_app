import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/image_editor_screen/image_editor_screen.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key});

  Future<String> _photoPathBuilder() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<String> _videoPathBuilder() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CameraAwesomeBuilder.awesome(
              saveConfig: SaveConfig.photoAndVideo(
                initialCaptureMode: CaptureMode.photo,
                photoPathBuilder: _photoPathBuilder,
                videoPathBuilder: _videoPathBuilder,
              ),
              filter: AwesomeFilter.AddictiveRed,
              previewFit: CameraPreviewFit.fitWidth,
              onMediaTap: (mediaCapture) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageEditorScreen(
                      imagePath: mediaCapture.filePath,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
