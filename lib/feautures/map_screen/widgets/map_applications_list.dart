import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redriver/feautures/applications/widgets/application_list_item.dart';
import 'package:redriver/providers/applications_provider.dart';

class MapApplicationsList extends ConsumerWidget {
  const MapApplicationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicationsAsyncValue = ref.watch(applicationsProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Expanded(
                child: applicationsAsyncValue.when(
                  data: (applications) => ListView.separated(
                    controller: scrollController,
                    itemCount: applications.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    itemBuilder: (context, index) {
                      final application = applications[index];
                      return ApplicationListItem(application: application);
                    },
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
