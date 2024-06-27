import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/approvement_news_bloc/approvement_news_bloc.dart';

class ApproveNewsScreen extends StatelessWidget {
  /// Экран массива новостей на модерации.
  const ApproveNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'События компании',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 50,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<ApprovementNewsBloc, ApprovementNewsState>(
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Ждут действий',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '6',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green),
                        ),
                      ],
                    ),
                    Column(

                        //
                        // children: .isNotEmpty
                        //     ? foundFilms
                        //         .map((item) => FilmCard(
                        //               addFilm: () => model.saveFilm(item),
                        //               name: item.name ?? '',
                        //               year: item.year,
                        //               rating: item.rating!.kp,
                        //               genres: item.genres,
                        //               description: item.description,
                        //               poster: item.poster?.url ?? '',
                        //               countries: item.countries ?? [],
                        //             ))
                        //         .toList()
                        //     : []),

                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// class ApprovedNewsCard extends StatelessWidget {
//   /// Карточка новости на модерации.
//   const ApprovedNewsCard({
//     required this.approvementNewsBloc,
//     super.key,
//   });
//
//   final ApprovementNewsBloc approvementNewsBloc;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.octopus.setState((stateRoute) => stateRoute
//           ..add(Routes.aboutNews.node(
//             arguments: <String, String>{'id': approvementNewsBloc.loadedApprovementNews[index].id.toString()},
//           )));
//       },
//       child: CachedNetworkImage(
//           fadeInDuration: const Duration(milliseconds: 100),
//           imageUrl: loadedApprovementNews[index].image,
//           imageBuilder: (context, imageProvider) {
//             return Container(
//               margin: const EdgeInsets.all(10),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: imageProvider,
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     loadedApprovementNews[index].title,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     loadedApprovementNews[index].description,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Posted by: ${loadedApprovementNews[index].writer.firstName} ${loadedApprovementNews[index].writer.lastName}',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           approvementNewsBloc.add(
//                               ApprovementEvent.approvedNews(id: loadedApprovementNews[index].id.toString()));
//                         },
//                         child: Text(
//                           'Подтвердить',
//                           style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
//                         onPressed: () {
//                           approvementNewsBloc.add(ApprovementEvent.moveInArchiveNews(
//                               id: loadedApprovementNews[index].id.toString()));
//                         },
//                         child: Text(
//                           'Отколнить',
//                           style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
