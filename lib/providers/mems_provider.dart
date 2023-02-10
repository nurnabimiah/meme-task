

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/memes_model.dart';

class MemesProvider extends ChangeNotifier{

  FetchMemsDataModel ? fetchMemsDataModel;
  //bool get hasDataLoaded => fetchMemsDataModel!=null;
  List<Memes> _memeList = [];
  List<Memes> get memeList => _memeList;
  //List _nameList = [];
 // List get nameList => _nameList;
 // fetchMemsDataModel!.data!.memes?.length

  void getMemeNames(String name){
    print("0.........................");
    _memeList.clear();
    notifyListeners();
    print("p.........................${name}");
    //Drake Hotline Bling
    //_memeList.addAll(fetchMemsDataModel!.data!.meme
    for(int i=0; i<fetchMemsDataModel!.data!.memes!.length; i++){
    //  rubi.compareTo(ore) == 0;
      if(fetchMemsDataModel!.data!.memes![i].name!.compareTo(name) == 0){
        print("p2.........................${fetchMemsDataModel!.data!.memes![i].name}");
        _memeList.add(fetchMemsDataModel!.data!.memes![i]);
      //  notifyListeners();
      }
     // print("p3.........................${fetchMemsDataModel!.data!.memes![i].name}");
    }
    print("p3.........................${_memeList.length}");
    notifyListeners();
  }

  void getData() async{
    final url = 'https://api.imgflip.com/get_memes';
    try {
      final respone = await get(Uri.parse(url));
      final map = json.decode(respone.body);
      fetchMemsDataModel = FetchMemsDataModel.fromJson(map);
      _memeList.addAll(fetchMemsDataModel!.data!.memes!);
      // _memeList.forEach((element) {
      //   _nameList.add(element.name);
      // });
      //fetchMemsDataModel.data.memes.forEach((element) { })
      notifyListeners();
    }catch(error){
      print(error.toString());
      throw error;
    }


  }



}