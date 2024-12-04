import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redriver/feautures/applications/application_list_item.dart';
import 'package:redriver/providers/applications_provider.dart';


class ApplicationsList extends ConsumerWidget {
  

  const ApplicationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicationsAsyncValue = ref.watch(applicationsProvider);

    return  applicationsAsyncValue.when(
        data: (applications) => ListView.separated(
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      );
    
    
   
  }
}
