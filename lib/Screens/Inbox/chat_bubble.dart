import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/message.dart';
import '../../models/trade.dart';
import '../Home/HomeScreen.dart';

class ChatBubble extends StatefulWidget {
  final Message msg;

  const ChatBubble({super.key, required this.msg});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  List colors = Colors.primaries;
  static Random random = Random();
  int rNum = random.nextInt(18);

  Color? chatBubbleColor() {
    if (widget.msg.isMe()) {
      return Theme.of(context).accentColor;
    } else {
      if (Theme.of(context).brightness == Brightness.dark) {
        return Colors.grey[800];
      } else {
        return Colors.grey[200];
      }
    }
  }

  // Color? chatBubbleReplyColor() {
  //   if (Theme.of(context).brightness == Brightness.dark) {
  //     return Colors.grey[600];
  //   } else {
  //     return Colors.grey[50];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final align =
        widget.msg.isMe() ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = BorderRadius.circular(25);

    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        !widget.msg.isTrade()
            ? Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(3.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: chatBubbleColor(),
                      borderRadius: radius,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.3,
                      minWidth: 20.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        widget.msg.isMe()
                            ? SizedBox()
                            :
                            // : widget.isGroup!
                            //     ? Padding(
                            //         padding: EdgeInsets.only(right: 48.0),
                            //         child: Container(
                            //           child: Text(
                            //             widget.username!,
                            //             style: TextStyle(
                            //               fontSize: 13,
                            //               color: colors[rNum],
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //             textAlign: TextAlign.left,
                            //           ),
                            //           alignment: Alignment.centerLeft,
                            //         ),
                            //       )
                            // : SizedBox(),
                            // widget.isGroup!
                            //     ? widget.isMe!
                            //         ? SizedBox()
                            //         : SizedBox(height: 5)
                            //     : SizedBox(),
                            // widget.isReply!
                            //     ? Container(
                            //         decoration: BoxDecoration(
                            //           color: chatBubbleReplyColor(),
                            //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            //         ),
                            //         constraints: BoxConstraints(
                            //           minHeight: 25,
                            //           maxHeight: 100,
                            //           minWidth: 80,
                            //         ),
                            //         child: Padding(
                            //           padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                            //           child: Column(
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: <Widget>[
                            //               Container(
                            //                 child: Text(
                            //                   widget.isMe!
                            //                       ? "Negociation"
                            //                       : widget.replyName!,
                            //                   style: TextStyle(
                            //                     color: Theme.of(context).accentColor,
                            //                     fontWeight: FontWeight.bold,
                            //                     fontSize: 12,
                            //                   ),
                            //                   maxLines: 1,
                            //                   textAlign: TextAlign.left,
                            //                 ),
                            //                 alignment: Alignment.centerLeft,
                            //               ),
                            //               SizedBox(height: 2.0),
                            //               Container(
                            //                 child: Text(
                            //                   widget.replyText!,
                            //                   style: TextStyle(
                            //                     color: Theme.of(context)
                            //                         .textTheme
                            //                         .headline6!
                            //                         .color,
                            //                     fontSize: 10.0,
                            //                   ),
                            //                   maxLines: 2,
                            //                 ),
                            //                 alignment: Alignment.centerLeft,
                            //               ),
                            //               SizedBox(height: 2.0),
                            //               Container(
                            //                 child: Text(
                            //                   'Je vous propose le prix de 35',
                            //                   style: TextStyle(
                            //                     color: Theme.of(context)
                            //                         .textTheme
                            //                         .headline6!
                            //                         .color,
                            //                     fontSize: 13.0,
                            //                     fontWeight: FontWeight.bold,
                            //                   ),
                            //                   maxLines: 2,
                            //                 ),
                            //                 alignment: Alignment.centerLeft,
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       )
                            //     : SizedBox(width: 2.0),
                            // widget.isReply! ? SizedBox(height: 5) : SizedBox(),
                            SizedBox(height: 5),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child:
                                //  widget.type == "text"
                                // ? !widget.isReply!?
                                Text(
                              widget.msg.message ?? '',
                              style: TextStyle(
                                color: widget.msg.isMe()
                                    ? Colors.white
                                    : Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .color,
                              ),
                            )
                            // : Container(
                            //     alignment: Alignment.centerLeft,
                            //     child: Text(
                            //       widget.message!,
                            //       style: TextStyle(
                            //         color: widget.isMe!
                            //             ? Colors.white
                            //             : Theme.of(context)
                            //                 .textTheme
                            //                 .headline6!
                            //                 .color,
                            //       ),
                            //     ),
                            //   )
                            // : ClipRRect(
                            //     borderRadius: BorderRadius.circular(25),
                            //     child: Image.asset(
                            //       "${widget.message}",
                            //       height: 130,
                            //       width: MediaQuery.of(context).size.width / 1.3,
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: widget.msg.isMe()
                        ? EdgeInsets.only(right: 10, bottom: 10.0)
                        : EdgeInsets.only(left: 10, bottom: 10.0),
                    child: Text(
                      widget.msg.timeAgo(),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              )
            : PriceCard(
                trade:widget.msg.trade!,
                color: chatBubbleColor(),
                onAccept: () {},
                onNewPropose: (double) {},
                onDecline: () {},
                time: widget.msg.timeAgo(),
                isMe: widget.msg.isMe(),
              ),
      ],
    );
  }
}

class PriceCard extends StatefulWidget {
  final Trade trade;
  final void Function() onAccept;
  final void Function() onDecline;
  final void Function(double) onNewPropose;
  final Color? color;
  final bool? isMe;
  final String? time;

  PriceCard(
      {this.color,
      required this.trade,
      required this.onAccept,
      required this.onDecline,
      required this.onNewPropose,
      this.isMe,
      this.time});

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    double newPrice = widget.trade.amout;

    return Column(
      crossAxisAlignment:
          widget.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(25),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.3,
            minWidth: 20.0,
          ),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Negociation",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      widget.trade.product.image,
                      height: 130,
                      width: MediaQuery.of(context).size.width / 1.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 2.0),
                        Container(
                          child: Text(
                            widget.trade.product.description,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              fontSize: 10.0,
                            ),
                            maxLines: 2,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(height: 2.0),
                        Container(
                          child: Text(
                            'Votre prix ne me satisfait pas, je vous propose donc:',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    // 'Price: \$${widget.pr.toStringAsFixed(2)}',
                    'Price: \$${widget.trade.amout}',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: widget.onAccept,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Accept',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: widget.onDecline,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Decline',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          newPrice = double.tryParse(value) ?? widget.trade.amout;
                        },
                        decoration: InputDecoration(
                          labelText: 'New Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      )),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          widget.onNewPropose(newPrice);
                          // showCommentDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).accentColor,
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Icon(Icons.send),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: widget.isMe!
              ? EdgeInsets.only(right: 10, bottom: 10.0)
              : EdgeInsets.only(left: 10, bottom: 10.0),
          child: Text(
            widget.time!,
            style: TextStyle(
              color: Theme.of(context).textTheme.headline6!.color,
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
