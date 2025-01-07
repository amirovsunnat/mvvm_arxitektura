import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_darsi/logic/flavour_notifier.dart';
import 'package:mvvm_architecture_darsi/model/flavour_model.dart';
import 'package:provider/provider.dart';

class FlavoursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<FlavourNotifier>().getAllFlavours();
    return Scaffold(body: Consumer<FlavourNotifier>(
      builder: (context, flavourNotifier, child) {
        if (flavourNotifier.isLoading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        return ListView.builder(
          itemCount: flavourNotifier.flavours.length,
          itemBuilder: (context, index) {
            // log(data.toString());
            final FlavourData flavourData = flavourNotifier.flavours[index];
            return GestureDetector(
              onTap: () async {
                await flavourNotifier.deleteFlavour(flavourData.id.toString());
              },
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          flavourData.name.toString(),
                          maxLines: 2,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () async {
                            // await Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => AddFlavourScreen(
                            //       flavourId: flavourData.id.toString(),
                            //       actualName: flavourData.name.toString(),
                            //       postService: postService,
                            //     ),
                            //   ),
                            // );
                          },
                          icon: Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
