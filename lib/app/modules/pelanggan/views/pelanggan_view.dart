import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pelanggan_controller.dart';

class PelangganView extends GetView<PelangganController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PelangganView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PelangganView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
