

import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.title,
    required this.shopName,
  }) : super(key: key);

  final String title, shopName;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(shopName),
    );
  }
}