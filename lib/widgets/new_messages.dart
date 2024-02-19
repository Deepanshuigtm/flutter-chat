
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget{
  NewMessages({super.key});

  @override
  State<NewMessages> createState() {
    return _NewMessageState();
  }
  
}
class _NewMessageState extends State<NewMessages>{
  var _messageController = TextEditingController();
  @override
  void dispose(){
    _messageController.dispose();
    super.dispose();
  }
  void _submitMessage(){
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty){
      return;
    }

    _messageController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15,right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: _messageController,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                  labelText: 'Send a message...'
                ),
              )
          ),
          IconButton(
              onPressed: (){
                _submitMessage();
              },
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
  
}