import 'package:flutter/material.dart';

class RepostDialog extends StatelessWidget {
  final String caption;

  RepostDialog({required this.caption});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dm1.jpg'),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Carmen',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'ejkrosagfahfdaklhald jfad jlkfda jlka j',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 189, 187, 187),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by it",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 189, 187, 187),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Thumbnail of the post
            Container(
              height: 120,
              child: Image.asset(
                'assets/images/dm1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            // Caption input field

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Write a caption...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // Repost icon and button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Handle post logic
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Repost'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
