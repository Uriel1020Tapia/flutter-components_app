import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _pass = '';
  String _fecha = '';
  String _optionSelected = '--Seleccionar--';

  List<String> _poderes = [
    '--Seleccionar--',
    'Volar',
    'Rayos X',
    'Super Aleinto'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInput(),
          Divider(),
          _inputEmail(),
          Divider(),
          _inputPassword(),
          Divider(),
          _createPerson(),
          Divider(),
          _inputDate(context),
          Divider(),
          _createDropDown()
        ],
      ),
    );
  }

  _createInput() {
    return TextField(
      // autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          counter: Text('Letras ${_name.length}'),
          hintText: 'Name person',
          labelText: 'Name',
          helperText: 'Sólo es el name',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.access_alarm_outlined)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Me name is $_name'),
      subtitle: Text('Email: $_email -pass: $_pass'),
      trailing: Text(_optionSelected),
    );
  }

  Widget _inputEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'email@mail.com',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  _inputPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)),
        onChanged: (value) => setState(() {
              _pass = value;
            }));
  }

  _inputDate(context) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      // locale: Locale('es', 'Es')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];
    _poderes.forEach((poder) {
      list.add(DropdownMenuItem(child: Text(poder), value: poder));
    });

    return list;
  }

  Widget _createDropDown() {
    return Row(children: [
      Icon(Icons.select_all),
      SizedBox(width: 20.0),
      Expanded(
        child: DropdownButton(
          value: _optionSelected,
          items: getOptionsDropdown(),
          onChanged: (opt) {
            setState(() {
              _optionSelected = opt;
            });
          },
        ),
      )
    ]);
  }
}
