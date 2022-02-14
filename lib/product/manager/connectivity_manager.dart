// ignore_for_file: avoid_print

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityManager with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  bool? _isOnline;
  bool? get isOnline => _isOnline;

  void startConnectivity() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          _isOnline = isConnected;
          notifyListeners();
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        _isOnline = true;
        notifyListeners();
      }
    } on PlatformException catch (exception) {
      print('Platform exception: $exception');
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected = true;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }
}
