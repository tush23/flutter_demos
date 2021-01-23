import 'package:flutter/material.dart';

Future<Data> showSheet<Data>(List<Data> data,String title,BuildContext context) async {
  // in any case if the context is null
  if (context == null) {
    debugPrint("Context is null");
    return null;
  }
  final List<String> innerData = [];
  // ignore: parameter_assignments
  title = 'Select $title';
  // if (Data == Relative) {
  //   data.forEach(
  //     (e) {
  //       innerData.add((e as Relative).name);
  //     },
  //   );
  // }
  if (Data == String) {
    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach(
      (e) {
        innerData.add(e as String);
      },
    );
  }
  Data d = await showModalBottomSheet<Data>(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    builder: (_) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // ignore: unnecessary_string_interpolations
                  "$title".toUpperCase(),
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context, data[i]);
                    },
                    title: Text(innerData[i]),
                  );
                },
                itemCount: innerData.length,
              ),
            )
          ],
        ),
      );
    },
  );
  return d;
}