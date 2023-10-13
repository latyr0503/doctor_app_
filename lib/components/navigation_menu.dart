import 'package:doctor_app/components/card_speciality.dart';
import 'package:doctor_app/components/teste.dart';
import 'package:doctor_app/pages/profile.dart';
import 'package:doctor_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            backgroundColor: Colors.grey.shade200,
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "home"),
              NavigationDestination(
                  icon: Icon(Iconsax.location), label: "Explore "),
              NavigationDestination(
                  icon: Icon(Iconsax.calendar_1), label: "Bookings"),
              NavigationDestination(icon: Icon(Iconsax.message), label: "Chat"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profil"),
            ]),
      ),
      body: Obx(() => controller.Screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  // ignore: non_constant_identifier_names
  final Screens = [
    const Welcome_page(),
    const Teste(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: const Color.fromRGBO(243, 198, 33, 1),
    ),
    const Profile()
  ];
}