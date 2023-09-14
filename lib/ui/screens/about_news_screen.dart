import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutNewsScreen extends StatelessWidget {
  const AboutNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 3.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(fit: StackFit.expand, children: [
                Image.network(
                  'https://images.unsplash.com/photo-1612441804231-77a36b284856?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW91bnRhaW4lMjBsYW5kc2NhcGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '24-28 июня.',
                          style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Двухдневный сплав на байдаркках по Волге',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            floating: true,
            pinned: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const ListTile(
                  title: Text('Author Name'),
                  subtitle: Wrap(children: [
                    Text(
                        'News Description Description DescriptionDescription Description Description DescriptionDescription Description Description DescriptionDescription Description Description DescriptionDescription Description Description DescriptionDescription'),
                  ]),
                );
              },
              childCount: 10, // Replace with the actual number of news items
            ),
          ),
        ],
      ),
    );
  }
}
