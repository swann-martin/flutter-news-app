// ignore: depend_on_referenced_packages
import "package:equatable/equatable.dart";

class Article {
  // final String id;
  // final String title;
  // final String subtitle;
  // final String body;
  // final String author;
  // final String authorImageUrl;
  // final String category;
  // final String imageUrl;
  // final int views;
  // final DateTime createdAt;

  final String author;
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String source;

  Article(
      {required this.author,
      required this.title,
      required this.urlToImage,
      required this.url,
      required this.content,
      required this.publishedAt,
      required this.source});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? "Unknown Author",
      title: json['title'] ?? "Title not provided",
      url: json['url'] ?? "https://randomuser.me/api/portraits/women/79.jpg",
      urlToImage: json['urlToImage'] ??
          "https://images.unsplash.com/photo-1572949645841-094f3a9c4c94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      content: json['content'] ?? "NA",
      publishedAt: json['publishedAt'] ?? "https://swannmartin.xyz/",
      source: json['source']['name'] ?? "https://swannmartin.xyz/",
    );
  }

  // static List<Article> articles = [
  //   Article(
  //       id: "1",
  //       title: "loremdazdazdaz ",
  //       subtitle:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
  //       body:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //       author: "Joan Johan",
  //       authorImageUrl: "https://randomuser.me/api/portraits/women/79.jpg",
  //       category: "Santé",
  //       imageUrl:
  //           "https://images.unsplash.com/photo-1572949645841-094f3a9c4c94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  //       views: 1456,
  //       createdAt: DateTime.now().subtract(const Duration(hours: 8))),
  //   Article(
  //       id: "2",
  //       title: "loremdazdazdaz ",
  //       subtitle:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
  //       body:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //       author: "Eve Johan",
  //       authorImageUrl: "https://randomuser.me/api/portraits/women/50.jpg",
  //       category: "Politique",
  //       imageUrl:
  //           "https://images.unsplash.com/photo-1554731617-8eafa9975365?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
  //       views: 1456,
  //       createdAt: DateTime.now().subtract(const Duration(hours: 1))),
  //   Article(
  //       id: "3",
  //       title: " consectetur adipiscing elit, ",
  //       subtitle:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
  //       body:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //       author: "Jill Johan",
  //       authorImageUrl: "https://randomuser.me/api/portraits/women/40.jpg",
  //       category: "Politique",
  //       imageUrl:
  //           "https://images.unsplash.com/photo-1615403916271-e2dbc8cf3bf4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  //       views: 1456,
  //       createdAt: DateTime.now().subtract(const Duration(hours: 2))),
  //   Article(
  //       id: "4",
  //       title: "d tempor incididunt ",
  //       subtitle:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
  //       body:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //       author: "Anna Johan",
  //       authorImageUrl: "https://randomuser.me/api/portraits/women/81.jpg",
  //       category: "Politique",
  //       imageUrl:
  //           "https://images.unsplash.com/photo-1546422904-90eab23c3d7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80",
  //       views: 1456,
  //       createdAt: DateTime.now().subtract(const Duration(hours: 5))),
  //   Article(
  //       id: "5",
  //       title: "d tempor incididunt ",
  //       subtitle:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
  //       body:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //       author: "Anna Johan",
  //       authorImageUrl: "https://randomuser.me/api/portraits/women/81.jpg",
  //       category: "Politique",
  //       imageUrl:
  //           "https://images.unsplash.com/photo-1546422904-90eab23c3d7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80",
  //       views: 1456,
  //       createdAt: DateTime.now().subtract(const Duration(hours: 5))),
  //   Article(
  //       id: "6",
  //       title: "d tempor incididunt ",
  //       subtitle:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
  //       body:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //       author: "Anna Johan",
  //       authorImageUrl: "https://randomuser.me/api/portraits/women/81.jpg",
  //       category: "Politique",
  //       imageUrl:
  //           "https://images.unsplash.com/photo-1546422904-90eab23c3d7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80",
  //       views: 1456,
  //       createdAt: DateTime.now().subtract(const Duration(hours: 5))),
  //   Article(
  //       id: "7",
  //       title: "d tempor incididunt ",
  //       subtitle:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
  //       body:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //       author: "Anna Johan",
  //       authorImageUrl: "https://randomuser.me/api/portraits/women/81.jpg",
  //       category: "Politique",
  //       imageUrl:
  //           "https://images.unsplash.com/photo-1546422904-90eab23c3d7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80",
  //       views: 1456,
  //       createdAt: DateTime.now().subtract(const Duration(hours: 5))),
  // ];

  // @override
  // List<Object?> get props => [
  //       id,
  //       title,
  //       subtitle,
  //       body,
  //       author,
  //       authorImageUrl,
  //       category,
  //       imageUrl,
  //       views,
  //       createdAt
  //     ];
}
