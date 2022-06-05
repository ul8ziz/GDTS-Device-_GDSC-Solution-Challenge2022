import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  //const TipsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder:(context,index) => buildPostItem(context,index),
        itemCount: 10,
        separatorBuilder: (context,index)=>SizedBox(height: 10.0,),
      ),
    );
  }
  Widget buildPostItem(context,index)=> SingleChildScrollView(
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Text('Tips',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 10.0,),
            Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  Container(
                    height: 25.0,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    height: 25.0,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        '#flutter',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.blue),
                      ),
                      minWidth: 1.0,
                    ),
                  ),
                ],
              ),
            ),
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-photo/showing-tablet-s-blank-screen_155003-21288.jpg?w=900'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
