import 'package:flutter/material.dart';
import 'package:shelf/model/author.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorScreen extends StatelessWidget {
  final Author author;
  const AuthorScreen({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _launchUrl() async {
      final url = author.link;
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: true, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(author.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.quotable.dev/profile/400/${author.slug}.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              author.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              author.description,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              author.bio,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: _launchUrl,
              child: Text(
                author.link,
                style: TextStyle(
                  color: Colors.blue.shade500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
