import 'package:flutter/material.dart';

void customSnackbar(BuildContext context,String msg)
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(msg)));
}