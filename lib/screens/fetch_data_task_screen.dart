import 'package:flutter/material.dart';
import 'package:interview_task/screens/detail_screen.dart';
import 'package:provider/provider.dart';

import '../model/memes_model.dart';

import '../providers/mems_provider.dart';

class FetchDataScreen extends StatefulWidget {
  static const String routeName = '/fetach_dataScreen';
  const FetchDataScreen({Key? key}) : super(key: key);

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  FetchMemsDataModel? _fetchMemsDataModel;
  late MemesProvider? _provider;
  bool _isInit = true;
  TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _provider = Provider.of<MemesProvider>(context);
      _provider?.getData();
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print(_fetchMemsDataModel?.data?.memes?.length);
    return Scaffold(
      appBar: AppBar(
        //title: Text('Mems Data'),
        //centerTitle: true,
        actions: [
          SizedBox(
            height: 30,
            width: 300,
            child: TextFormField(

              onTap: (){
               // print("s1........88");
                if(searchController.text != ''){
                 // print("s1........8");
                  print("s1........${searchController.text}");
                  _provider!.getMemeNames(searchController.text.trim());
                }
                /*if(searchController.text == ''){
                  // _productProvider.result.clear();
                  // customOffset = 0;
                  // _productProvider.getData('rice', 0);
                  //return;
                }*/
              },
              controller: searchController,
              decoration:  InputDecoration(

                contentPadding:
                EdgeInsets.only(top: 0, bottom: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                suffixIcon:  Align(
                  widthFactor: 0.5,
                  //heightFactor: 5.0,
                  child: Icon(
                  Icons.search,
                ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "    search products",
                hintStyle: TextStyle(

                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _provider?.memeList != null
          ? Consumer<MemesProvider>(
            builder: (context, _prover, _) {
              return ListView.builder(
                  itemCount: _provider?.memeList.length,
                  itemBuilder: (context, index) {
                    final item = _provider?.memeList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScren(
                                    memes: item,
                                  )),
                        );
                      },
                      child: Container(
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
                      ),
                    );
                  });
            }
          )
          : Center(
              child: Text('please wait'),
            ),
    );
  }
}


