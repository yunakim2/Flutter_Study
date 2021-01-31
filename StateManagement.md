# State Management

<br>

- [State](#State)
- [StatelessWidget / StatefulWidget](#StatelessWidget-/-StatefulWidget)
- [State Management 필요한 이유](#State-Management-필요한-이유)
- [State Management 하기](#State-Management-하기)

<br>

## State

<kbd>Data</kbd> 역할

UI를 통해 사용자에게 보여주는 Data, 사용자와 상호작용하면서 변화하는 Data, 내부적으로만 사용하는 Data

<br>

## StatelessWidget / StatefulWidget

모든 UI 요소들의 <kbd>Widget</kbd>

<br>

### StatelessWidget

내부적으로 상태를 갖는다, 단 State가 Immutable(변경할 수 없는 상태를 가지는) Widget

constructor 👉🏻 build

<br>

### StatefulWidget

mutable(변경 가능한 상태를 가지는) Widget

constructor 👉🏻 createState

<br>

### State 생명주기

*create* 

👇🏻

**initState**

👇🏻

*dirty*

👇🏻

**build**

👇🏻

*clean* ***(👉🏻 setState 👉🏻 dirty 👉🏻 build)*** / ***(👉🏻 didUpdateConfig 👉🏻 dirty 👉🏻  build)***

👇🏻

**dispose**

👇🏻

*defunct*

<br>

> setState 호출로 인해 내부적으로 상태가 변화했을때
>
> *clean* ***(👉🏻 setState 👉🏻 dirty 👉🏻 build)***

<br>

> State object가 다시 build 하는 경우 configuration 바뀔때 
>
> *clean* ***(👉🏻 didUpdateConfig 👉🏻 dirty 👉🏻  build)***

<br>

## State Management 필요한 이유

복잡한 widget tree 구조를 가질때 구조상 동떨어진 widget 끼리 통신을 필요할때 상태관리 필요!



- Code를 Understandable, Readable, Maintainable하게 작성 할 수 있는가?
- Testing이 가능한가?
- 성능이 잘 나오는가?

🔥 setState 만으로 Application이 위의 조건을 모두 만족할 수 없기 때문에 State 패키지 필요!

<br>

## State Management 하기

- **InheritedWidget** 

  상태관리를 위한 기본적인 Widget

  상태의 변경에 따라 상태의 변경에 대한 알림을 하위 위젯들에게 할지말지 결정 하는 위젯

  `TemeWidget`, `MediaQuery Widget`등을 통해 **(위젯이름).of() 형태**로 상태 참조할때 사용됨

  > .of() 형태로 호출될 시 .of메소드가 존재하는 위젯들의 build context에 대해 다시 build하게 됨
  >
  > 상태관리에 대해서는 `InheritedWidget`을 감싼 하위 위젯만 가능하다!

  <br>

- **Scoped Model**

   `InheritedWidget`을 이용해서 만든 패키지이며, 사실 `Provider`가 이미 있는 이상, 사용해야하는 이유 XX

  - 사용방법

   `pubspec.yaml`

  ```dart
  dependencies:
    ...
    scoped_model: ^1.0.1
  ```

<br>

- **Provider**

  `Provider` 패키지는 `InheritedWidget`의 syntax sugar에 가까우며, 작성해야 하는 코드를 훨씬 간결하게 만들어줌

  - 사용방법

  `pubspec.yaml`

  ~~~dart
  dependencies:
    ...
    provider: ^3.0.0+1
  ~~~

  1. `Provider.of<Model>(context)` -> InheritedWidget과 유사
  2. `Consumer<Model>(builder : …)` -> .of 메소드 호출시 rebuild되는 것 피하기위해

