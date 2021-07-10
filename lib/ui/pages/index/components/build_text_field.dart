import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class BuildTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final ValidatorMap? rules;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const BuildTextField({Key? key, required this.label, required this.placeholder, this.rules, this.obscureText = false, this.keyboardType, this.onChanged,}) : super(key: key);

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  String _errorText = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0.px, vertical: 52.0.px),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color(0xffd8d8d8),
                width: 2.0.px
            )
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 275.0.px,
            child: Text(widget.label, style: TextStyle(fontSize: 50.0.px),),
          ),
          Expanded(
            child: TextField(
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: TextStyle(color: Color(0xffa6a6a6)),
                errorText: _errorText == '' ? null : _errorText,
                contentPadding: EdgeInsets.all(0.0),
                isCollapsed: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(
                fontSize: 50.0.px,
              ),
              onChanged: (String value) {
                setState(() {
                  _errorText = '';
                });
                widget.onChanged!(value);
                if (widget.rules == null) return;
                if (widget.rules is ValidatorMap) {
                  try {
                    widget.rules!.validator(value);
                  } catch(e) {
                    setState(() {
                      _errorText = e.toString();
                    });
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ValidatorMap {
  ValueChanged<String> validator;
  ValidatorMap(this.validator);
}
