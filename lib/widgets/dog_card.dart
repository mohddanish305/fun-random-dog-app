import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final String imageUrl;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const DogCard({
    super.key,
    required this.imageUrl,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
            onPressed: onLikeTap,
          ),
        ],
      ),
    );
  }
}
