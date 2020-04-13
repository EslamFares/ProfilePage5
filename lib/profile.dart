class User{
  String name,job;

  User({this.name,this.job});

}
class Profile{
  User user;

  Profile({this.user});

}

class ProfileProvider{
  static Profile profile(){
    return Profile(
      user: User(name: 'Eslam Fares',job:'Software Engineer'),
    );
  }

  static List<String> photos(){
    return List.generate(7, (index){
      return'assets/shard/man4.png';
    });
  }
  static List<String> videos(){
    return List.generate(7, (index){
      return'assets/shard/girl2.jpeg';
    });
  }
  static List<String> posts(){
    return List.generate(7, (index){
      return'Lorem ipsum dolor sit amet, consec adipiscing elit.';
    });
  }
  static List<String> friends(){
    return List.generate(7, (index){
      return'assets/shard/1.jpg';
    });
  }
}