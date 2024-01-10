import 'package:flutter/material.dart';

class ControlCard extends StatefulWidget {
  final String title;
  final String onLabel;
  final String offLabel;
  final IconData icon;
  final String popupTitle;
  final String popupSubtitle;
  final String popupContent;
  final Function(bool value) onPressed;
  const ControlCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onLabel,
    required this.offLabel,
    required this.popupTitle,
    required this.popupSubtitle,
    required this.popupContent,
    required this.onPressed,
  }): super(key: key);

  @override
  State<ControlCard> createState() => _ControlCardState();
}

class _ControlCardState extends State<ControlCard> {
  bool on = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: ((MediaQuery.of(context).size.width - 40) * 45),
                height: 270,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEDF7ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.popupTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.popupSubtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.popupContent,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: ((MediaQuery.of(context).size.width - 40) * 0.46),
        height: 151,
        decoration: ShapeDecoration(
          color: const Color(0xff987554),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 10,),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Switch(
                  value:on,
                  activeColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() { 
                     on = value;
                     widget.onPressed(value);
                    });
                  },
                ),
                Text( on ? widget.onLabel : widget.offLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.46,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
