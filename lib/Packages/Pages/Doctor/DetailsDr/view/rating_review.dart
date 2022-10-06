import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/components/rating/app_bar_rating.dart';
import 'package:vets_app/Services/Authentication/store_services.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import '../../../Auth/models/model_vet.dart';
import '../components/rating/card_reviews.dart';

class PageRatingsAndReviews extends StatelessWidget {
  const PageRatingsAndReviews({required ModelVet vet, super.key}) : _vet = vet;
  final ModelVet _vet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarRating(vet: _vet),
      body: StreamBuilder(
        stream: StoreServices().getListRatings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: AppAnimationLoading(type: TypeLoading.page),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final snap = snapshot.data?[index];
                if (snap!.vetId == _vet.id) {
                  return SizedBox(
                      height: 150,
                      width: 300,
                      child: CardReviews(rating: snap));
                } else {
                  return Container(width: 0);
                }
              },
            );
          } else {
            return Container(width: 0);
          }
        },
      ),
    );
  }
}
