import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/global/controller/app_controller.dart';
import 'package:hiki/app/global/theme/colors.dart';
import 'package:hiki/app/modules/home/controllers/home_controller.dart';

class Profil extends GetView<HomeController> {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[MyColors.primary, Colors.pinkAccent],
                tileMode: TileMode.repeated),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text(
              'Profil',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: MyColors.primary,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              width: double.infinity,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[MyColors.primary, Colors.pinkAccent],
                    tileMode: TileMode.repeated),
              ),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(children: [
                    Text(
                      AppController.user!.nama,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      'Nomor : ${AppController.user!.nomer}',
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    Text(
                      'Email : ${AppController.user!.email}',
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        controller.logOut();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                              child: Text(
                            "Logout",
                            style: Get.textTheme.headline6!
                                .copyWith(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ])),
            )
          ]),
          Positioned(
              // (background container size(size container/appbar atas)) - (circle height / 2)
              top: (Get.height * 0.2) - (100 / 2),
              child: const SizedBox(
                  height: 100.0, width: 100.0, child: CircleAvatar())),
        ],
      ),
    );
  }
}
