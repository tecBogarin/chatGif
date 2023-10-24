import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    final focusNode = FocusNode();
    final textControl = TextEditingController();
    final outLineInputBorder = inputBorderCustom();
    final inputDecoration =
        inputDecoradorCustom(outLineInputBorder, textControl);


  void fieldSubmitCustom(value) {
      // valor al dar submit
       textControl.clear();
      focusNode.requestFocus();
    }

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textControl,
      decoration: inputDecoration,
      onFieldSubmitted: fieldSubmitCustom,
      //onChanged: (value) {
      //valores de tecla por tecla
      //},
    );  
  }


  UnderlineInputBorder inputBorderCustom() {
    return UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
  }

  InputDecoration inputDecoradorCustom(UnderlineInputBorder outLineInputBorder,
      TextEditingController textControl) {
    return InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      filled: true,
      suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            //valor de la caja de texto
            final textValue = textControl.value.text;
             print(textValue);
            textControl.clear();
          }),
    );
  }
}
