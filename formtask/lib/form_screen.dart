import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String _name = '';
  String _email = '';
  String _password = '';

  // Validation logic
  bool _validateName() {
    if (_name.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateEmail() {
    if (_email.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(_email)) {
      return false;
    }
    return true;
  }

  bool _validatePassword() {
    if (_password.isEmpty || _password.length < 8) {
      return false;
    }
    return true;
  }

  // Submit the form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Do something with the form data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              validator: _validateName,
              onSaved: (value) => _name = value!,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: _validateEmail,
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: _validatePassword,
              onSaved: (value) => _password = value!,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
