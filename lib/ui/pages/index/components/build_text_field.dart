import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class BuildTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Widget? child;
  final Widget? rightWidget;

  const
  BuildTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.child,
    this.rightWidget
  }) : super(key: key);

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0.px, vertical: 52.0.px),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
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
                  child: TextFormField(
                    controller: widget.controller,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      hintStyle: TextStyle(color: Color(0xffa6a6a6)),
                      contentPadding: EdgeInsets.all(0.0),
                      isCollapsed: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 50.0.px,
                    ),
                    validator: widget.validator,
                    onChanged: widget.onChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.rightWidget != null) widget.rightWidget!,
      ],
    );
  }
}
