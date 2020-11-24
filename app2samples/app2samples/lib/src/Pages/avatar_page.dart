import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.enlacejudio.com/wp-content/uploads/2018/12/Comics-stan-Lee.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://www.enlacejudio.com/wp-content/uploads/2018/12/Comics-stan-Lee.jpg'),
          placeholder: AssetImage('assets/tenor.gif'),
        ),
      ),
    );
  }
}
