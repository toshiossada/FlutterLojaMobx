import 'package:flutter/material.dart';
import '../../../../../../../shared/models/item_size_model.dart';

class SizeWidget extends StatelessWidget {
  final ItemSizeModel size;
  final ItemSizeModel selectedSize;
  final Function(ItemSizeModel) onTap;

  const SizeWidget({
    Key key,
    this.size,
    this.selectedSize,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final selected = size == selectedSize;
    Color color = Colors.grey;
    if (!size.hasStok) {
      color = Colors.red.withAlpha(50);
    } else if (selected) {
      color = Theme.of(context).primaryColor;
    }

    return GestureDetector(
      onTap: !size.hasStok
          ? null
          : () {
              onTap(size);
            },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: color,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                size.name,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'R\$ ${size.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
