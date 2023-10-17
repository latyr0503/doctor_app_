import 'package:doctor_app/pages/accesslocation.dart';
import 'package:doctor_app/pages/doctor_details.dart';
import 'package:doctor_app/pages/profile.dart';
import 'package:doctor_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Welcome_page(),
    Container(
      color: const Color.fromARGB(255, 176, 10, 118),
    ),
    const Details_doctor(),
    Container(
      color: const Color.fromARGB(255, 2, 138, 45),
    ),
    const Profile()
  ];
}
