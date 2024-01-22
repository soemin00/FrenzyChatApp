
import 'package:chat_app/Chat_message.dart';
import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _message = <ChatMessage> [];
  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text : text,
    );
    setState(() {
      _message.insert(0, message);
    });
  }
  Widget _TextComposerWidget(){
    return IconTheme(
      data: new IconThemeData(
        color: Colors.teal,
      ),
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: [
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Send a message "),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new Flexible(
          child: new ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _message[index],
            itemCount: _message.length,
          ),
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _TextComposerWidget(),
        )
      ],
    );
  }
}
