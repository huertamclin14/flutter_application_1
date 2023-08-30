import 'package:flutter/material.dart';

class TopCard extends StatefulWidget {
  final double value;
  const TopCard({super.key, required this.value});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery. of(context).size.width-20) * 0.9),
      height: 151,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFEDF7ED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: (((MediaQuery. of(context).size.width  -20)* 0.9) - 16) * 0.475,
            height: 130,
            decoration: ShapeDecoration(
              color: const Color(0xFFA8C96F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'TOTAL HARVEST',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.value.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Color(0xFFEDF7ED),
                        fontSize: 48,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Text(
                      'kg',
                      style: TextStyle(
                        color: Color(0xFFEDF7ED),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const Text(
                  'DD/MM/YYYY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            'images/mushroom.png',
            width: ((MediaQuery. of(context).size.width * 0.9) - 16) * 0.475,
          )
        ],
      ),
    );
  }
}