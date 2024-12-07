import 'package:flutter/material.dart';
import 'package:redriver/dto/application.dart';
import 'package:redriver/feautures/applications/widgets/delivery_stepper.dart';

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
        /*   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ApplicationDetails(),
          ),
        ); */
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
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              application.addressTo.address,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 8),
            DeliveryStepper(
              currentStep:
                  application.statusGroup == StatusGroup.inProcess ? 1 : 2,
            )
          ],
        ),
      ),
    );
  }
}
