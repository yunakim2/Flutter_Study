# image_flutter

<br>

- [Display images from the internet](#Display-images-from-the-internet)

- [Fade in images with a placeholder](#Fade-in-images-with-a-placeholder)
- [Work with cached images](#Work-with-cached-images)

<br>

## Display images from the internet

- `Image.network()` : Image URL로 바로 생성하기 (GIF 지원)

  단, 이미지 FadeIn, 기기에 이미지 다운로드(캐싱) 지원 X

  ~~~dart
  Image.network('https://picsum.photos/250?image=9')
  ~~~

<p align="center"><img src="./Image/6.png" alt="Register" height="500px" /></p>

<br>

## Fade in images with a placeholder

<kbd>FadeInImage</kbd>Widget으로 FadeIn 제공

- `FadeInImage`는 모든 유형의 이미지 (인 메모리, 로컬 자산 또는 인터넷의 이미지)와 함께 작동합니다.

<br>

### In - Memory

~~~dart
FadeInImage.memoryNetwork(
  placeholder: kTransparentImage,
  image: 'https://picsum.photos/250?image=9',
);

~~~

<br>

**import 'package:trans/transparent_image.dart'; 사용하기**

https://pub.dev/packages/transparent_image/install

<p align="center"><img src="./Image/4.gif" alt="Register" height="500px" /></p>

<br>

### From asset bundle

- ` pubspec.yaml` 파일에 asset 추가하기

  ~~~dart
   flutter:
     assets:
  +    - assets/loading.gif
  
  ~~~

- `FadeInImage.assetNetwork()` 사용하기

  ~~~dart
  FadeInImage.assetNetwork(
    placeholder: 'assets/loading.gif',
    image: 'https://picsum.photos/250?image=9',
  );
  
  ~~~

<br>

## Work with cached images

cached images 사용하려면 <kbd>cached_network_image</kbd> package 제공

그밖에 fading image (loading 전 이미지), placeholders 제공

~~~dart
CachedNetworkImage(
  imageUrl: 'https://picsum.photos/250?image=9',
);
~~~

<br>

### Adding a placeholder

placeholder를 추가하여 imageloading 전 스피너 추가할 수 있다.

~~~dart
CachedNetworkImage(
  placeholder: (context, url) => CircularProgressIndicator(),
  imageUrl: 'https://picsum.photos/250?image=9',
);	
~~~

<br>

**import 'package:cached_network_image/cached_network_image.dart'; 사용하기**

https://pub.dev/packages/cached_network_image/install

<p align="center"><img src="./Image/7.gif" alt="Register" height="500px" /></p>

<br>