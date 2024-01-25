import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceMenu extends StatefulWidget {
  const ServiceMenu({super.key});

  @override
  State<ServiceMenu> createState() => _ServiceMenuState();
}

class _ServiceMenuState extends State<ServiceMenu> {
  int _isSelected = 0;
  List menu = [
    {"name": "Haircut", "icon": Icons.headphones},
    {"name": "Facial", "icon": Icons.headphones},
    {"name": "Nails", "icon": Icons.headphones},
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Text("Our Services"),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Text("Our Services",
                    textAlign: TextAlign.start, style: TextStyle(fontSize: 22)),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 64,
                child: ListView.builder(
                  itemCount: 3,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(32),
                          onTap: () => setState(() {
                            _isSelected = index;
                          }),
                          child: CategoryListCard(
                            isSelected: index == _isSelected,
                            icon: menu[index]["icon"],
                            title: menu[index]["name"],
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        )
                      ],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: height * 0.64,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ItemListTile();
                  },
                  itemCount: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: TextButton(
                  onPressed: () {},
                  child: Text("View All Services",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 214, 0, 1), fontSize: 16)),
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        color: Color.fromRGBO(255, 214, 0, 1),
                      ),
                    ),
                    fixedSize: MaterialStatePropertyAll(Size(width, 40)),
                    overlayColor: MaterialStatePropertyAll(Color.fromRGBO(255, 214, 0, 0.05))
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemListTile extends StatelessWidget {
  const ItemListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 16, 16),
      height: height * 0.16,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Colors.black26),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: width * 0.32,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                child: Image.network(
                    fit: BoxFit.cover,
                    "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
          ),
          SizedBox(
            width: width * 0.40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Woman Medium",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "\$ 250",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 214, 0, 1)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 10,
                        // fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: width * 0.28 - 32,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.discount_rounded,
                        color: Colors.red,
                        size: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "-20%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  IconButton.filled(
                    onPressed: () {
                      // Implement toggle with backend.
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(10, 10),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 214, 0, 1)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryListCard extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;

  const CategoryListCard({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(8),
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Color.fromRGBO(255, 214, 0, 1), width: 1),
          color: isSelected ? Color.fromRGBO(255, 214, 0, 1) : Colors.white),
      child: Center(
        child: Row(
          children: [
            Icon(
              icon,
              color:
                  !isSelected ? Color.fromRGBO(255, 214, 0, 1) : Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: TextStyle(
                  color: !isSelected
                      ? Color.fromRGBO(255, 214, 0, 1)
                      : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
