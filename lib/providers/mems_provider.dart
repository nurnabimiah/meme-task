

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview_task/network_services/urls.dart';

import '../model/memes_model.dart';

class MemesProvider extends ChangeNotifier{

  FetchMemsDataModel ? fetchMemsDataModel;
  List<Memes> _memeList = [];
  List<Memes> get memeList => _memeList;



  /*
  * locally  data search
  *
  * */

  void getMemeNames(String name){
    _memeList.clear();
    notifyListeners();
     //print("p.........................${name}");
    //_memeList.addAll(fetchMemsDataModel!.data!.meme
    for(int i=0; i<fetchMemsDataModel!.data!.memes!.length; i++){
      if(fetchMemsDataModel!.data!.memes![i].name!.compareTo(name) == 0){
        print("p2.........................${fetchMemsDataModel!.data!.memes![i].name}");
        _memeList.add(fetchMemsDataModel!.data!.memes![i]);
      }
     // print("p3.........................${fetchMemsDataModel!.data!.memes![i].name}");
    }
    notifyListeners();
  }





  /*
  * Api call here
  *using provider state management
  *
  * */
  void getData() async{
    final url = Urls.fetchData;
    try {
      final respone = await get(Uri.parse(url));
      final map = json.decode(respone.body);
      fetchMemsDataModel = FetchMemsDataModel.fromJson(map);
      _memeList.addAll(fetchMemsDataModel!.data!.memes!);
      notifyListeners();
    }catch(error){
      print(error.toString());
      throw error;
    }


  }



}