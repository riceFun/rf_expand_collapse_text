
# rf_expand_collapse_text
可以展开收起的Text,支持多种情况

this is the expand or collapsed text and support multiple situations
- pub: [rf_expand_collapse_text](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/ae3e46bc2e1844adbebc7f3add022527~tplv-k3u1fbpfcp-zoom-1.image)
- github: [rf_expand_collapse_text](https://github.com/riceFun/rf_expand_collapse_text)
## 安装 install
```
rf_expand_collapse_text: ^0.0.1
```
## 演示 Demo
![rf_text.gif](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a40f01b18ec94af0b9048aa9bf5f46b2~tplv-k3u1fbpfcp-watermark.image?)
## 接口一览 Interface Glance
```
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
```

## 使用 how to use
- 基本功能[basic]
```
Container(
  margin: margin_bottom,
  padding: padding,
  color: Colors.grey[400],
  child: RFExpandCollapseText(
    text: text,
    textStyle: const TextStyle(color: Colors.black,fontSize: 18),
    expandStr: '展开',
    collapseStr: '收起',
    expandOrCollapseStyle: const TextStyle(color: Colors.blue,fontSize: 18),
    maxLines: 2,
  ),
),
```
- 自定义折行数[custom maxLines]
```
Container(
  margin: margin_bottom,
  padding: padding,
  color: Colors.grey[400],
  child: RFExpandCollapseText(
    text: text,
    textStyle: const TextStyle(color: Colors.black,fontSize: 18),
    expandStr: '展开',
    collapseStr: '收起',
    expandOrCollapseStyle: const TextStyle(color: Colors.blue,fontSize: 18),
    maxLines: 3,
  ),
),
```
- 自定义动作文字[custom action title]
```
Container(
  margin: margin_bottom,
  padding: padding,
  color: Colors.grey[400],
  child: RFExpandCollapseText(
    text: text,
    textStyle: const TextStyle(color: Colors.black,fontSize: 18),
    expandStr: 'show more',
    collapseStr: 'close more',
    expandOrCollapseStyle: const TextStyle(color: Colors.blue,fontSize: 18),
    maxLines: 2,
  ),
),
```
- 全局文字点击事件响应[all text respone]
```
Container(
  margin: margin_bottom,
  padding: padding,
  color: Colors.grey[400],
  child: RFExpandCollapseText(
    text: text,
    textStyle: const TextStyle(color: Colors.black,fontSize: 18),
    expandStr: '展开',
    collapseStr: '收起',
    expandOrCollapseStyle: const TextStyle(color: Colors.blue,fontSize: 18),
    maxLines: 2,
    isResponeAllText: true,
  ),
),
```
- 自定义展开状态[custom expand or collapse]
```
Container(
  margin: margin_bottom,
  padding: padding,
  color: Colors.grey[400],
  child: RFExpandCollapseText(
    text: text,
    textStyle: const TextStyle(color: Colors.black,fontSize: 18),
    expandStr: '展开',
    collapseStr: '收起',
    expandOrCollapseStyle: const TextStyle(color: Colors.blue,fontSize: 18),
    maxLines: 2,
    isExpanding: false,
  ),
),
```
- 没有超出,不需要折行[not overflow]
```
Container(
  margin: margin_bottom,
  padding: padding,
  color: Colors.grey[400],
  child: const RFExpandCollapseText(
    text: '没有超出规定行数,不需要.没有超出规定行数,不需要这行展示',
    textStyle: TextStyle(color: Colors.black,fontSize: 18),
    expandStr: '展开',
    collapseStr: '收起',
    expandOrCollapseStyle: TextStyle(color: Colors.blue,fontSize: 18),
    maxLines: 2,
  ),
),
```

## 原理 principle
- 使用`LayoutBuilder`获取当前widget所能提供的最大宽度
- 使用`TextPainter`计算是否超出规定的行数
- 使用`RichText`拼接展示

> 其他请看github源码 ==> [rf_expand_collapse_text](https://github.com/riceFun/rf_expand_collapse_text)

## 拓展 extend
仿iOS group tableview -- [rf_section_listview](https://pub.flutter-io.cn/packages/rf_section_listview)，