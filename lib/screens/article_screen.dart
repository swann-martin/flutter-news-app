// import 'package:flutter/material.dart';
// import 'package:newsapp/models/article_models.dart';
// import 'package:newsapp/widgets/image_container.dart';
// import '../widgets/custom_tag.dart';

// class ArticleScreen extends StatelessWidget {
//   const ArticleScreen({Key? key}) : super(key: key);
//   static const routeName = "/article";

//   @override
//   Widget build(BuildContext context) {
//     final article = ModalRoute.of(context)!.settings.arguments as Article;
//     return ImageContainer(
//       width: double.infinity,
//       imageUrl: article.urlToImage,
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         extendBodyBehindAppBar: true,
//         body: ListView(
//           children: [
//             _NewsHeadline(
//               article: article,
//             ),
//             _NewsBody(article: article)
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _NewsBody extends StatelessWidget {
//   const _NewsBody({
//     Key? key,
//     required this.article,
//   }) : super(key: key);

//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//           color: Colors.white),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Wrap(
//           children: [
//             CustomTag(backgroundColor: Colors.black, children: [
//               CircleAvatar(
//                 radius: 10,
//                 backgroundImage: article.urlToImage != null
//                     ? NetworkImage(article.urlToImage)
//                     : const NetworkImage(
//                         'https://images.unsplash.com/photo-1504711434969-e33886168f5c'),
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 article.author,
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyMedium!
//                     .copyWith(color: Colors.white),
//               )
//             ]),
//             const SizedBox(
//               width: 10,
//             ),
//             CustomTag(backgroundColor: Colors.grey.shade200, children: [
//               const Icon(
//                 Icons.timer,
//                 color: Colors.grey,
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text('${DateTime.now().difference(article.createdAt).inHours} h',
//                   maxLines: 2, style: Theme.of(context).textTheme.bodyMedium),
//             ]),
//             const SizedBox(
//               width: 10,
//             ),
//             CustomTag(backgroundColor: Colors.grey.shade200, children: [
//               const Icon(
//                 Icons.remove_red_eye,
//                 color: Colors.grey,
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text('${article.views}',
//                   maxLines: 2, style: Theme.of(context).textTheme.bodyMedium),
//             ]),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Text(
//           article.title,
//           style: Theme.of(context)
//               .textTheme
//               .headlineSmall!
//               .copyWith(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Text(
//           article.body,
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         GridView.builder(
//             shrinkWrap: true,
//             itemCount: 2,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, childAspectRatio: 1.25),
//             itemBuilder: (context, index) {
//               return ImageContainer(
//                 width: MediaQuery.of(context).size.width * 0.42,
//                 imageUrl: article.imageUrl,
//                 margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
//               );
//             })
//       ]),
//     );
//   }
// }

// class _NewsHeadline extends StatelessWidget {
//   const _NewsHeadline({
//     Key? key,
//     required this.article,
//   }) : super(key: key);

//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.15,
//           ),
//           CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
//             Text(
//               article.category,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: Colors.white),
//             )
//           ]),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             article.title,
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                 color: Colors.white, fontWeight: FontWeight.bold, height: 1.25),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             article.subtitle,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyMedium!
//                 .copyWith(color: Colors.white),
//           ),
//           // Text(
//           //   article.body,
//           //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//           //         color: Colors.white,
//           //       ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
