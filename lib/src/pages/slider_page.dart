import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              _createSlider(),
              _createCheckBox(),
              _crearSwitch(),
              Expanded(child: _createImg())
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck)
          ? null
          : (value) {
              print(value);
              setState(() {
                _valueSlider = value;
              });
            },
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //     value: _blockCheck,
    //     onChanged: (value) {
    //       setState(() {
    //         _blockCheck = value;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Activar slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Activar slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }

  Widget _createImg() {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/loading.gif',
      image:
          'https://img.fayerwayer.com/sites/9/2021/04/27/0-0/goku-y-goten-800x400.jpg',
      fadeInDuration: Duration(milliseconds: 200),
      // height: 200.0,
      width: _valueSlider,
      fit: BoxFit.contain,
    );
    // Image(
    //   image: NetworkImage(
    //       'https://lasimagenesdegoku.com/wp-content/uploads/2018/02/Small-Goku.png'),
    //   // image: NetworkImage(
    //   //     'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2019/05/dia-goku.jpg'),
    //   width: _valueSlider,
    //   fit: BoxFit.contain,
    // );
  }
}
