import 'package:flutter/material.dart';

import '../model/memes_model.dart';

class MemsDesignWidget extends StatelessWidget {
  const MemsDesignWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Memes? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.teal),
          shape: BoxShape.rectangle),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FittedBox(
                child: Text(
                  item?.name! ?? 'Unknown data',
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),
                )),
          ),
          const SizedBox(
            height: 18,
          ),
          Image.network(
            item?.url! ?? 'Unloades Data',
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}