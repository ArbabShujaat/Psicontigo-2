import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/chat_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/chat_repo.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/view/views/audio_calling_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/write_a_review_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/message_bubble.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/small_icon_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<ChatModel> chatList = ChatRepo().getChatList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorResources.COLOR_PRIMARY,
          child: Column(children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: Column(children: [
                  Row(children: [
                    SmallIconButton(
                      iconData: Icons.arrow_back_ios,
                      myFunction: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text('Arbab Shujaat',
                            style: TextStyle(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                fontWeight: FontWeight.bold))),
                    Text('Time left 29:58',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    SmallIconButton(
                        iconData: Icons.close,
                        myFunction: () => {
                              showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(18.0),
                                        side: BorderSide(
                                          color: ColorResources.COLOR_PRIMARY,
                                        )),
                                    title: Text("Your Time has expired"),
                                    content: Text(
                                        "We will give you 2 more free messages for any questions you might have or to finish your conversation"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text(
                                          "Use free messages",
                                          style: TextStyle(
                                              color:
                                                  ColorResources.COLOR_PRIMARY),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      FlatButton(
                                        child: Text(
                                          "Finish",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WriteAReviewScreen()));
                                        },
                                      ),
                                    ],
                                  ))
                            }),
                  ]),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: chatList.length,
                      itemBuilder: (context, index) {
                        List<ChatModel> reversed = chatList.reversed.toList();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MessageBubble(
                              isMe: reversed[index].isMe,
                              text: reversed[index].message),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                  child: Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter something',
                    hintStyle: TextStyle(color: Color(0x56FFFFFF)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0x24FFFFFF),
                    prefixIcon:
                        Icon(Icons.attach_file, color: Color(0x56FFFFFF)),
                    suffixIcon: SmallIconButton(
                      iconData: Icons.send,
                      myFunction: () {
                        if (_controller.text.isNotEmpty) {
                          chatList.add(ChatModel(_controller.text, true));
                          _controller.text = '';
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
