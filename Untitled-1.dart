import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/models/course.dart';
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
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      itemCount: Assets.menuCourse.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Map map = Assets.menuCourse[index];
                        return Container(
                          margin: EdgeInsets.fromLTRB(
                            index == 0 ? 16 : 8,
                            0,
                            index == Assets.courses.length - 1 ? 16 : 8,
                            0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                               BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 6,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              map['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  titleList('Course on Progress (2)', () {}),
                  listOnProgress(),
                  const SizedBox(height: 28),
                  titleList('Professor', () {}),
                  const SizedBox(height: 28),
                  listProfesor(),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listProfesor() {
  return SizedBox(
    height: 100,
    child: ListView.builder(
      itemCount: Assets.proffesor.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        String imageProf = Assets.proffesor[index];
          return Container(
            margin: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == Assets.proffesor.length - 1 ? 16 : 8,
              0,
            ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 6,
                color: Colors.black38,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageProf,
              fit: BoxFit.cover,
              height: 80,
              width: 80,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          child: Icon(Icons.navigate_next),
          onTap: () => function,
        ),
      ],
    ),
  );
}

Widget listOnProgress() {
  return ListView.builder(
    itemCount: 2,
    shrinkWrap: true,
    padding: EdgeInsets.all(16),
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      Course course = Assets.courses[index];
      return Container(
        margin: EdgeInsets.fromLTRB(
          0,
          index == 0 ? 0 : 8,
          0,
          index == 1 ? 0 : 8,
        ),
        decoration: BoxDecoration(
          color: Colors.indigo[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  course.image,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      course.duration,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Material(
                borderRadius: BorderRadius.circular(100),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 40,
                      color: Colors.indigo[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget itemGrid(String image, String title, int modul) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 0),
          blurRadius: 6,
          color: Colors.black38,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$modul Modul',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    ),
  );
}

Widget search() {
  return Container(
    margin: EdgeInsets.all(16),
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
  return SingleChildScrollView(
    child: Container(
      height: 376,
      // child: Image.asset(
      //   Assets.header,
      //   fit: BoxFit.fill,
      // ),
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
    ),
  );
}
