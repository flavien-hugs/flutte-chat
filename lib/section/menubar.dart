// MenuBar Section

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class MenuSection extends StatelessWidget {
  final List menuItems = ["Message", "Online", "Groups", "Calls"];

  MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
          child: Row(
            children: menuItems.map((item) {
              return Container(
                margin: const EdgeInsets.only(right: 45),
                child: Text(
                  item,
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
