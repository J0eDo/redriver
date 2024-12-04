import 'package:flutter/material.dart';
import 'package:redriver/dto/application.dart';
import 'package:redriver/feautures/applications/application_details.dart';

class ApplicationListItem extends StatelessWidget {
  const ApplicationListItem({
    super.key,
    required this.application,
  });

  final Application application;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ApplicationDetails(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  application.client.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              application.id,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              application.addressTo.details,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 8),
            // Отображение статуса
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildStatusChip(application.statusGroup),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Метод для построения чипа на основе статуса
  Widget _buildStatusChip(StatusGroup status) {
    final color = _getStatusColor(status);
    return Chip(
      label: Text(
        _getStatusText(status),
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
    );
  }

  // Метод для сопоставления статуса с текстом
  String _getStatusText(StatusGroup status) {
    switch (status) {
      case StatusGroup.Finished:
        return 'Завершено';
      case StatusGroup.Inprocess:
        return 'В процессе';
      case StatusGroup.Archived:
        return 'Архивировано';
      case StatusGroup.Completed:
        return 'Завершено';
    }
  }

  // Метод для сопоставления статуса с цветом
  Color _getStatusColor(StatusGroup status) {
    switch (status) {
      case StatusGroup.Finished:
        return Colors.green;
      case StatusGroup.Inprocess:
        return Colors.blue;
      case StatusGroup.Archived:
        return Colors.grey;
      case StatusGroup.Completed:
        return Colors.orange;
    }
  }
}
