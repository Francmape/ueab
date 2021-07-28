import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ueab/models/ueab.dart';
import '../../models/ueab.dart';

class UeabCard extends StatelessWidget {
  const UeabCard({Key? key, required this.ueab}) : super(key: key);
  final Ueab ueab;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 180.0,
        height: 170,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png',
                image: ueab.image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ueab.name,
                        softWrap: true,
                        // overflow: TextOverflow.fade,
                        maxLines: 1,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
