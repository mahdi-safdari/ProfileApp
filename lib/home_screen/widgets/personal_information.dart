import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationUser extends StatefulWidget {
  const InformationUser({super.key});

  @override
  State<InformationUser> createState() => _InformationUserState();
}

class _InformationUserState extends State<InformationUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
      child: Column(
        children: [
          _TextFormFieldGenerator(
            controller: _emailController,
            hintText: 'Email',
            prefixIcon: CupertinoIcons.at,
          ),
          const SizedBox(height: 12),
          _TextFormFieldGenerator(
            controller: _passwordController,
            hintText: 'Password',
            prefixIcon: CupertinoIcons.lock,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // backgroundColor: Theme.of(context).primaryColor,
                  ),
              onPressed: () {},
              child: Text('Save'),
            ),
          )
        ],
      ),
    );
  }
}

class _TextFormFieldGenerator extends StatelessWidget {
  const _TextFormFieldGenerator({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
