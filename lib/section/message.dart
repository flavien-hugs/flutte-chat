// Message Section

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/section/chat.dart';


class MessageSection extends StatelessWidget {

  MessageSection({Key? key}) : super(key: key);

  final List messages = [
    {
      'senderProfile': 'images/avatar/a2.jpg',
      'senderName': 'Lara',
      'message': 'Hello',
      'unRead': 0,
      'date': '07:31'
    },
    {
      'senderProfile': 'images/avatar/a5.jpg',
      'senderName': 'Steeve',
      'message': 'Hello ! How are you ?',
      'unRead': 3,
      'date': '07:31'
    },
    {
      'senderProfile': 'images/avatar/a5.jpg',
      'senderName': 'Flavien',
      'message': 'Hello ! How are you ?',
      'unRead': 4,
      'date': '07:31'
    },
    {
      'senderProfile': 'images/avatar/a5.jpg',
      'senderName': 'Olivier',
      'message': 'Hello ! How are you ?',
      'unRead': 5,
      'date': '07:31'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messages.map((message) {
          return InkWell(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => ChatSection())))
            },
            splashColor: Colors.green,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 15),
              child: Row(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    margin: const EdgeInsets.only(right: 23),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          message['senderProfile'],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['senderName'],
                                  style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      message['message'],
                                      style: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(message['date']),
                                message['unRead'] != 0
                                  ? Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        message['unRead'].toString(),
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  : Container()
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          color: Colors.grey[400],
                          height: 0.5,
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
