import 'package:flutter/material.dart';

import '../components/main_body.dart';
import '../components/primary_button.dart';
import '../constants.dart';
import '../models/view_abstract.dart';
import '../size_config.dart';

class ViewDetailsPage<T extends ViewAbstract> extends StatelessWidget {
  const ViewDetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final T product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: RoundedIconButton(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/arrow.svg',
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: SvgPicture.asset(
                'assets/icons/cart.svg',
              ),
            ),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          left: 50,
          right: 37,
          bottom: 30,
        ),
        child: PrimaryButton(
          onTap: () {},
          text: "Buy Now",
        ),
      ),
      body: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: Image.asset(
                product.images[0],
                width: SizeConfig.getScreenPropotionWidth(250),
                height: SizeConfig.getScreenPropotionWidth(250),
              ),
            ),
            Expanded(
              child: MainBody(
                padding: const EdgeInsets.only(
                  left: 50,
                  top: 43,
                  right: 37,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CartButton(
                            onTap: () {},
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Photos',
                        style: TextStyle(
                          color: kTextLightColor,
                          fontSize: 22.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProductImages(product: product),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.modelNo,
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: product.rating,
                        allowHalfRating: false,
                        itemCount: product.rating.toInt(),
                        ignoreGestures:
                            true, // this disables the change star rating
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: kPrimaryColor,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        product.description,
                        style: const TextStyle(
                          color: kTextLightColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}