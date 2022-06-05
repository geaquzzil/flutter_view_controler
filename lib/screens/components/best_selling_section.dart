import 'package:flutter/material.dart';
import 'package:flutter_view_controller/components/card_body.dart';
import 'package:flutter_view_controller/components/product_card_bottom.dart';
import 'package:flutter_view_controller/constants.dart';
import 'package:flutter_view_controller/screens/action_screens/view_details_page.dart';
import 'package:flutter_view_controller/size_config.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.getScreenPropotionHeight(300),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CardBody(
            width: SizeConfig.getScreenPropotionWidth(298),
            height: SizeConfig.getScreenPropotionHeight(300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 19,
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "bestSelling[index].name,",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "bestSelling[index].modelNo",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: const Text(
                          "bestSelling[index].description",
                          style: TextStyle(
                            color: kTextLightColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Hero(
                            tag: "bestSelling[index].id",
                            child: Image.asset(
                              "",
                              width: SizeConfig.getScreenPropotionWidth(100),
                              height: SizeConfig.getScreenPropotionHeight(170),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //TODO  Expanded(
                //   child: ProductCardBottom(
                //     product: bestSelling[index],
                //   ),
                // )
              ],
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ViewDetailsPage(
              //       object: bestSelling[index],
              //     ),
              //   ),
              // );
            },
            index: index,
          );
        },
        itemCount: 3,
      ),
    );
  }
}
