import 'package:flutter/material.dart';
import 'package:prfilepage5/profile.dart';

class Profile5 extends StatefulWidget {
  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5>
    with SingleTickerProviderStateMixin {
  static Color _textColor = Colors.grey.shade400; //Color(0xff4e4e4e);
  bool _visible = false;
  Profile _profile = ProfileProvider.profile();
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: _textColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: _textColor,
            ),
          )
        ],
      ),
      body: _dodyContent(context),
    );
  }

  Widget _dodyContent(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _profileDetails(context),
        ],
      ),
    );
  }

  Widget _profileDetails(BuildContext context) {
    return  Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Column(children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 135,
                      height: 135,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 116,
                      height: 116,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('assets/shard/1.jpg'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ])),
//==============without border circle==============
//          Container(
//            width: 135,
//            height: 135,
//            margin: EdgeInsets.only(bottom: 24),
//            decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                image: DecorationImage(
//                    image: ExactAssetImage('assets/shard/1.jpg'),
//                    fit: BoxFit.cover)),
//          ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                _profile.user.name,
                style: TextStyle(
                    color: _textColor, fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                _profile.user.job,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            _followButton(context),
            SizedBox(
              height: 10,
            ),
            Flexible(child: _tabBarContent(context)),
          ],
        ),
      );

  }

  Widget _followButton(BuildContext context) {
    Color _buttonColor = Color(0xfff05522);
    return Align(
      child: MaterialButton(
        elevation: 0,
        color: _buttonColor,
        child: AnimatedPadding(
          duration: Duration(milliseconds: 400),
          padding:
              EdgeInsets.symmetric(horizontal: _visible ? 16 : 2, vertical: 8),
          child: Text(
            'FOLLOW',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }

  Widget _tabBarContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(color: Colors.grey.shade800, width: 1),
            bottom: BorderSide(color: Colors.grey.shade800, width: 1),
          )),
          child: TabBar(
            unselectedLabelColor: Colors.grey.shade600,
            indicatorColor: _textColor,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: 35,
            ),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'PHOTOS',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ),
                icon: Icon(
                  Icons.photo,
                  size: 20,
                ),
              ),
              Tab(
                child: Text(
                  'VIDIOS',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ),
                icon: Icon(
                  Icons.video_library,
                  size: 20,
                ),
              ),
              Tab(
                child: Text(
                  'POSTS',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ),
                icon: Icon(
                  Icons.assignment,
                  size: 20,
                ),
              ),
              Tab(
                child: Text(
                  'FRIENDS',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ),
                icon: Icon(
                  Icons.people,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _photos(context),
              _videos(context),
              _posts(context),
              _friends(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _photos(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          children: ProfileProvider.photos().map((photo) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(image: ExactAssetImage(photo))),
            );
          }).toList()),
    );
  }

  Widget _videos(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          children: ProfileProvider.videos().map((vid) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(image: ExactAssetImage(vid))),
            );
          }).toList()),
    );
  }

  Widget _posts(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: ProfileProvider.posts().map((post) {
            return Container(
              height: 10,
              child: Card(
                child: ListTile(
                  subtitle: Text(post),
                  title: Text('post',style: TextStyle(fontSize: 20),),
                ),
              ),
            );
//              Container(
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(20.0),
//                  image: DecorationImage(image: ExactAssetImage(post))),
//            );
          }).toList()),
    );
  }

  Widget _friends(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          children: ProfileProvider.friends().map((fri) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(image: ExactAssetImage(fri))),
            );
          }).toList()),
    );
  }
}
