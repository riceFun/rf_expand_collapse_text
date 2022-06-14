## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage
```dart
Container(
padding: EdgeInsets.only(
left: kScale(7),
right: kScale(7),
top: kScale(8),
bottom: kScale(8)),
margin: EdgeInsets.only(bottom: kScale(10)),
width: double.infinity,
decoration: BoxDecoration(
color: kColorHexStr('#F7F8FA'),
borderRadius:
const BorderRadius.all(Radius.circular(4.0)),
),
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

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
