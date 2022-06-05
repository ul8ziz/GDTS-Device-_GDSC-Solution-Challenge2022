import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class CheckupsScreen extends StatelessWidget {
  const CheckupsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:buildPostItem(context),

    );
  }

  Widget buildPostItem(context)=> SingleChildScrollView(
    child: Column(
      children: [
        Card(
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

                Row(
                  children: [
                    Text('121',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text('Heealth status  ',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: Colors.black54)

                    ),

                    Text('Normal statble',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: HexColor('0d9d8d'),)


                    ),
                  ],
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Container(
                        height: 12.0,
                        child: Text(
                          '2022-6-5 7:44 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Card(
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
                Row(
                  children: [
                    Text('110',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text('Heealth status  ',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: Colors.black54)
                      ,
                    ),

                    Text('Normal statble',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: HexColor('0d9d8d'),)

                    ),
                  ],
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [

                      Container(
                        height: 12.0,
                        child: Text(
                          '2022-6-4 4:20 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Card(
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
                Row(
                  children: [
                    Text('120',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text('Heealth status  ',
                        style: Theme.of(context).textTheme.bodyText1
                            .copyWith(color: Colors.black54)

                    ),

                    Text('Normal statble',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: HexColor('0d9d8d'),
                      ))
                  ],
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [

                      Container(
                        height: 12.0,
                        child: Text(
                          '2022-6-4 5:32 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Card(
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
                Row(
                  children: [
                    Text('122',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text('Heealth status  ',
                        style: Theme.of(context).textTheme.bodyText1
                            .copyWith(color: Colors.black54)

                    ),

                    Text('Normal statble',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: HexColor('0d9d8d'),))
                  ],
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [

                      Container(
                        height: 12.0,
                        child: Text(
                          '2022-6-4 3:30 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Card(
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
                Row(
                  children: [
                    Text('125',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text('Heealth status  ',
                        style: Theme.of(context).textTheme.bodyText1
                            .copyWith(color: Colors.black54)

                    ),

                    Text('Normal statble',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: HexColor('0d9d8d'),))
                  ],
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [

                      Container(
                        height: 10.0,
                        child: Text(
                          '2022-6-4 1:41 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Card(
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
                Row(
                  children: [
                    Text('110',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text('Heealth status  ',
                        style: Theme.of(context).textTheme.bodyText1
                            .copyWith(color: Colors.black54)

                    ),

                    Text('Normal statble',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: HexColor('0d9d8d'),))
                  ],
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [

                      Container(
                        height: 12.0,
                        child: Text(
                          '2022-6-4 2:24 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Card(
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
                Row(
                  children: [
                    Text('112',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text('Heealth status  ',
                        style: Theme.of(context).textTheme.bodyText1
                            .copyWith(color: Colors.black54)

                    ),

                    Text('Normal statble',
                      style: Theme.of(context).textTheme.bodyText1
                          .copyWith(color: HexColor('0d9d8d'),))
                  ],
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [

                      Container(
                        height: 12.0,
                        child: Text(
                          '2022-6-3 7:55 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
