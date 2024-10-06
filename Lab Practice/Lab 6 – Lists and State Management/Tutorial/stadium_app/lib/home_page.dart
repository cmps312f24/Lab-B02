import 'package:flutter/material.dart';
import 'package:stadium_app/repo/stadium_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSearchBar = false;
  var _stadiums = [];
  var repo = StadiumRepo();

  @override
  void initState() {
    repo.getStadiums().then((stadiums) {
      _stadiums = stadiums;
      print(_stadiums);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (!_showSearchBar)
            IconButton(
                onPressed: () {
                  setState(() {
                    _showSearchBar = true;
                  });
                },
                icon: const Icon(Icons.search))
        ],
        title: const Text('Stadium App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            if (_showSearchBar)
              TextField(
                onChanged: (value) => {
                  setState(() {
                    _stadiums = repo.filterStadiums(value);
                  })
                },
                decoration: InputDecoration(
                  hintText: 'Search Stadium',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showSearchBar = false;
                        });
                      },
                      icon: const Icon(Icons.close)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                          'assets/images/${_stadiums[index].imageName}.jpg'),
                      title: Text(_stadiums[index].name),
                      subtitle: Text(_stadiums[index].city),
                      trailing: _stadiums[index].status == 'Completed'
                          ? const Icon(Icons.comment_bank_outlined,
                              color: Colors.green)
                          : const Icon(Icons.cancel, color: Colors.red),
                    );
                  },
                  itemCount: _stadiums.length),
            )
          ],
        ),
      ),
    );
  }
}
