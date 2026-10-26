import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Form Application')),
        body: const SafeArea(
          child: SingleChildScrollView(child: RegisterForm()),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final List<TextEditingController> controllers = List.generate(
    7,
    (_) => TextEditingController(),
  );

  TextEditingController get _firstNameController => controllers[0];
  TextEditingController get _lastNameController => controllers[1];
  TextEditingController get _emailController => controllers[2];
  TextEditingController get _phoneController => controllers[3];
  TextEditingController get _usernameController => controllers[4];
  TextEditingController get _passwordController => controllers[5];
  TextEditingController get _confirmPasswordController => controllers[6];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleSubmit() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    debugPrint('''
First Name: ${_firstNameController.text}
Last Name: ${_lastNameController.text}
Email: ${_emailController.text}@mlritm.ac.in
Phone: +91 ${_phoneController.text}
Username: ${_usernameController.text}
Password: ${_passwordController.text}
Confirm Password: ${_confirmPasswordController.text}
''');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration details submitted')),
    );
  }

  void _handleClear() {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 45)),

        CustomTextField(controller: _firstNameController, label: 'First Name'),

        CustomTextField(controller: _lastNameController, label: 'Last Name'),

        CustomTextField(
          controller: _emailController,
          label: 'Email ID',
          suffixText: '@mlritm.ac.in',
        ),

        CustomTextField(
          controller: _phoneController,
          label: 'Mobile Number',
          prefixText: '+91 ',
          keyboardType: TextInputType.phone,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
        ),

        const Divider(indent: 8, endIndent: 8),

        CustomTextField(controller: _usernameController, label: 'Username'),

        CustomTextField(
          controller: _passwordController,
          label: 'Password',
          obscureText: true,
        ),

        CustomTextField(
          controller: _confirmPasswordController,
          label: 'Confirm Password',
          obscureText: true,
          passwordVisibilityToggle: true,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: _handleClear, child: const Text('Clear')),

              const SizedBox(width: 8),

              FilledButton.icon(
                onPressed: _handleSubmit,
                icon: const Icon(Icons.login),
                label: const Text('Register'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixText;
  final String? suffixText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool passwordVisibilityToggle;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.maxLength,
    this.obscureText = false,
    this.passwordVisibilityToggle = false,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
          suffixText: widget.suffixText,
          prefixText: widget.prefixText,
          suffixIcon: widget.obscureText && widget.passwordVisibilityToggle
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
