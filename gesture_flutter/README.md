# Gestures

<br>

- [Add Material touch ripples](#Add-Material-touch-ripples)

- [Handles taps](#Handles-taps)

- [Implement swipe to dismiss](#Implement-swipe-to-dismiss)

<br>

## Add Material touch ripples

<kbd>InkWell</kbd> Widget 제공

Tab을 터치시, ripple animation 보여지게 하는 방법

- `Tab` Widget 만들기
- `InkWell` Widget으로 onTab() callback 감싸 ripple animation 관리하기

<br>

~~~dart
// The InkWell wraps the custom flat button widget.
InkWell(
  // When the user taps the button, show a snackbar.
  onTap: () {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Tap'),
    ));
  },
  child: Container(
    padding: EdgeInsets.all(12.0),
    child: Text('Flat Button'),
  ),
);

~~~

<p align="center"><img src="/Image/1.gif" alt="image1" height="500px"/></p>

<br>

## Handle taps

<kbd>GestureDetector</kbd> Widget을 이용하여 탭, 드래그 같은 기본적인 작업 응답할 수 있다.

Tab했을 시, 스낵바를 보여주는 Custom Button 만드는 방법

- `button` 만들기
- `GestureDetector`로 onTab() callback 감싸기

<br>

~~~dart
// The GestureDetector wraps the button.
GestureDetector(
  // When the child is tapped, show a snackbar.
  onTap: () {
    final snackBar = SnackBar(content: Text("Tap"));

    Scaffold.of(context).showSnackBar(snackBar);
  },
  // The custom button
  child: Container(
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Theme.of(context).buttonColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Text('My Button'),
  ),
);

~~~

<p align="center"><img src="/Image/2.gif" alt="image2" height="500px" /></p>

<br>

## Implement swipe to dismiss

<kbd>Dismissible</kbd> widget

<br>

### 1. Create a list of items

문자열 목록 만들기

~~~dart
final items = List<String>.generate(20, (i) => "Item ${i + 1}");
~~~

위에서 만든 items를 보여줄 ListView 만들기 -> 스와이프 불가능 

~~~dart
	ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text('${items[index]}'));
  },
);

~~~

<br>

### 2. Wrap each item in a Dismissible widget

`Dismissible ` Widget 사용하여 목록 스와이프 만들기

- `key` : 고유한 widget 식별하기 위해
- `onDismissed` : 스와이프 후 해야할 작업
- `background` : 스와이프 뒷 배경
- `child` : dismissable이 적용될 Widget 넣어주기

~~~dart
Dismissible(
  // Each Dismissible must contain a Key. Keys allow Flutter to
  // uniquely identify widgets.
  key: Key(item),
  // Provide a function that tells the app
  // what to do after an item has been swiped away.
  onDismissed: (direction) {
    // Remove the item from the data source.
    setState(() {
      items.removeAt(index);
    });

    // Show a snackbar. This snackbar could also contain "Undo" actions.
    Scaffold
        .of(context)
        .showSnackBar(SnackBar(content: Text("$item dismissed")));
  },
  child: ListTile(title: Text('$item')),
);

~~~

<br>

### 3. Provide “leave behind” indicators

~~~dart
Dismissible(
  // Show a red background as the item is swiped away.
  background: Container(color: Colors.red),
  key: Key(item),
  onDismissed: (direction) {
    setState(() {
      items.removeAt(index);
    });

    Scaffold
        .of(context)
        .showSnackBar(SnackBar(content: Text("$item dismissed")));
  },
  child: ListTile(title: Text('$item')),
);

~~~

<p align="center"><img src="/Image/3.gif" alt="image3" height="500px" /></p>

<br>









