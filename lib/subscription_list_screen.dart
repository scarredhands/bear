import 'package:flutter/material.dart';

class SubscriptionListScreen extends StatelessWidget {
  final List<dynamic> subscriptions;

  SubscriptionListScreen({required this.subscriptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your YouTube Subscriptions'),
      ),
      body: ListView.builder(
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          final subscription = subscriptions[index]['snippet'];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.network(
                subscription['thumbnails']['default']['url'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                subscription['title'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(subscription['description']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubscriptionDetailScreen(
                      subscription: subscription,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SubscriptionDetailScreen extends StatelessWidget {
  final Map<String, dynamic> subscription;

  SubscriptionDetailScreen({required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subscription['title']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                subscription['thumbnails']['medium']['url'],
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              subscription['title'],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              subscription['description'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            Text(
              'Channel ID: ${subscription['resourceId']['channelId']}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10),
            Text(
              'Published At: ${subscription['publishedAt']}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
