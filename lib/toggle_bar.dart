library toggle_bar;

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleBar extends StatefulWidget {
  final Color backgroundColor, selectedTabColor, selectedTextColor, textColor;
  final List<String> labels;
  final Function(int) onSelectionUpdated;

  ToggleBar(
      {@required this.labels,
      this.backgroundColor = Colors.black,
      this.selectedTabColor = Colors.deepPurple,
      this.selectedTextColor = Colors.white,
      this.textColor = Colors.white,
      this.onSelectionUpdated});

  @override
  State<StatefulWidget> createState() {
    return _ToggleBarState();
  }
}

class _ToggleBarState extends State<ToggleBar> {
  LinkedHashMap<String, bool> _hashMap = LinkedHashMap();
  int _selectedIndex = 0;

  @override
  void initState() {
    _hashMap = LinkedHashMap.fromIterable(widget.labels,
        value: (value) => value = false);
    _hashMap[widget.labels[0]] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(50)),
        child: ListView.builder(
          itemCount: widget.labels.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: Container(
                    width: (MediaQuery.of(context).size.width - 32) /
                        widget.labels.length,
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                    child: Text(
                      _hashMap.keys.elementAt(index),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _hashMap.values.elementAt(index)
                              ? widget.selectedTextColor
                              : widget.textColor),
                    ),
                    decoration: BoxDecoration(
                        color: _hashMap.values.elementAt(index)
                            ? widget.selectedTabColor
                            : null,
                        borderRadius: BorderRadius.circular(50))),
                onHorizontalDragUpdate: (dragUpdate) async {
                  int calculatedIndex = ((widget.labels.length *
                                  (dragUpdate.globalPosition.dx /
                                      (MediaQuery.of(context).size.width - 32)))
                              .round() -
                          1)
                      .clamp(0, 6);

                  if (calculatedIndex != _selectedIndex) {
                    _updateSelection(calculatedIndex);
                  }
                },
                onTap: () async {
                  if (index != _selectedIndex) {
                    _updateSelection(index);
                  }
                });
          },
        ));
  }

  _updateSelection(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onSelectionUpdated(_selectedIndex);
      _hashMap.updateAll((label, selected) => selected = false);
      _hashMap[_hashMap.keys.elementAt(index)] = true;
    });
  }
}
