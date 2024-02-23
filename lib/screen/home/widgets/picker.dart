import 'package:flutter/material.dart';

class Picker extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String value;
  final String hintText;

  const Picker({
    super.key,
    required this.title,
    required this.onTap,
    required this.value,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 50,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value.isEmpty ? hintText : value,
                    style: TextStyle(
                      fontSize: 14,
                      color: value.isEmpty
                          ? Colors.grey
                          : Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
