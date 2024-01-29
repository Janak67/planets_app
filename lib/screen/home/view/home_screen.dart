import 'package:flutter/material.dart';
import 'package:planets_app/screen/detail/provider/detail_provider.dart';
import 'package:planets_app/screen/home/model/home_model.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerr;
  HomeProvider? providerw;
  late AnimationController animationController;

  @override
  void initState() {
    context.read<HomeProvider>().getData();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 6000),
        lowerBound: 0,
        upperBound: 1);
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Planets'),
        ),
        body: Stack(
          children: [
            context.watch<DetailProvider>().isLight == false
                ? Image.asset(
                    'assets/img/background.jpg',
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/img/homebackground.jpg',
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
            ListView.builder(
              itemCount: providerw!.planet.length,
              itemBuilder: (context, index) {
                HomeModel planetList = providerr!.planet[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments: planetList);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.withOpacity(0.4)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          RotationTransition(
                            turns: animationController,
                            child: Hero(
                              tag: '${planetList.image1}',
                              child: Image.asset(
                                '${planetList.image1}',
                                width: 100,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${planetList.name}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                '${planetList.gravity}',
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: context.watch<DetailProvider>().bookMarkPlanet.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  context.watch<DetailProvider>().bookMarkPlanet[index],
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
