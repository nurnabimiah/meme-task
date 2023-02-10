import 'package:flutter/material.dart';
import 'package:interview_task/screens/detail_screen.dart';
import 'package:provider/provider.dart';
import '../model/memes_model.dart';
import '../providers/mems_provider.dart';
import '../widgets/mems_design_widgets.dart';
import '../widgets/search_textformfiled_inputdecoration.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Mems'),
        actions: [
          SizedBox(
            height: 30,
            width: 250,
            child: TextFormField(
              onTap: () {
                if (searchController.text != '') {
                  _provider!.getMemeNames(searchController.text.trim());
                }
              },
              controller: searchController,
              decoration: search_textformfiled_inputdec(),
            ),
          ),
        ],
      ),
      body: _provider?.memeList != null
          ? Consumer<MemesProvider>(builder: (context, _prover, _) {
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
                      child: MemsDesignWidget(item: item),
                    );
                  });
            })
          : Center(
              child: Text('please wait'),
            ),
    );
  }


}
