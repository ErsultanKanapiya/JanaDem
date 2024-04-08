import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/screens/user/add_problem/camera_view.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late CameraController cameraController;

  late Future<void> cameraValue;

  bool flash = false;
  bool isCameraFront = true;

  @override
  void initState() {
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(cameraController);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash ? cameraController.setFlashMode(FlashMode.torch) : cameraController.setFlashMode(FlashMode.off);
                        },
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: const Color(0xff2C2C2C),
                          // child: SvgPicture.asset('${Assets().icn}flash.svg')
                          child: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset('${Assets().icn}gallery.svg')
                      )
                  ),
                  GestureDetector(
                      onTap: () {
                        takePhoto(context);
                      },
                      child: const CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      )
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isCameraFront = !isCameraFront;
                        });
                        int cameraPos = isCameraFront ? 0 : 1;
                        cameraController = CameraController(cameras[cameraPos], ResolutionPreset.high);
                        cameraValue = cameraController.initialize();
                      },
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset('${Assets().icn}camera_rotate.svg')
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context ) async {
    XFile path = await cameraController.takePicture();

    Navigator.push(
      context, MaterialPageRoute(builder: (builder) => CameraViewPage(path: path.path))
    );
  }

}