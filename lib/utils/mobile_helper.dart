import 'dart:developer';
import 'package:flutter/services.dart';

Future<void> buyProduct() async {
  try{
    const platform = MethodChannel("native_bridge");
    final res = await platform.invokeMethod("buyProduct");
    log(res.toString());
  } catch (e) {
    log(e.toString());
  }
}