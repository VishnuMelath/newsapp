import 'package:flutter/material.dart';

Widget loadingWidget()
{
  return const Center(child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator())); 
}