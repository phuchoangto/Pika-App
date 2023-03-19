import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/ui/proof/upload_back_photo_screen.dart';
import 'package:pika/src/ui/proof/upload_id_screen.dart';

import 'controllers/proof_controller.dart';

class UploadFrontPhotoScreen extends GetView<ProofController> {
  @override
  Widget build(BuildContext context) {
    var cam = controller.camController.value;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppTheme.isLightTheme == false ? const Color(0xff15141F) : const Color(0xff7C7E8E),
                AppTheme.isLightTheme == false ? const Color(0xff15141F) : const Color(0xff80818E),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: HexColor(AppTheme.secondaryColorString!),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Text(
                    "The front of ID Card",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w800, fontSize: 24, color: HexColor(AppTheme.secondaryColorString!)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Position all 4 corners of the page clearly",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffCCCACF),
                        ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          height: 260,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff1F1F2E),
                          ),
                          child: cam.value.isInitialized
                              ? GetBuilder<ProofController>(
                                  builder: ((_) => AspectRatio(
                                        aspectRatio: cam.value.aspectRatio,
                                        child: CameraPreview(cam),
                                      )),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28, right: 28),
                        child: SizedBox(
                          height: 260,
                          width: Get.width,
                          child: Image.asset(
                            DefaultImages.scanPng,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30, top: 254),
                        child: Container(
                          height: 260,
                          width: Get.width,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 190,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : Colors.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 6,
                    width: 48,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: const Color(0xffE3E8FC)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          print('image picker');
                          // final ImagePicker _picker = ImagePicker();
                          // await _picker.pickImage(source: ImageSource.gallery);
                        },
                        child: SizedBox(
                          height: 48,
                          width: 48,
                          child: SvgPicture.asset(
                            AppTheme.isLightTheme == false ? DefaultImages.darkGallery : DefaultImages.gallery,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          controller.takePicture('front');
                        },
                        child: SizedBox(
                          height: 96,
                          width: 96,
                          child: SvgPicture.asset(
                            AppTheme.isLightTheme == false ? DefaultImages.darkPhoto : DefaultImages.photo,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('flash on');
                        },
                        child: SizedBox(
                          height: 48,
                          width: 48,
                          child: SvgPicture.asset(
                              AppTheme.isLightTheme == false ? DefaultImages.darkFlash : DefaultImages.flash),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = 3.0;
    final radius = 20.0;
    final tRadius = 2 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 300;
  static double height = 300;
}
