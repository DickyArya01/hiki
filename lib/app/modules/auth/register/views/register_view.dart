import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hiki/app/global/constants/images.dart';
import 'package:hiki/app/global/theme/colors.dart';
import 'package:hiki/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

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
                    "Daftar Akun Baru",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Buat akun untuk melanjutkan",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    controller: controller.textController['nama'],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        label: const Text("Nama Lengkap"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(),
                        ),
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    controller: controller.textController['email'],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onEditingComplete: () {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email tidak boleh kosong!';
                      }
                      if (!GetUtils.isEmail(value)) {
                        return "Email tidak valid";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(14),
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(),
                      ),
                      prefixIcon: const Icon(Icons.mail),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    controller: controller.textController['nomer'],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nomor Telepon tidak boleh kosong!';
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        label: const Text("No. Telepon"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(),
                        ),
                        prefix: const Text("+62"),
                        prefixIcon: const Icon(Icons.phone_android)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () => TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      obscureText: controller.isHidden,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong!';
                        }
                        if (value.length < 8) {
                          return 'Password minimal 8 karakter';
                        }
                      },
                      controller: controller.textController['password'],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        label: const Text("Kata Sandi"),
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
                  Obx(
                    () => TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.textController['password2'],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Konfirmasi password tidak boleh kosong';
                        }
                        if (value !=
                            controller.textController['password']!.text) {
                          return 'Password tidak sama';
                        }
                      },
                      obscureText: controller.isHidden,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        label: const Text("Ulangi Kata Sandi"),
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
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.register();
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
                          "Daftar",
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
                        "Sudah punya akun? ",
                        style: Theme.of(context).textTheme.button,
                      ),
                      InkWell(
                          onTap: () => Get.offNamed(Routes.LOGIN),
                          child: Text(
                            "Login",
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
