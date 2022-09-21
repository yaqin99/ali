import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

abstract class Services {
  static getDataAir() async {
    try {
      var data =
          await Dio().get('https://api.kampungmelonnapote.co.id/api/air');
      return data.data[0];
    } catch (e) {}
  }

  static getDataNutrisi() async {
    try {
      var data =
          await Dio().get('https://api.kampungmelonnapote.co.id/api/nutrisi');
      return data.data[0];
    } catch (e) {}
  }

  static getDataSiram() async {
    try {
      var data =
          await Dio().get('https://api.kampungmelonnapote.co.id/api/siram/air');
      return data.data[0];
    } catch (e) {}
  }

  static getDataSiramNutrisi() async {
    try {
      var data = await Dio()
          .get('https://api.kampungmelonnapote.co.id/api/siram/nutrisi');
      return data.data[0];
    } catch (e) {}
  }

  static getStatusPenyiraman() async {
    try {
      var data = await Dio()
          .get('https://api.kampungmelonnapote.co.id/api/siram/air/cek');
      return data.data[0];
    } catch (e) {}
  }

  static getStatusPenyiramanNutrisi() async {
    try {
      var data = await Dio()
          .get('https://api.kampungmelonnapote.co.id/api/siram/nutrisi/cek');
      return data.data[0];
    } catch (e) {}
  }
}
