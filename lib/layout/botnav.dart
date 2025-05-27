import 'package:flutter/material.dart';
class botnav extends StatefulWidget {
  const botnav({Key? key}) : super(key: key);

  @override
  State<botnav> createState() => _botnavState();
}

class _botnavState extends State<botnav> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          print(_currentIndex);
          if(_currentIndex==0)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/mainpage');
          }
          else if(_currentIndex==1)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/view_job');
          }
          else if(_currentIndex==2)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/view_resources_student');
          }
          else if(_currentIndex==3)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/post_comp_std');
          }
          else if(_currentIndex==4)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/post_feedback_std');
          }
        });

      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',

          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Job',

          icon: Icon(Icons.note),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.note_add),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.note),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.description),
        ),
      ],
    );
  }
}
