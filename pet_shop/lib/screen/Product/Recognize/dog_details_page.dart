import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogDetailsPage extends StatefulWidget {
  final String name;
  final String imgPath;
  const DogDetailsPage({super.key, required this.name, required this.imgPath});

  @override
  State<DogDetailsPage> createState() => _DogDetailsPageState();
}

class _DogDetailsPageState extends State<DogDetailsPage> {
  String? userId;

  final TextStyle titleTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Color.fromRGBO(82, 60, 154, 1));

  final TextStyle viewAllTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Color.fromRGBO(101, 201, 244, 1));

  final List<HealthCheck> healthChecks = [
    HealthCheck(
      title: 'Heart Rate Check',
      date: '4.11.2022',
      doctorName: 'Dr. Avery Baker'.toUpperCase(),
      icon: Icons.favorite,
    ),
    HealthCheck(
      title: 'Parasite Control',
      date: '16.10.2022',
      doctorName: 'Dr. Hazel Chapman'.toUpperCase(),
      icon: Icons.bug_report,
    ),
    HealthCheck(
      title: 'Nutritional Control',
      date: '2.10.2022',
      doctorName: 'Dr. Tyler Carter'.toUpperCase(),
      icon: Icons.local_dining,
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: FadeInImage(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: AssetImage(widget.imgPath ??
                              'assets/images/_project/Account/black_dog.png'),
                          image: AssetImage(widget.imgPath ??
                              'assets/images/_project/Account/black_dog.png'),
                          imageErrorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            widget.imgPath ??
                                'assets/images/_project/Account/black_dog.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {},
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage(widget
                                            .imgPath ??
                                        'assets/images/_project/Account/black_dog.png'),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.black,
                                    // child: Icon(
                                    //   // Icons.edit,
                                    //   size: 18,
                                    //   color: Colors.white,
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(widget.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color.fromRGBO(82, 60, 154, 1))),
                          Text('Dog',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InfoCard(title: 'Age', value: '6'),
                  InfoCard(title: 'Sex', value: 'Male'),
                  InfoCard(title: 'Weight', value: '48 lbs'),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Last Health Check",
                            style: titleTextStyle,
                          ),
                          GestureDetector(
                            child: Row(
                              children: [
                                Text(
                                  "View all",
                                  style: viewAllTextStyle,
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Color.fromRGBO(101, 201, 244, 1))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: healthChecks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(healthChecks[index].icon),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Text(
                                    healthChecks[index].title!,
                                    style: titleTextStyle,
                                  ),
                                ),
                                Text(
                                  healthChecks[index].date!,
                                )
                              ],
                            ),
                            subtitle: Text('${healthChecks[index].doctorName}'),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class InfoCard extends StatefulWidget {
  final String? title;
  final String? value;

  InfoCard({this.title, this.value});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.value!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.title!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthCheck {
  final String? title;
  final String? date;
  final String? doctorName;
  final IconData? icon;

  HealthCheck({this.title, this.date, this.doctorName, this.icon});
}
