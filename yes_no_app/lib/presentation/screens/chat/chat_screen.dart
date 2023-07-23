import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://img.thedailybeast.com/image/upload/dpr_2.0/c_crop,h_1440,w_1440,x_485,y_0/c_limit,w_128/d_placeholder_euli9k,fl_lossy,q_auto/v1519262699/180221-Zimmerman-Jennifer-Anniston-treatment-hero_qpmnon'),
            ),
          ),
        title: const Text('Mi amor 💖'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers) ? HerMessageBubble(message: message) : MyMessageBubble(message: message,);
            },)),
            
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          
          ],
        ),
      ),
    );
  }
}