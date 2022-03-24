import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hiki/app/global/constants/images.dart';
import 'package:hiki/app/global/theme/colors.dart';
import 'package:hiki/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Image.asset(
            Images.logo,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Hello Again !',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    "Welcome back you've \n been missed !",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Obx(
                    () => TextFormField(
                      style: Theme.of(context).textTheme.subtitle1,
                      controller: controller.textController['akun'],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return controller.isEmail
                              ? 'Email tidak boleh kosong'
                              : 'Nomor Telepon tidak boleh kosong';
                        }
                        if (controller.isEmail) {
                          if (!GetUtils.isEmail(value)) {
                            return "Email tidak valid";
                          }
                        }
                      },
                      keyboardType: controller.isEmail
                          ? TextInputType.emailAddress
                          : TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        label: Text(
                            controller.isEmail ? "Email" : "Nomor Telepon"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(),
                        ),
                        prefix: controller.isEmail ? null : const Text("+62"),
                        prefixIcon: controller.isEmail
                            ? const Icon(Icons.mail)
                            : const Icon(Icons.phone_android),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () => TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      obscureText: controller.isHidden,
                      controller: controller.textController['password'],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong!';
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        label: const Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: controller.togglePasswordView,
                          child: Icon(controller.isHidden
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          controller.toggleEmailorTelepon();
                        },
                        child: Obx(
                          () => Text(
                            controller.isEmail
                                ? "Masuk dengan Nomor Telepon"
                                : "Masuk dengan Email",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.blue),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await controller.login();
                      }
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun? ",
                        style: Theme.of(context).textTheme.button,
                      ),
                      InkWell(
                          onTap: () => Get.offNamed(Routes.REGISTER),
                          child: Text(
                            "Daftar disini",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
