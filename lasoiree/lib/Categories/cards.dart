import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String image;
  final Widget route;

  const CardWidget({
    Key? key,
    this.image = '',
    this.name = '',
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Container(
        width: double.infinity,
        height: 130,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[700]),
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
