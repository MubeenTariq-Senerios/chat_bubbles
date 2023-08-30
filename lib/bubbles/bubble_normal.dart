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
  final String mainImage;
  final String mainImageAssets;
  final String assetsHomeImage;
  final String assetsCalendarImage;
  final String assetsClockImage;
  final String totalCountHome;
  final String date;
  final String startTime;
  final String endTime;
  final String status;

  final Color statusColor;

  BubbleNormal({
    Key? key,
    required this.text,
    this.bubbleRadius = BUBBLE_RADIUS,
    this.isSender = true,
    this.showImage = false,
    this.showImageSender = false,
    this.showTourDetails = false,
    this.color = Colors.white70,
    this.statusColor = Colors.white70,
    this.dateFontColor = Colors.black,
    this.mainImageAssets = '',
    this.mainImage = '',
    this.assetsHomeImage = '',
    this.assetsCalendarImage = '',
    this.assetsClockImage = '',
    this.totalCountHome = '',
    this.date = '',
    this.startTime = '',
    this.endTime = '',
    this.status = '',
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
                            height: 210,
                            width: 190,
                            margin: const EdgeInsets.only(
                                right: 05, bottom: 10, left: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF13C6FE).withOpacity(0.15),
                                  spreadRadius: 0.5,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 110,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: mainImage == ''
                                        ? Image.asset(
                                            mainImageAssets,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            mainImage,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 05),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    assetsHomeImage,
                                                    height: 15,
                                                    width: 15,
                                                    color: Color(0xff1089FE),
                                                  ),
                                                  const SizedBox(
                                                    width: 05,
                                                  ),
                                                  Text(
                                                    totalCountHome,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xFF042727),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                    // font
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                child: Container(
                                                  decoration: ShapeDecoration(
                                                    color:
                                                        const Color(0xFFFDDCD5),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 5),
                                                    child: Text(
                                                      status,
                                                      style: TextStyle(
                                                        color: statusColor,
                                                        fontSize: 12,
                                                        fontFamily: 'Work Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 0.95,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Image.asset(
                                                assetsCalendarImage,
                                                scale: 3.8,
                                                color: Color(0xff1089FE),
                                              ),
                                              const SizedBox(
                                                width: 05,
                                              ),
                                              Text(
                                                date,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF042727)
                                                          .withOpacity(0.70),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                textAlign: TextAlign.left,
                                                maxLines: 1,
                                                // font
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Image.asset(
                                                assetsClockImage,
                                                height: 20,
                                                width: 20,
                                                color: Color(0xff1089FE),
                                              ),
                                              const SizedBox(width: 03),
                                              Text(
                                                '$startTime to $endTime',

                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF042727)
                                                          .withOpacity(0.70),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                textAlign: TextAlign.center,
                                                // font
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
