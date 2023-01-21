//packages
import 'package:uuid/uuid.dart';

//titles
const String appTitle = "Ambient Navi アプリ試作";
const String signupTitle = "新規登録";
const String loginTitle = "ログイン";

//texts
const String mailAddressText = "メールアドレス";
const String passwordText = "パスワード";
const String signupText = "新規登録を行う";
const String loginText = "ログインする";
const String logoutText = "ログアウトする";

//FieldKey
const String usersFieldKey = "users";

//message key
const String userCreateMsg = "ユーザーが作成できました";
const String loadingMsg = "読み込み中です";

//bottom
const String homeText = "Home";
const String searchText = "Search";
const String profileText = "Profile";
String returnUuidV4() {
  const Uuid uuid = Uuid();
  return uuid.v4();
}

String returnJpgFileName() => "${returnUuidV4()}.jpg";
