import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/widgets/custom_container.dart';
import 'package:pinput/pinput.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 66,
      height: 66,
      textStyle: TextStyle(
          fontSize: 32,
          color: AppTheme.isLightTheme == false ? Colors.white : const Color(0xff15141F),
          fontWeight: FontWeight.w800),
      decoration: BoxDecoration(
        color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
        borderRadius: BorderRadius.circular(16),
      ),
    );
    var DefaultImages;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
        elevation: 0,
        leading: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
        ),
        title: Text(
          "Create pin",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 296,
                        width: 245,
                        child: Image.asset(
                          AppTheme.isLightTheme == false ? DefaultImages.finCardDark : DefaultImages.createpin,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 27),
                      Text(
                        "Add a pin number to make your card more\nsecure",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffA2A0A8),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).padding.bottom + 14,
              ),
              child: CustomButton(
                title: "Save pin",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
