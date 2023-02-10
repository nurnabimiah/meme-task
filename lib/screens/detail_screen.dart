import 'package:flutter/material.dart';

import '../model/memes_model.dart';

class DetailScren extends StatefulWidget {
  Memes? memes;
  static const String routeName = '/detailScreen';
   DetailScren({Key? key, this.memes}) : super(key: key);

  @override
  State<DetailScren> createState() => _DetailScrenState();
}

class _DetailScrenState extends State<DetailScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey,
              floating: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                //title: Text(widget.memes!.name.toString(),style: TextStyle(color: Colors.black),),
                /*title: ListTile(
                  trailing: TextButton(onPressed: () {  },
                  child: Text('Edit'),),
                ),*/
                background: Hero(
                  tag: widget.memes!.id.toString(),
                  child: FittedBox(child: Image.network(widget.memes!.url.toString(),)),

                ),
              ),

            ),
            SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListTile(
                      title: Text(widget.memes!.name.toString(),style: TextStyle(fontSize: 26),),
                      trailing: Text(widget.memes!.captions.toString(),style: TextStyle(fontSize: 26),) ,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Height : ${widget.memes!.height.toString()}',style: TextStyle(fontSize: 22)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Width : ${widget.memes!.width.toString()}',style: TextStyle(fontSize: 22)),
                    ),
                  ],
                ) )
          ],
        ),
      )



      /*body: Container(
        child: Text(widget.memes!.name.toString()),
      ),*/
    );
  }
}
