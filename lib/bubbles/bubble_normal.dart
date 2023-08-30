import 'package:flutter/material.dart';

const double BUBBLE_RADIUS = 16;

///basic chat bubble type
///
///chat bubble [BorderRadius] can be customized using [bubbleRadius]
///chat bubble color can be customized using [color]
///chat bubble tail can be customized  using [tail]
///chat bubble display message can be changed using [text]
///[text] is the only required parameter
///message sender can be changed using [isSender]
///[sent],[delivered] and [seen] can be used to display the message state
///chat bubble [TextStyle] can be customized using [textStyle]

class BubbleNormal extends StatelessWidget {
  final double bubbleRadius;
  final bool isSender;
  final Color color;
  final Color dateFontColor;
  final String text;
  final String dateText;
  final String imageUrl;
  final double dateFontSize;
  final double paddingHorizontal;
  final double paddingVertical;
  final List<String>? images;
  final bool showImage;
  final bool showImageSender;
  final double imageHeightWidth;
  final double bubbleVerticalHeight;
  final bool tail;
  final bool sent;
  final bool showTourDetails;
  final bool assetsOrNetworkImage;
  final bool showTime;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;

  BubbleNormal({
    Key? key,
    required this.text,
    this.bubbleRadius = BUBBLE_RADIUS,
    this.isSender = true,
    this.showImage = false,
    this.showImageSender = false,
    this.showTourDetails = false,
    this.color = Colors.white70,
    this.dateFontColor = Colors.black,
    this.dateText = '',
    this.imageUrl = '',
    this.images,
    this.dateFontSize = 18.0,
    this.imageHeightWidth = 20.0,
    this.bubbleVerticalHeight = 12.0,
    this.paddingHorizontal = 2.0,
    this.paddingVertical = 2.0,
    this.tail = true,
    this.sent = false,
    this.assetsOrNetworkImage = false,
    this.delivered = false,
    this.showTime = false,
    this.seen = false,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
  }) : super(key: key);

  ///chat bubble builder method
  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    bool stateTime = false;
    Icon? stateIcon;
    String? timeText;
    if (sent) {
      stateTick = true;
      stateIcon = Icon(
        Icons.ac_unit_rounded,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = Icon(
        Icons.safety_check_rounded,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = Icon(
        Icons.save,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }
    if (showTime) {
      stateTime = true;
      timeText = dateText;
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: bubbleVerticalHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isSender == false ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          showImage == true
              ? isSender == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        width: imageHeightWidth,
                        height: imageHeightWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 5,
                    )
              : SizedBox(
                  width: 5,
                ),
          SizedBox(
            width: 08,
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal, vertical: paddingVertical),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .8),
            // margin: EdgeInsets.symmetric(vertical: bubbleVerticalHeight),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(bubbleRadius),
                  topRight: Radius.circular(bubbleRadius),
                  bottomLeft: Radius.circular(tail
                      ? isSender
                          ? bubbleRadius
                          : 0
                      : BUBBLE_RADIUS),
                  bottomRight: Radius.circular(tail
                      ? isSender
                          ? 0
                          : bubbleRadius
                      : BUBBLE_RADIUS),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: stateTick
                        ? EdgeInsets.fromLTRB(12, 6, 28, 6)
                        : EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: showTourDetails == true
                        ? Container(
                            height: 100,
                            width: 80,
                            color: Colors.blue,
                          )
                        : Text(
                            text,
                            style: textStyle,
                            textAlign: TextAlign.left,
                          ),
                  ),
                  dateText.isNotEmpty && stateTick
                      ? Positioned(
                          bottom: 4,
                          right: 6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 05),
                            child: images == null
                                ? Text(
                                    dateText,
                                    style: TextStyle(
                                        fontSize: dateFontSize,
                                        color: dateFontColor),
                                  )
                                : Image.network('$images'),
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  // stateIcon != null && stateTick
                  //     ? Positioned(
                  //         bottom: 4,
                  //         right: 6,
                  //         child: stateIcon,
                  //       )
                  //     : SizedBox(
                  //         width: 1,
                  //       ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 08,
          ),
          showImageSender == true
              ? isSender == true
                  ? SizedBox(
                      width: imageHeightWidth,
                      height: imageHeightWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: assetsOrNetworkImage == true
                            ? Image.network(
                                imageUrl,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                imageUrl,
                                fit: BoxFit.fill,
                              ),
                      ),
                    )
                  : Container()
              : Container(),
          // SizedBox(
          //   width: 08,
          // ),
        ],
      ),
    );
  }
}
