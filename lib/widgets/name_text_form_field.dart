import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameTextFormField extends StatelessWidget {
  final TextEditingController? nameController;
  const NameTextFormField({@required this.nameController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.none,
      maxLength: 50,
      maxLines: null,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.grey.shade800,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[A-Za-z ]'),
        ),
      ],
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: "Name",
        hintStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.grey.shade800,
        ),
        labelText: "",
        labelStyle: TextStyle(color: Colors.grey.shade800),
      ),
      onTap: () {},
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Name is required";
        } else if (value.length < 8) {
          return "Name length should be at list 6";
        }
        return null;
      },
    );
  }
}
