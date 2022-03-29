import 'package:flutter/material.dart';
import 'package:shelf/model/author.dart';
import 'package:shelf/data/network.dart';
import 'package:shelf/ui/author_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Network network = Network();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shelf'),
      ),
      body: FutureBuilder(
        future: network.getAuthorData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error: Something went wrong, please try again'),
              );
            }
            final List<Author> authors = snapshot.data as List<Author>;
            return ListView.builder(
              itemCount: authors.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthorScreen(
                          author: authors[index],
                        ),
                      )),
                  title: Text(authors[index].name),
                  subtitle: Text(authors[index].description),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
