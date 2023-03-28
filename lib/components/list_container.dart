import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Icon(
            Icons.circle,
            color: Colors.green,
            size: 30,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Ticket ID: # 123456',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'LiberationMono',
                  color: Colors.grey,
                ),
              ),
              Text(
                'Ticket Status: Open',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'LiberationMono',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  
  }
}
