import 'package:flutter/material.dart';

class DrawerTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final bool selected;

  const DrawerTileWidget({
    Key key,
    this.icon,
    this.title,
    this.onTap,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                icon,
                size: 32,
                color: selected ?? false ? Colors.red : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: selected ?? false ? Colors.red : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
