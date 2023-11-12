import 'package:flutter/material.dart';

class ParameterCard extends StatefulWidget {
  final String title;
  final double value;
  final int decimalPlace;
  final String label;
  final IconData icon;
  final String popupTitle;
  final String popupSubtitle;
  final String popupContent;
  const ParameterCard({
    super.key,
    required this.title,
    required this.value,
    required this.decimalPlace,
    required this.icon,
    required this.label,
    required this.popupTitle,
    required this.popupSubtitle,
    required this.popupContent,
  });

  @override
  State<ParameterCard> createState() => _ParameterCardState();
}

class _ParameterCardState extends State<ParameterCard> {
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
        width: ((MediaQuery.of(context).size.width - 40) * 0.45),
        height: 151,
        decoration: ShapeDecoration(
          color: const Color(0xFFEDF7ED),
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
                  size: 35,
                  color: const Color((0xFF386150)),
                ),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'digital-7',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.value.toStringAsFixed(widget.decimalPlace),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontFamily: 'digital-7',
                    fontWeight: FontWeight.w500,
                    height: 0.34,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'digital-7',
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
