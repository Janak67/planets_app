import 'package:flutter/material.dart';
import 'package:planets_app/screen/detail/provider/detail_provider.dart';
import 'package:planets_app/screen/home/model/home_model.dart';
import 'package:planets_app/utils/share_helper.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  DetailProvider? providerr;
  DetailProvider? providerw;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 10000),
        lowerBound: 0,
        upperBound: 1,
        reverseDuration: const Duration(milliseconds: 10000));
    animationController.repeat();
    context.read<DetailProvider>().getBookMark();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DetailProvider>();
    providerw = context.watch<DetailProvider>();
    HomeModel h1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${h1.name}'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        providerw!.isLight == true
                            ? const Icon(Icons.dark_mode, color: Colors.black)
                            : const Icon(Icons.dark_mode_outlined),
                        const Text('Theme'),
                        Consumer<DetailProvider>(
                          builder: (context, value1, child) => Switch(
                            value: value1.isLight,
                            onChanged: (value) {
                              ShareHelper shr = ShareHelper();
                              shr.setTheme(value);
                              value1.changeTheme();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // PopupMenuItem(
                  //   child: IconButton(
                  //     onPressed: () {
                  //       providerr!.getBookMark();
                  //       if (!providerr!.bookMarkPlanet
                  //           .contains(providerr!.h1!.name)) {
                  //         providerr!.addBookMark();
                  //       } else {
                  //         providerr!.deleteBookMark();
                  //       }
                  //     },
                  //     icon: Icon(
                  //       providerw!.bookMarkPlanet
                  //                   .contains(providerr!.h1!.name) ==
                  //               true
                  //           ? Icons.favorite
                  //           : Icons.favorite_outline,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                ];
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              providerw!.isLight == false
                  ? Image.asset(
                      'assets/img/background.jpg',
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/saturn.jpg',
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover,
                    ),
              Column(
                children: [
                  const SizedBox(height: 100),
                  Align(
                    alignment: Alignment.topCenter,
                    child: RotationTransition(
                      turns: animationController,
                      child: Hero(
                        tag: '${h1.image1}',
                        child: Image.asset('${h1.image1}'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: providerw!.isLight == true
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.black38,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Text('${h1.details}',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    'Distance Earth :- ${h1.distanceEarth}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Distance Sun :- ${h1.distanceSun}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
