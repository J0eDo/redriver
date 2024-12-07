import 'package:flutter/material.dart';

class DeliveryStepper extends StatelessWidget {
  final int currentStep;

  const DeliveryStepper({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final stages = ['Забор', 'Доставка', 'Завершен'];

    final stageColors = [
      Colors.blue,
      Colors.orange,
      Colors.green,
    ];

    return Row(
      children: List.generate(3, (index) {
        final isActive = index <= currentStep;

        return Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getStageIcon(index),
                    size: 24,
                    color: stageColors[index][isActive ? 700 : 200],
                  ),
                ],
              ),
              if (index != stages.length - 1)
                Expanded(
                  child: Container(
                    height: 2,
                    color: index < currentStep
                        ? stageColors[index + 1]
                        : Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  IconData _getStageIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.local_shipping;
      case 2:
        return Icons.verified;
      default:
        return Icons.circle;
    }
  }
}
