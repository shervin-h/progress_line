
<img alt="Flutter" src="https://img.shields.io/badge/Flutter-075898?style=flat-squar&logo=flutter&logoColor=white"/>

<p align="center">
  <img alt="Default Progress Bar" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_default.gif?raw=true">
  <img alt="Progress Bar Example1" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_example1.gif?raw=true">
  <img alt="Progress Bar Example2" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_example2.gif?raw=true">
  <img alt="Progress Bar Example3" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_example3.gif?raw=true">
</p>

# Progress Line

[![pub package](https://img.shields.io/pub/v/progress_line.svg)](https://pub.dev/packages/progress_line)

## Getting started

Use `progress_line` package to display linear charts/graph with dynamic progress percentage by enabling animation.

### Where is it used?

- When you want to display the progress of the file download
- In music or video players
- In applications that display currency and gold rates to the user
- In sports applications that calculate the length of a period of time
- In applications that provide diet to the user
- In educational applications in order to display the student's academic progress
- In store applications in the shopping cart section
- ...

📈 📉 🎛 📱

## Install Package

Add the following line to your `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  progress_line: ^0.1.0
```

Then run:

```
flutter pub get
```

## Usage

Import it

```dart
import 'package:progress_line/progress_line.dart';
```

Now in your flutter code, you can use:

- The `percent` should be between 0.0 and 1.0.
- Feature `lineColors` is nullable. For the color of the progress line,
  you can consider a list of colors. Depending on the `percent` feature, this line can take one of the colors from the list.
  If the progress rate is 0%, the color in zeroth index will be taken,
  and if the progress percentage is 100%, the color of the last index will be taken.
- Animation is enabled by default. You can set a duration for it or disable it.

<p align="center">
    <img alt="Progress Bar Example3" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_example3.gif?raw=true">
</p>

```dart
ProgressLineWidget(
  percent: 0.9,
  lineWidth: 20,
  lineColors: const [
    Colors.purple,
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreenAccent,
    Colors.lightGreen,
    Colors.green,
  ],
  bgColor: Colors.grey.withOpacity(0.4),
  innerPadding: const EdgeInsets.all(20),
  outerPadding: const EdgeInsets.only(left: 16),
  width: 180,
  height: 100,
  animationDuration: const Duration(seconds: 5),
  start: Text(
    (_value * 100).toStringAsFixed(0),
    style: const TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
  ),
  end: Text(
    ((1 - _value) * 100).toStringAsFixed(0),
    style: const TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
  ),
  callback: (value) {
    setState(() {
      _value = value;
    });
  },
)
```

---

By default :
- Progress line Color is `Colors.cyan`
- Background line Color is `Colors.grey.shade200`
- Line width is `10`
- Width of Progress widget is `100`


<p align="center">
    <img alt="Default Progress Bar" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_default.gif?raw=true">
</p>

```dart
ProgressLineWidget(percent: 0.8)
```

---

<p align="center">
    <img alt="Progress Bar Example1" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_example1.gif?raw=true">
</p>

```dart
ProgressLineWidget(
  percent: 0.8,
  lineWidth: 24,
  width: 200,
  lineColors: const [
    Colors.green
  ],
)
```

---

- You can set start and end widgets for the progress bar
- For example, these widgets can be text that shows the progress percentage and the remaining percentage
- You can create space between the progress bar and the widgets around it (start and end widgets) by using the `innerPadding` feature
- You can also set the `outerPadding` attribute to space among the progress bar and other page widgets in widget tree

<p align="center">
    <img alt="Progress Bar Example2" src="https://github.com/shervin-h/progress_bar/blob/main/assets/progress_bar_example2.gif?raw=true">
</p>

```dart
ProgressLineWidget.widgets(
  percent: 0.4,
  lineWidth: 20,
  lineColors: const [Colors.orange],
  bgColor: Colors.orange.withOpacity(0.2),
  innerPadding: const EdgeInsets.symmetric(horizontal: 16),
  outerPadding: const EdgeInsetsDirectional.only(start: 16),
  width: 200,
  start: Text(
    (_value * 100).toStringAsFixed(0),
    style: const TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
  ),
  end: Text(
    ((1 - _value) * 100).toStringAsFixed(0),
    style: const TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
  ),
  callback: (value) {
    setState(() {
      _value = value;
    });
  },
)
```

---

### by Shervin Hassanzadeh

Contact me at
<br>

  <a href="https://www.linkedin.com/in/shervin-hassanzadeh/">
    <img alt="linkedin" src="https://img.shields.io/badge/linkedin-0077B5.svg?style=flat-squar&logo=linkedin&logoColor=white"/>
  </a>
  <a href="mailto:shervin.hz07@gmail.com">
    <img alt="Email" src="https://img.shields.io/badge/Email-D14836?style=flat-squar&logo=gmail&logoColor=white"/>
  </a>
  <a href="https://t.me/shervin_hz07">
    <img alt="telegram" src="https://img.shields.io/badge/Telegram-2B9FD1?style=flat-squar&logo=telegram&logoColor=white" />
  </a>
  <a href="https://github.com/shervin-h">
    <img alt="github" src="https://img.shields.io/badge/github-121011.svg?style=flat-squar&logo=github&logoColor=white"/>
  </a>
  <a href="https://stackoverflow.com/users/13066224/shervin">
    <img alt="stackoverflow" src="https://img.shields.io/badge/Stackoverflow-ef8236?style=flat-squar&logo=stackoverflow&logoColor=white" />
  </a>

<br>
