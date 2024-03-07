import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Formul(),
    );
  }
}

class Formul extends StatefulWidget {
  const Formul({Key? key}) : super(key: key);

  @override
  State<Formul> createState() => _FormulState();
}

class _FormulState extends State<Formul> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulaire'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'username required';
                  }
                  return null;
                },
              ),
              TextFormField(
                  
                decoration: const InputDecoration(
                  labelText: 'password',
                ),
              obscureText: true,
                validator: (value) {
                 
                  if (value == null || value.isEmpty) {
                    return 'password required';
                  } else if (value.length < 8 || value.length > 15) {
                    return "Password must be between 8 and 15 characters.";
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: const Text('Terms and conditions'),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('validate')),
                      );
                    }
                  },
                  child: const Text('Validate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
