import 'package:flutter/material.dart';
import 'package:newsapp/models/article_models.dart';
import 'package:newsapp/screens/screens.dart';
import 'package:newsapp/widgets/image_container.dart';

import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  static const routeName = "/discover";

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ["Santé", "Politique", "Arts", "Cuisine", "Sciences"];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: ListView(padding: const EdgeInsets.all(20.0), children: [
          const _DiscoverNews(),
          _CategoryNews(
            tabs: tabs,
            articles: [],
          )
        ]),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  final List<Article> articles;
  const _CategoryNews({
    Key? key,
    required this.articles,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: tabs
                .map((tab) => Tab(
                      icon: Text(tab,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ))
                .toList()),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: tabs
                  .map((tab) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ArticleScreen.routeName,
                              arguments: articles[index],
                            );
                          },
                          child: Row(
                            children: [
                              ImageContainer(
                                  width: 80,
                                  height: 80,
                                  margin: const EdgeInsets.all(10.0),
                                  borderRadius: 5,
                                  imageUrl: articles[index].urlToImage),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      articles[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.schedule,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 5,
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
                                          width: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })))
                  .toList()),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Nouvelles du monde',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Search",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.tune, color: Colors.grey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}
