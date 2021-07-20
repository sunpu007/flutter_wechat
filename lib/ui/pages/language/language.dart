import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/language_model.dart';
import 'package:flutter_wechat/core/services/json_parse.dart';
import 'package:flutter_wechat/core/viewmodel/app_view_model.dart';
import 'package:flutter_wechat/generated/l10n.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  static const String routerName = '/language';

  const LanguagePage({ Key? key }) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  List<LanguageModel> _languages = [];

  @override
  void initState() {
    super.initState();
    JsonParse.getLanguagesData().then((res) {
      setState(() {
        _languages = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: AppBar(
          title: Text(S.of(context).language),
        ),
      ),
      body: Consumer<AppViewModel>(
        builder: (ctx, appVM, child) {
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(43.0.px, 0, 0, 0),
            itemCount: _languages.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xffd8d8d8),
                      width: 2.0.px,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(_languages[index].countryName.toString()),
                  trailing: appVM.languageCode == _languages[index].languageCode ? Icon(Icons.done, color: Colors.red,) : null,
                  onTap: () {
                    appVM.languageCode = _languages[index].languageCode!;
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}