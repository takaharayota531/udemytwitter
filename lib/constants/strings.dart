//packages
import 'package:uuid/uuid.dart';

//titles
const String appTitle = "Ambient Navi アプリ試作";
const String signupTitle = "新規登録";
const String loginTitle = "ログイン";
const String cropperTitle = "Cropper";
const String accountTitle = "Account";
const String themeTitle = "Theme";
const String profileTitle = "さんのページです";

//texts
const String mailAddressText = "メールアドレス";
const String passwordText = "パスワード";
const String signupText = "新規登録を行う";
const String loginText = "ログインする";
const String logoutText = "ログアウトする";
const String uploadText = "Uploadする";
const String followText = "フォローする";
const String unfollowText = "フォローを解除する";
const String nowFollowing = "フォロー中";
const String numOfFollowers = "フォロワー数";
const String tokens = "tokens";
const String PASSIVE_UID = "passiveUid";
const String IF_YOU_DONT_HAVE_AN_ACCOUNT = "アカウントをお持ちでない場合";

//FieldKey
const String usersFieldKey = "users";
const String usersFollowersKey = "followers";

//message key
const String userCreateMsg = "ユーザーが作成できました";
const String loadingMsg = "読み込み中です";

//shared_prefrences
const String IS_DARK_THEME = "isDarkTheme";

//bottom
const String homeText = "Home";
const String searchText = "Search";
const String profileText = "Profile";
String returnUuidV4() {
  const Uuid uuid = Uuid();
  return uuid.v4();
}

String returnJpgFileName() => "${returnUuidV4()}.jpg";
