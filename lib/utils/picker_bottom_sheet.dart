import 'package:flutter/material.dart';

class PickerBottomSheet {
  static Future<String?> show(
    BuildContext context, {
    String title = "",
    required List<String> options,
    String selected = "",
  }) async {
    return showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(
            maxHeight: 400,
            minWidth: double.maxFinite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final String option = options[index];

                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.pop(context, option);
                      },
                      title: Text(option),
                      trailing: option == selected
                          ? const Icon(Icons.check)
                          : const SizedBox(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
