library rf_expand_collapse_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 展开收起text
class RFExpandCollapseText extends StatefulWidget {
  const RFExpandCollapseText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.expandStr,
    required this.collapseStr,
    required this.expandOrCollapseStyle,
    this.maxLines = 2,
    this.isExpanding,
    this.onChangeExpandStatus,
    this.isResponeAllText,
  }) : super(key: key);

  final String text;
  final TextStyle textStyle;
  final String expandStr;//展开
  final String collapseStr;//收起
  final TextStyle expandOrCollapseStyle;
  final int? maxLines;//默认2行
  final bool? isExpanding; //初始是否 展开还是收起
  final ValueChanged<bool>? onChangeExpandStatus;//通知外面当前展开还是收起的状态
  final bool? isResponeAllText;//是否所有文本都响应展开或收起操作

  @override
  State<RFExpandCollapseText> createState() => _RFExpandCollapseTextState();
}

class _RFExpandCollapseTextState extends State<RFExpandCollapseText> {
  bool isExpanding = true;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.isExpanding != null) {
      isExpanding = widget.isExpanding!;
    }
    super.initState();
  }

  //是否超出了最大行
  bool _isTextExceedMaxLines(
      String text, TextStyle textStyle, int maxLine, double maxWidth) {
    TextSpan textSpan = TextSpan(text: text, style: textStyle);
    TextPainter textPainter = TextPainter(
        text: textSpan, maxLines: maxLine, textDirection: TextDirection.ltr);
    textPainter.layout(maxWidth: maxWidth);
    if (textPainter.didExceedMaxLines) {
      return true;
    }
    return false;
  }

  //时间复杂度O(n),这个还可以优化,
  String _willDisplayText(String text,double maxWidth) {
    for (var i = 0; i < text.length; i++) {
      String subStr = '${text.substring(0,i)}...${widget.expandStr}';
      if (_isTextExceedMaxLines(subStr, widget.textStyle, widget.maxLines!, maxWidth) == false) {
        continue;
      } else {
        //肯定会有值
        return '${text.substring(0,i-1)}...';
      }
    }
    return '';
  }

  void _changeStatus() {
    setState(() {
      isExpanding = !isExpanding;
      if (widget.onChangeExpandStatus != null) {
        widget.onChangeExpandStatus!(isExpanding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      // print('constraints: $constraints');
      //是否超过规定行数
      bool isTextExceed =
      _isTextExceedMaxLines(widget.text, widget.textStyle, widget.maxLines!, constraints.maxWidth);
      //超过规定行数了 要显示展开按钮
      if (isTextExceed) {
        if (isExpanding) {
          return GestureDetector(
            onTap: () {
              if (widget.isResponeAllText != null && widget.isResponeAllText! == true) {
                _changeStatus();
              }
            },
            child: RichText(
              text: TextSpan(
                  text: _willDisplayText(widget.text,constraints.maxWidth),
                  style: widget.textStyle,
                  children: [
                    TextSpan(
                        text: widget.expandStr,
                        style: widget.expandOrCollapseStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _changeStatus();
                          }),
                  ]),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              _changeStatus();
            },
            child: RichText(
              text: TextSpan(
                  text: widget.text,
                  style: widget.textStyle,
                  children: [
                    TextSpan(
                        text: widget.collapseStr,
                        style: widget.expandOrCollapseStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _changeStatus();
                          }),
                  ]),
            ),
          );
        }
      } else {//不超过规定行数，直接全部显示
        return Text(widget.text,style: widget.textStyle,);
      }
    },);
  }
}
