import 'package:flutter/material.dart';

import 'custom_image.dart';

class CustomArticleCard extends StatelessWidget {
  final Function()? onTap;
  final String image;
  final data;
  const CustomArticleCard(
      {Key? key, this.onTap, required this.image, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                image,
                nom: data['nom'],
                isNetwork: false,
                width: double.infinity,
                height: 230,
                radius: 15,
              ),
              const SizedBox(height: 10.0),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['prix'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 22.0),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                subtitle:  Text(
                  data['description'],
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
        onTap: onTap,
      );
}

generateStart({int? count, String? info}) {
  return Row(
    children: [
      Row(
        children: List.generate(
            count!,
            (index) =>
                const Icon(Icons.star, size: 15.0, color: Colors.yellow)),
      ),
      const SizedBox(width: 3),
      Text(
        info!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.amber, fontSize: 13),
      ),
    ],
  );
}
