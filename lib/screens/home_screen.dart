import 'package:flutter/material.dart';
import '../../services/dog_api_service.dart';
import '../../widgets/dog_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dogImage;
  bool isLoading = false;
  bool isLiked = false;

  Future<void> loadDog() async {
    setState(() {
      isLoading = true;
      isLiked = false;
    });

    final image = await DogApiService.fetchDogImage();

    setState(() {
      dogImage = image;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadDog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: const Text('🐶 Fun Dog Generator'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: loadDog,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (dogImage != null)
              DogCard(
                imageUrl: dogImage!,
                isLiked: isLiked,
                onLikeTap: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: loadDog,
              icon: const Icon(Icons.refresh),
              label: const Text('New Dog'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '⬇ Swipe down to refresh\n❤️ Tap heart to like',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
