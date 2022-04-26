// Favorite Section

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteSection extends StatelessWidget {
  FavoriteSection({Key? key}) : super(key: key);

  final List favoriteContacts = [
    {'name': "Flavien", 'profile': "images/avatar/a1.jpg"},
    {'name': "Hugues", 'profile': "images/avatar/a2.jpg"},
    {'name': "Stephane", 'profile': "images/avatar/a3.jpg"},
    {'name': "Stephanie", 'profile': "images/avatar/a4.jpg"},
    {'name': "Christ", 'profile': "images/avatar/a5.jpg"},
    {'name': "Arnold W.", 'profile': "images/avatar/a6.jpg"},
    {'name': "Olivier B.", 'profile': "images/avatar/a7.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Favorite contacts",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: favoriteContacts.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(item['profile']),
                          ),
                        ),
                        const SizedBox(
                          height: 6
                        ),
                        Text(
                          item['name'],
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ),
          ],
        ),
      ),
    );
  }
}
