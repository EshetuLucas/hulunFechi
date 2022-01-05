import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/views/about/about_view.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/image_builder.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: hulunfechiAppbar(
          title: 'About',
          onBackButtonTap: model.onBack,
        ),
        body: Padding(
          padding: appSymmetricEdgePadding,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: ImageBuilder(
                            assetName:
                                'assets/images/intro_images/hulunFechi.png',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: ImageBuilder(
                              assetName: 'assets/images/intro_images/logo.jpg'),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'AFRICAN PRIDE GROUP established, to bridge the telecom, outsourcing, technology, telecom value added services, ICT, Infrastructure development,Engineering, Innovation, Science, Trading, internet and Security challenges that exist in Ethiopia. The company has inits possession a vast area of technology, telecom and engineering experts and partners whom have the highest knowledge, experience, reputation and expertise with regards to the Technology and Telecom arena. Its core objective is to deliver clients and partners products, solutions, services , expertise and knowledge in the technology, ICT, customer support, Research, Science, Research & export and telecom area. It also envisions to be the leading company with regards to the Engineering, development and innovation of the technology, ICT, internet, outsourcing, valued added services, Consulting and telecom related works in the country. It aspires to bridge the gap between the public, businesses, government and investors when it comes to technology, internet, outsourcing, saving, ICT, service delivery, branding and telecom solution and systems. It will work closely with firms and organizations by consulting and supporting them to be the highest beneficiary of the technology and telecom services in their day-to-day challenges and customer needs',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
