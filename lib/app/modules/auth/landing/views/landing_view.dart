import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'package:get/get.dart';
import 'package:hiki/app/global/constants/images.dart';
import 'package:hiki/app/global/theme/colors.dart';
import 'package:hiki/app/routes/app_pages.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Image.asset(
                                Images.logo,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        width: double.infinity,
                        child: Text("Selamat Datang\ndi HIKI",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline4)),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          "",
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey),
                        )),
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColors.primary),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Masuk",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: MyColors.primary)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Daftar",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: MyColors.primary),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        FlutterWebBrowser.openWebPage(
                          url: "",
                          customTabsOptions: const CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            shareState: CustomTabsShareState.on,
                            instantAppsEnabled: true,
                            showTitle: true,
                            urlBarHidingEnabled: true,
                          ),
                          safariVCOptions: const SafariViewControllerOptions(
                            barCollapsingEnabled: true,
                            preferredBarTintColor: Colors.green,
                            preferredControlTintColor: Colors.amber,
                            dismissButtonStyle:
                                SafariViewControllerDismissButtonStyle.close,
                            modalPresentationCapturesStatusBarAppearance: true,
                          ),
                        );
                      },
                      child: FittedBox(
                        child: Text(
                          "Baca Kebijakan Privasi Aplikasi Disini (Privacy Policy)",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
