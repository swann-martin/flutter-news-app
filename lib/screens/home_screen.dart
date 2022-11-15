import 'package:flutter/material.dart';
import 'package:newsapp/models/article_models.dart';
import 'package:newsapp/screens/screens.dart';
import 'package:newsapp/widgets/custom_tag.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const NavigationDrawer(),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(padding: EdgeInsets.zero, children: [
        _NewsOfTheDay(article: article),
        _BreakingNews(articles: Article.articles)
      ]),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
          child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[buildHeader(context), buildMenuItems(context)]),
      ));
}

Widget buildHeader(BuildContext context) => Material(
      color: Colors.grey.shade700,
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const UserScreen())),
        child: Container(
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
          child: Column(children: const [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/71760899?v=4'),
            ),
            SizedBox(
              height: 12,
            ),
            Text('Swann Martin',
                style: TextStyle(fontSize: 28, color: Colors.white)),
            Text('swannmartin@swannmartin.xyz',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ]),
        ),
      ),
    );
Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed((context), HomeScreen.routeName);
              }),
          ListTile(
            leading: const Icon(Icons.search_outlined),
            title: const Text('Discover'),
            onTap: () =>
                Navigator.pushNamed((context), DiscoverScreen.routeName),
          ),
          ListTile(
              leading: const Icon(Icons.workspaces_outlined),
              title: const Text('Workflow'),
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DiscoverScreen()),
                  )),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Updates'),
            onTap: () {},
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserScreen()),
                  )),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            onTap: () {},
          ),
        ],
      ),
    );

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
                    child: InkWell(
                      onTap: (() => Navigator.pushNamed(
                            context,
                            ArticleScreen.routeName,
                            arguments: articles[index],
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                              width: MediaQuery.of(context).size.width * 0.5,
                              imageUrl: articles[index].imageUrl),
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
                                      height: 1.5)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Il y a ${DateTime.now().difference(articles[index].createdAt).inHours} heures',
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
      imageUrl: Article.articles[0].imageUrl,
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
