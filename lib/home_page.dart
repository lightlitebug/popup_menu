import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void selectedMenu(String selectedMenu) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected'),
          content: Text('$selectedMenu selected'),
        );
      },
    );
  }

  void _showPopupMenu() async {
    String selected = await showMenu(
      context: context,
      // initialValue: 'New Release',
      position: RelativeRect.fromLTRB(1000, 1000, 0, 0),
      items: <PopupMenuEntry<String>>[
        CheckedPopupMenuItem(
          value: 'New Release',
          checked: true,
          child: ListTile(
            leading: Icon(Icons.new_releases),
            title: Text('New Release'),
          ),
        ),
        PopupMenuItem(
          value: 'Note Add',
          child: ListTile(
            leading: Icon(Icons.note_add),
            title: Text('Note Add'),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 'Notification Important',
          child: ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notification Important'),
          ),
        ),
        PopupMenuItem(
          value: 'Pages',
          child: ListTile(
            leading: Icon(Icons.pages),
            title: Text('Pages'),
          ),
        ),
        PopupMenuItem(
          value: 'Zoom Out Map',
          child: ListTile(
            leading: Icon(Icons.zoom_out_map),
            title: Text('Zoom Out Map'),
          ),
        ),
        PopupMenuItem(
          value: 'Camera',
          child: ListTile(
            leading: Icon(Icons.camera),
            title: Text('Camera'),
          ),
        ),
        PopupMenuItem(
          value: 'Watch Later',
          child: ListTile(
            leading: Icon(Icons.watch_later),
            title: Text('Watch Later'),
          ),
        ),
      ],
    );

    if (selected == null) {
      return;
    }

    selectedMenu(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () => selectedMenu('Add Box'),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => selectedMenu('Account Circle'),
          ),
          PopupMenuButton(
            offset: Offset(0, 100),
            // icon: Icon(Icons.more_vert),
            child: Center(
              child: Text('More...'),
            ),
            onSelected: (value) {
              selectedMenu(value);
            },
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: 'New Release',
                  child: ListTile(
                    leading: Icon(Icons.new_releases),
                    title: Text('New Release'),
                  ),
                ),
                PopupMenuItem(
                  value: 'Note Add',
                  child: ListTile(
                    leading: Icon(Icons.note_add),
                    title: Text('Note Add'),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: 'Notification Important',
                  child: ListTile(
                    leading: Icon(Icons.notification_important),
                    title: Text('Notification Important'),
                  ),
                ),
                PopupMenuItem(
                  value: 'Pages',
                  child: ListTile(
                    leading: Icon(Icons.pages),
                    title: Text('Pages'),
                  ),
                ),
                PopupMenuItem(
                  value: 'Zoom Out Map',
                  child: ListTile(
                    leading: Icon(Icons.zoom_out_map),
                    title: Text('Zoom Out Map'),
                  ),
                ),
                PopupMenuItem(
                  value: 'Camera',
                  child: ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                  ),
                ),
                PopupMenuItem(
                  value: 'Watch Later',
                  child: ListTile(
                    leading: Icon(Icons.watch_later),
                    title: Text('Watch Later'),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: _showPopupMenu,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepOrangeAccent,
            child: Center(
              child: Text(
                'Click Me',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
