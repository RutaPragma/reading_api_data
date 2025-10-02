import 'package:flutter/material.dart';

class SyncButton extends StatelessWidget {
  const SyncButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPress,
    this.onLongPress,
  });

  final String text;
  final Color color;
  final VoidCallback onPress;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      overlayColor: WidgetStatePropertyAll(color),
      onTap: () => onPress.call(),
      onLongPress: () => onLongPress?.call(),
      child: Card(
        color: Colors.black87,
        child: Container(
          alignment: AlignmentGeometry.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: color),
              ),
              Icon(Icons.sync, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
