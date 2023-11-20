import 'package:flutter/material.dart';

class SettingsItemsModel {
  final Widget image;
  final String title, description;
  final Function()? function;

  SettingsItemsModel({
    required this.image,
    required this.title,
    required this.description,
    this.function,
  });
}
