// MenuBar Section

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatSection extends StatelessWidget {
  final List menuItems = ["Message", "Online", "Groups", "Calls"];

  ChatSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 23,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 23,
                color: Colors.white,
              )),
        ],
      ),
      body: const ChatContentSection(),
      bottomNavigationBar: const BottomSection(),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10.0,
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: 43,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30)
                      ),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(width: 10.0),
                        Icon(
                          Icons.insert_emoticon,
                          size: 25.0,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.update_outlined,
                          size: 25.0,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8.0),
                        Icon(
                          Icons.image,
                          size: 25.0,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10.0),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.mic_none_sharp,
                      color: Colors.white,
                    )),
              ),
            ],
          )),
    );
  }
}

class ChatContentSection extends StatelessWidget {
  final String senderProfile = "images/avatar/a6.jpg";
  final String receiverProfile = "images/avatar/a7.jpg";

  const ChatContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0
      ),
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            Text(
              "Flavien HUGS.",
              style: GoogleFonts.inter(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Était en ligne il y a 56 secondes",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45.0),
            TextMessage(
              message: "Bonjour Flavien, comment vas-tu ?",
              date: "17:19",
              senderProfile: senderProfile,
              isReceiver: 1,
              isDirect: 0,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}


class TextMessage extends StatelessWidget {
  final String message, date, senderProfile;
  final int isReceiver, isDirect;

  const TextMessage({
    Key? key,
    required this.message,
    required this.date,
    required this.senderProfile,
    required this.isReceiver,
    required this.isDirect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          isReceiver == 1 && isDirect == 0
          ? Container(
            margin: const EdgeInsets.only(right: 15.0),
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(senderProfile),
                fit: BoxFit.cover,
              ),
            ),)
          : SizedBox(
            width: 60.0,
            child: Row(
              children: [
                const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 13.0
                ),
                const SizedBox(width: 7.0),
                Text(
                  date,
                  style: GoogleFonts.inter(
                    color: Colors.green,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: isReceiver == 1
              ? const EdgeInsets.only(right: 25.0)
              : const EdgeInsets.only(left: 25.0),
              padding: const EdgeInsets.all(6.0),
              height: 55,
              decoration: isReceiver == 1
              ? const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0)
                  ),
                )
              : const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
              child: Text(
                message,
                style: GoogleFonts.inter(
                  color: isReceiver == 1
                    ? Colors.green
                    : Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          isReceiver == 1 && isDirect == 0
          ? SizedBox(
              width: 60.0,
              child: Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 13.0,
                  ),
                  const SizedBox(width: 7.0),
                  Text(
                    date,
                    style: GoogleFonts.inter(
                      color: Colors.green,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : Container(),
          isReceiver == 0 && isDirect == 1
            ? Container(
                margin: const EdgeInsets.only(
                  left: 16.0,
                  right: 10.0,
                ),
                width: 45.0,
                height: 45.0,
              )
            : Container()
        ],
      ),
    );
  }
}


class AudioMessage extends StatelessWidget {
  final String date, senderProfile;

  const AudioMessage({
    Key? key,
    required this.date,
    required this.senderProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Row(
            children: [
              Text(
                "17:14",
                style: GoogleFonts.inter(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 7.0),
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 13.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: 15,
              bottom: 5,
            ),
            padding: const EdgeInsets.all(6),
            height: 55,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                const IconButton(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                Image.asset(
                  'images/sound-waves.png',
                  height: 35,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 10,
          ),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(senderProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}


class ImageMessage extends StatelessWidget {
  final String image, date, description;

  const ImageMessage({
    Key? key,
    required this.image,
    required this.date,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 16,
          ),
          width: 45,
          height: 45,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 26,
                  top: 5,
                ),
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  right: 25,
                  bottom: 10,
                ),
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Wrap(children: [
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 13.0,
              ),
              const SizedBox(width: 7.0),
              Text(
                "17:14",
                style: GoogleFonts.inter(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
