import 'package:fim/service/preferences.dart';
import 'package:fim/net/api.dart';
import 'package:fim/pb/logic.ext.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';

var friendService = FriendService();

class FriendService with ChangeNotifier {
  List<Friend> friendList;
  Map<Int64, Friend> friendMap;

  init() async {
    print("friendService init");
    var response =
        await logicClient.getFriends(GetFriendsReq(), options: getOptions());

    friendList = response.friends;

    friendMap = Map();
    for (var friend in friendList) {
      friendMap[friend.userId] = friend;
    }
  }

  Friend get(Int64 friendId) {
    return friendMap[friendId];
  }

  void changed() {
    notifyListeners();
  }
}
