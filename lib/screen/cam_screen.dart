import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatelessWidget {
  const CamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIVE',
        ),
      ),
      body: FutureBuilder<bool>(
        future: init(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Center(
             child: Text(
               snapshot.error.toString(),
             ),
            );
          }

          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [

            ],
          );
        }
      ),
    );
  }

  Future<bool> init() async {
    final resp = await[Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if(cameraPermission != PermissionStatus.granted) {
      throw '카메라 권한이 없습니다.';
    }

    if(microphonePermission != PermissionStatus.granted) {
      throw '마이크 권한이 없습니다.';
    }

    

    return true;
  }
}

