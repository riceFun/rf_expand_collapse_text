# rf_expand_collapse_text
可展开收起的text

## 使用
```dart
Container(
  padding: EdgeInsets.only(
      left: kScale(7),
      right: kScale(7),
      top: kScale(8),
      bottom: kScale(8)),
  width: double.infinity,
  child: ExpandCollapseText(
    text: messageStr,
    textStyle: messageTextStyle,
    expandStr: '展开',
    collapseStr: '收起',
    expandOrCollapseStyle: expandCollapseTextStyle,
    isResponeAllText: true,
    onChangeExpandStatus: (bool isExpanding) {
      print(isExpanding);
    },
  ),
),
```