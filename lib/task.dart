import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

class TaskIcon {
  final String iconName;
  final String icon;
  TaskIcon(this.icon, this.iconName);
}

class ToDoApp extends StatelessWidget {
  ToDoApp({Key? key}) : super(key: key);

  final List<TaskIcon> _list = [
    TaskIcon('assets/images/fast-food.png', 'fast-food'),
    TaskIcon('assets/images/books.png', 'books'),
    TaskIcon('assets/images/game-controller.png', 'game-controller'),
    TaskIcon('assets/images/mechanic.png', 'mechanic'),
    TaskIcon('assets/images/paint-palette.png', 'palette'),
    TaskIcon('assets/images/running.png', 'Exercise'),
    TaskIcon('assets/images/spotify.png', 'music'),
    TaskIcon('assets/images/travel.png', 'travel'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18.0),
                const Text(
                  'Choose Habit',
                  style: TextStyle(fontSize: 25.5, fontWeight: FontWeight.bold),
                ),
                const Text(
                    'Choose your daily habit, you can choose \n more than one'),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(child: FavoriteHabits(list: _list)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          child: const Text(
                            'Get Started!',
                            style: TextStyle(),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: Container(
            width: 100,
            child: FloatingActionButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.edit, size: 20),
                  Text(
                    'New Habits',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              onPressed: () {},
            ),
          )),
    );
  }
}

class FavoriteHabits extends StatelessWidget {
  const FavoriteHabits({
    Key? key,
    required List<TaskIcon> list,
  })  : _list = list,
        super(key: key);

  final List<TaskIcon> _list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.grey)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(_list[index].icon), height: 100),
              const SizedBox(
                height: 30,
              ),
              Text(_list[index].iconName)
            ],
          ),
        );
      },
      itemCount: _list.length,
    );
  }
}
