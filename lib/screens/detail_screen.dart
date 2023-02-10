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
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.rotate_90_degrees_ccw),color: Colors.indigoAccent,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.crop),color: Colors.indigoAccent,),
                  ],
                ),
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
                      title: Text(widget.memes!.name.toString(),style: TextStyle(fontSize: 26,color: Colors.green),),
                      trailing: Text('Count: ${widget.memes!.boxCount.toString()}',style: TextStyle(fontSize: 26,color: Colors.red)) ,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Height : ${widget.memes!.height.toString()}',style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10,),
                          Text('Width : ${widget.memes!.width.toString()}',style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    )
                  ],
                ) )
          ],
        ),
      )

    );
  }
}
