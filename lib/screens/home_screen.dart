import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/models/article_models.dart';
import 'package:newsapp/screens/screens.dart';
import 'package:newsapp/widgets/custom_tag.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Article>> fetchArticles() async {
    var response = await http.get(Uri.parse('http://localhost:3000/articles'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((article) => Article.fromJson(article)).toList();
    }
    throw Exception('Failed to fetch the news');
  }

  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("The news Today"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<Article>>(
            future: fetchArticles(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                List<Article> articles = snapshot.data!;
                return ListView(
                  children: [
                    _NewsOfTheDay(
                      article: articles[0],
                    ),
                    _BreakingNews(articles: articles),
                    // ListView.builder(
                    //   itemCount: 3,
                    //   shrinkWrap: true,
                    //   itemBuilder: (context, index) {
                    //     return Container(
                    //         margin: const EdgeInsets.all(8),
                    //         padding: const EdgeInsets.all(8),
                    //         color: Colors.white,
                    //         child: Column(
                    //           children: [
                    //             _BreakingNews(articles: articles),
                    //           ],
                    //         ));
                    //   },
                    // ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

// Widget buildHome(List<Article> articles) {
//   Article article = articles[0];
//   return Container(
//     height: 100,
//     width: 300,
//     child: ListView(padding: EdgeInsets.zero, children: [
//       _NewsOfTheDay(article: article),
//       _BreakingNews(articles: articles)
//     ]),
//   );
// }

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dernières Informations",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text("Voir plus", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                              width: MediaQuery.of(context).size.width * 0.5,
                              imageUrl: articles[index].urlToImage),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(articles[index].title,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                  )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(articles[index].publishedAt,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      height: 1.5)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('écrit par ${articles[index].author}',
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold, height: 1.5))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      imageUrl: article.urlToImage,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
              Text(
                'News of the Day',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              )
            ]),
            const SizedBox(height: 10),
            Text(
              article.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25),
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Row(
                  children: [
                    Text(
                      'Learn More',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    )
                  ],
                ))
          ]),
    );
  }
}
