import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/approvement_news_bloc/approvement_news_bloc.dart';

@RoutePage()
class ApproveNewsScreen extends StatefulWidget {
  const ApproveNewsScreen({super.key});

  @override
  State<ApproveNewsScreen> createState() => _ApproveNewsScreenState();
}

class _ApproveNewsScreenState extends State<ApproveNewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApprovementNewsBloc>().add(const ApprovementEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    final blocApprovementNews = context.watch<ApprovementNewsBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: blocApprovementNews.state.when(
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          loaded: (loadedApprovementNews) {
            return ListView.builder(
              itemCount: loadedApprovementNews.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(loadedApprovementNews[index].image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loadedApprovementNews[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        loadedApprovementNews[index].description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Posted by: ${loadedApprovementNews[index].writer.firstName} ${loadedApprovementNews[index].writer.lastName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle confirm button press
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          error: () => const Text('Nothing found...'),
        ),
      ),
    );
  }
}
