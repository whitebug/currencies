import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({
    this.currencies = const ['No value'],
    super.key,
  });

  final List<String>? currencies;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String? dropdownValue;


  @override
  void initState() {
    super.initState();
    dropdownValue = widget.currencies?.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
        });
      },
      items: widget.currencies?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
