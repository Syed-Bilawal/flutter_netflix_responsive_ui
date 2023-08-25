// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget 
 {
  final String title;
  final IconData icon;
  final void Function() onTap;
  VerticalIconButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white,),
          SizedBox(height: 2,),
          Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
