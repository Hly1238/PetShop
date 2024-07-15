import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shop/models/ModelPredict/model_product.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/Product/components/rounded_container.dart';
import 'package:pet_shop/servies/ModelPredict/predict_service.dart';

class ListPredict extends StatefulWidget {
  final XFile image;
  const ListPredict({Key? key, required this.image}) : super(key: key);

  @override
  _ListPredictState createState() => _ListPredictState();
}

class _ListPredictState extends State<ListPredict> {
  List<ModelProduct>? predList;
  bool isLoading = true;

  // Define a map of breed names to image paths
  final Map<String, String> breedImages = {
    "beagle": "assets/images/_project/Predict/beagle.jpg",
    "bull_mastiff": "assets/images/_project/Predict/bull_mastiff.jpg",
    "chihuahua": "assets/images/_project/Predict/chihuahua.jpg",
    "dandie_dinmont": "assets/images/_project/Predict/dandie_dinmont.jpg",
    "doberman": "assets/images/_project/Predict/doberman.jpg",
    "eskimo_dog": "assets/images/_project/Predict/eskimo_dog.jpg",
    "golden_retriever": "assets/images/_project/Predict/golden_retriever.jpg",
    "irish_terrier": "assets/images/_project/Predict/irish_terrier.jpg",
    "labrador_retriever":
        "assets/images/_project/Predict/labrador_retriever.jpg",
    "malamute": "assets/images/_project/Predict/malamute.jpg",
    "malinois": "assets/images/_project/Predict/malinois.jpg",
    "maltese_dog": "assets/images/_project/Predict/maltese_dog.jpg",
    "miniature_pinscher":
        "assets/images/_project/Predict/miniature_pinscher.jpg",
    "miniature_poodle": "assets/images/_project/Predict/miniature_poodle.jpg",
    "norfolk_terrier": "assets/images/_project/Predict/norfolk_terrier.jpg",
    "pembroke": "assets/images/_project/Predict/pembroke.jpg",
    "pomeranian": "assets/images/_project/Predict/pomeranian.jpg",
    "pug": "assets/images/_project/Predict/pug.jpg",
    "siberian_husky": "assets/images/_project/Predict/siberian_husky.jpg",
    "staffordshire_bullterrier":
        "assets/images/_project/Predict/staffordshire_bullterrier.jpg",
    "toy_poodle": "assets/images/_project/Predict/toy_poodle.jpg",
    "yorkshire_terrier": "assets/images/_project/Predict/yorkshire_terrier.jpg",
  };

  @override
  void initState() {
    super.initState();
    fetchPrediction();
  }

  void fetchPrediction() async {
    Uint8List bytes = await widget.image.readAsBytes();
    var res = await PredictService().predict(bytes, widget.image.name);
    setState(() {
      predList = predListFromJson(res);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Results'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : predList == null || predList!.isEmpty
              ? Center(child: Text('No predictions available.'))
              : ListView.builder(
                  itemCount: predList!.length,
                  itemBuilder: (context, index) {
                    String breed = predList![index]
                        .label
                        .toLowerCase()
                        .replaceAll(' ', '_')
                        .trim();
                    return itemCard(breed);
                  },
                ),
    );
  }

  GestureDetector itemCard(String breed) {
    String? imagePath = breedImages[breed];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.dog_detail,
          arguments: DogDetailsArguments(
            name: breed.replaceAll('_', ' '),
            imgPath: imagePath ?? "assets/images/_project/Account/default.png",
          ),
        );
      },
      child: Container(
        width: 310,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            RoundedContainer(
              height: 120,
              padding: EdgeInsets.all(16),
              backgroundColor: Colors.white,
              child: Container(
                width: 100, // Fixed width
                height: 100, // Fixed height
                child: Image.asset(
                  imagePath ?? "assets/images/_project/Account/black_dog.png",
                  fit: BoxFit.cover, // Ensure the image covers the container
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breed.replaceAll('_', ' '),
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Breed Information",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DogDetailsArguments {
  final String name;
  final String imgPath;

  DogDetailsArguments({required this.name, required this.imgPath});
}
