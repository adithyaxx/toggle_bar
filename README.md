# toggle_bar

[![pub package](https://img.shields.io/pub/v/toggle_bar.svg)](https://pub.dartlang.org/packages/toggle_bar) [![Build Status](https://travis-ci.com/adithyaxx/toggle_bar.svg?branch=master)](https://travis-ci.com/adithyaxx/toggle_bar)

A dart package to display a horizontal bar of customisable toggle tabs. Supports iOS and Android.

<img src="https://raw.githubusercontent.com/adithyaxx/toggle_bar/master/demo.gif" height="512">

## Installation
Depend on it.
``` dart
dependencies:
  toggle_bar: ^1.1.0
```

## Usage
``` yaml
import 'package:toggle_bar/toggle_bar.dart';

ToggleBar(
  labels: ["Apples", "Bananas", "Oranges", "Watermelons"],
  onSelectionUpdated: (index) => // Do something with index
  )
```

## Parameters
```dart 
@required List<String> labels;
Color backgroundColor;
Color selectedTabColor;
Color selectedTextColor;
Color textColor;
BoxBorder backgroundBorder;
TextStyle labelTextStyle;
Function(int) onSelectionUpdated;
```
