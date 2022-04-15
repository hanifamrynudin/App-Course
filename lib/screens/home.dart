import 'package:flutter/material.dart';
import 'package:proyecto/models/course.dart';
import 'package:proyecto/screens/detail.dart';
import 'package:proyecto/utils/assets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            background(),
            SafeArea(
              child: Column(
                children: [
                  header(),
                  search(),
                  const SizedBox(height: 28),
                  menuCourse(),
                  // menuCourseGridViewCount(),
                  // menuCourseGridBuilder(),
                  const SizedBox(height: 28),
                  titleList(
                      'Course Progress (' +
                          Assets.courses.length.toString() +
                          ')',
                      () {}),
                  courseProgress(),
                  titleList('Mentor', () {}),
                  mentor(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget menuCourseGridBuilder() {
  return SizedBox(
    height: 200,
    child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.2,
        ),
        itemCount: Assets.menuCourse.length,
        itemBuilder: (context, index) {
          Map mapCourses = Assets.menuCourse[index];
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image: AssetImage(mapCourses['image']),
                            fit: BoxFit.cover)),
                    child: GestureDetector(
                      onTap: () {
                        MaterialPageRoute(
                          builder: (context) => Detail(map: mapCourses),
                        );
                      },
                    )),
              )
            ],
          );
        }),
  );
}

Widget menuCourseGridViewCount() {
  return SizedBox(
    height: 250,
    child: GridView.count(
      scrollDirection: Axis.horizontal,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      shrinkWrap: true,
      childAspectRatio: 4 / 3,
      children: <Widget>[
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal[500],
                  image:
                      const DecorationImage(image: AssetImage(Assets.backend))),
              padding: const EdgeInsets.all(8),
            ),
            const Text('Revolution is coming...'),
          ],
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal[500],
                  image:
                      const DecorationImage(image: AssetImage(Assets.backend))),
              padding: const EdgeInsets.all(8),
            ),
            const Text('Revolution is coming...'),
          ],
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal[500],
                  image:
                      const DecorationImage(image: AssetImage(Assets.backend))),
              padding: const EdgeInsets.all(8),
            ),
            const Text('Revolution is coming...'),
          ],
        ),
      ],
    ),
  );
}

Widget mentor() {
  return SizedBox(
    height: 120,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: Assets.proffesor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          String listProff = Assets.proffesor[index];
          return Container(
              margin: const EdgeInsets.only(right: 16),
              child: ClipRRect(
                child: Image.asset(
                  listProff,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 100,
                ),
              ));
        }),
      ),
    ),
  );
}

Widget courseProgress() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        Course course = Assets.courses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: course.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {},
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        course.image,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 5),
                            Text(course.duration),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget titleList(String title, Function function) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        GestureDetector(
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          ),
          onTap: () => function,
        ),
      ],
    ),
  );
}

Widget menuCourse() {
  return SizedBox(
    height: 215,
    child: ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 8),
      itemCount: Assets.menuCourse.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        Map map = Assets.menuCourse[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(map: map),
                ));
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == Assets.courses.length - 1 ? 16 : 8,
              0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 8,
                  color: Colors.black38,
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    map['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        map['title'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        map['modul'].toString() + ' Courses',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget search() {
  return Container(
    margin: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search..',
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.indigo,
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(0),
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
        Container(
          width: 1,
          height: 30,
          color: Colors.indigo[900],
        ),
        IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.indigo[900],
              size: 30,
            ),
            onPressed: () {}),
      ],
    ),
  );
}

Widget header() {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Halo,',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'Hanif Fadillah A',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(56),
          child: Image.asset(
            Assets.imageAvatar,
            width: 56,
            height: 56,
          ),
        )
      ],
    ),
  );
}

Widget background() {
  return Container(
    height: 376,
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage(Assets.header),
        fit: BoxFit.fill,
      ),
      color: Colors.indigo[900],
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(80),
        bottomRight: Radius.circular(80),
      ),
    ),
  );
}
