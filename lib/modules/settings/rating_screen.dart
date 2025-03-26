import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class RateAppScreen extends StatelessWidget {
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rate Our App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enjoying our app? Let us know!", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                } else {
                  inAppReview.openStoreListing();
                }
              },
              child: Text("Rate Now"),
            ),
          ],
        ),
      ),
    );
  }
}
