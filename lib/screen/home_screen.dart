import 'dart:typed_data';
import 'package:color_filter/core/text_field_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double size = 150;
  late Uint8List rgbByte;
  List<String> color = [];
  late int color1;
  TextEditingController oController = TextEditingController();
  TextEditingController rController = TextEditingController();
  TextEditingController gController = TextEditingController();
  TextEditingController bController = TextEditingController();

  @override
  void initState() {
    super.initState();
    oController.text = 'FF';
    rController.text = '80';
    gController.text = 'AE';
    bController.text = '00';
    rgbColor();
    color1 = int.parse('0x${oController.text}${colorFilter()}');
  }

  void rgbColor() {
    rgbByte = Uint8List.fromList([
      int.parse('0x${rController.text}'),
      int.parse('0x${gController.text}'),
      int.parse('0x${bController.text}')
    ]);
  }

  String colorFilter() {
    color.clear();
    for (int i = 0; i < rgbByte.length; i++) {
      if (i == 0) {
        color.add((rgbByte[0] >> 4).toRadixString(16).padLeft(2, '0'));
      } else if (i == 1) {
        color.add((rgbByte[1] ^ rgbByte[0]).toRadixString(16).padLeft(2, '0'));
      } else if (i == 2) {
        color.add(((rgbByte[2] | 0x2f) ^ rgbByte[1]).toRadixString(16).padLeft(2, '0'));
      }
    }
    return color.join();
  }

  String hexColor() {
    List<String> a = [];
    a.clear();
    for(var e in rgbByte){
      if(e == 00){
        a.add(e.toRadixString(16).padLeft(2, '0'));
      }else if('$e'[0] == '0'){
        a.add(e.toRadixString(16).padLeft(2, '0'));
      }else if('$e'[1] == '0'){
        a.add(e.toRadixString(16).padRight(2, '0'));
      }else{
        a.add(e.toRadixString(16));
      }
    }
    return a.join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size,
              width: size,
              decoration: ShapeDecoration(
                color: Color(int.parse('0x${oController.text}${hexColor()}')),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.grey)

                ),
              ),
            ),
            Text('0x${oController.text.toUpperCase()}${hexColor()}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                TextFieldWidget(
                  controller: oController,
                  type: 'Opacity',
                ),
                TextFieldWidget(
                  controller: rController,
                  type: 'R',
                ),
                TextFieldWidget(
                  controller: gController,
                  type: 'G',
                ),
                TextFieldWidget(
                  controller: bController,
                  type: 'B',
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  rgbColor();
                  colorFilter();
                  color1 = int.parse('0x${oController.text}${colorFilter()}');
                });
              },
              child: const Text('Apply'),
            ),
            Container(
                height: size,
                width: size,
                decoration: ShapeDecoration(
                  color: Color(color1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.grey)
                  ),

                )),
            Text('0x${color1.toRadixString(16).toUpperCase()}')
          ],
        ),
      ),
    );
  }


}
