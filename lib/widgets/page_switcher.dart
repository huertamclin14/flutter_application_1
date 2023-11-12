import 'package:flutter/material.dart';

class PageSwitcher extends StatefulWidget {
  /*
   * Deprecated Page Switcher, Migrated to BottomNavigationBar
  */
  final int pageIndex;
  const PageSwitcher({super.key, required this.pageIndex});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  @override
  Widget build(BuildContext context) {
    int pageIndex = widget.pageIndex;
    return Container(
      width: (((MediaQuery.of(context).size.width - 10) - 20) * 0.58),
      height: 40,
      padding: const EdgeInsets.all(5),
      decoration: ShapeDecoration(
        color: const Color(0xFFEDF7ED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: pageIndex == 0
                    ? const Color(0xFF386150)
                    : const Color(0xFFEDF7ED),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ))),
            child: Text(
              'PARAMETERS',
              style: TextStyle(
                color: pageIndex == 0 ? Colors.white : Colors.black,
                fontSize: 11,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: pageIndex == 0
                  ? const Color(0xFFEDF7ED)
                  : const Color(0xFf6F4E37),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: Text(
              ' HARVEST  ',
              style: TextStyle(
                color: pageIndex == 0 ? Colors.black : Colors.white,
                fontSize: 11,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
