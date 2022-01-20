import 'package:GainSystemsApp/redux/actions.dart';
import 'package:GainSystemsApp/redux/app_state.dart';
import 'package:GainSystemsApp/schemas/businessNode.dart';
import 'package:GainSystemsApp/schemas/memberNode.dart';
import 'package:GainSystemsApp/schemas/memberType.dart';
import 'package:GainSystemsApp/schemas/roleNode.dart';
import 'package:GainSystemsApp/schemas/teamNode.dart';
import 'package:GainSystemsApp/widgets/account_screen/account_sections/business_direction_screen/add_team_member_business_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart' as redux;

import 'account_screen/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'account_screen/account_sections/business_direction_screen/business_direction.dart';
import 'account_screen/account_sections/business_direction_screen/create_business.dart';
import 'account_screen/account_sections/business_direction_screen/my_team_business.dart';
import 'account_screen/account_sections/business_direction_screen/role_settings_business.dart';
import 'account_screen/account_sections/business_direction_screen/settings_business.dart';
import 'account_screen/account_sections/business_direction_screen/settings_selection_business.dart';
import 'account_screen/account_sections/categories_screen/categories.dart';
import 'account_screen/account_sections/my_account_screen/my_account.dart';
import 'account_screen/account_sections/wallets_screen/wallets.dart';
import 'calendar_screen/calendar_screen.dart';
import 'chat_screen/chat_screen.dart';
import 'finance_screen/finance_screen.dart';
import 'general_screen/general_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:GainSystemsApp/graphql/base/query/get_me.dart';
import 'package:GainSystemsApp/schemas/userNode.dart';

class MainPageScreenWidget extends StatefulWidget {
  MainPageScreenWidget({Key? key}) : super(key: key);

  @override
  _MainPageScreenWidgetState createState() => _MainPageScreenWidgetState();
}

class _MainPageScreenWidgetState extends State<MainPageScreenWidget> {
  String currentTub = 'generalScreen';
  String nameBusiness = '';
  String directionBusiness = '';
  String iconHome = 'assets/images/icon_home.svg';
  String iconCalendar = 'assets/images/icon_calendar.svg';
  String iconFinance = 'assets/images/icon_finance.svg';
  String iconChat = 'assets/images/icon_chat.svg';

  final PageStorageBucket bucket = PageStorageBucket();

  void updateCurrentTub(String newCurrentTub) {
    setState(() {
      currentTub = newCurrentTub;
    });
  }

  void updateSettingsBusinessScreenWidget(
      String showNameBusiness, String showDirectionBusiness) {
    setState(() {
      nameBusiness = showNameBusiness;
      directionBusiness = showDirectionBusiness;
    });
  }

  double minWidthMaterialButton = 17;
  double sizeLabelTextBottonMeu = 11;
  double widthSizeIconBottomMenu = 20;
  double heightSizeIconBottomMenu = 20;

  Color greenColorMenu = Color.fromRGBO(91, 207, 140, 1);

  @override
  Widget build(BuildContext context) {
    final redux.Store<AppState> store = StoreProvider.of<AppState>(context);
    final mapScreenWidgets = {
      'generalScreen': GeneralScreenWidget(updateCurrentTub: updateCurrentTub),
      'calendarScreen': CalendarScreenWidget(),
      'financeScreen': FinanceScreenWidget(),
      'chatScreen': ChatScreenWidget(),
      'accountScreen': AccountScreenWidget(updateCurrentTub: updateCurrentTub),
      'myAccountScreen':
          MyAccountScreenWidget(updateCurrentTub: updateCurrentTub),
      'myBusinessesScreen': BusinessDirectionWidget(
          updateCurrentTub: updateCurrentTub,
          updateSettingsBusinessScreenWidget:
              updateSettingsBusinessScreenWidget),
      'myWalletsScreen': WalletsWidget(updateCurrentTub: updateCurrentTub),
      'categoriesScreen':
          CategoriesScreenWidget(updateCurrentTub: updateCurrentTub),
      'createBusinessScreen':
          CreateBusinessScreenWidget(updateCurrentTub: updateCurrentTub),
      'settingsBusinessScreen':
          SettingsBusinessScreenWidget(updateCurrentTub: updateCurrentTub),
      'myTeamMembersScreen':
          MyTeamBusinessScreenWidget(updateCurrentTub: updateCurrentTub),
      'roleSettingsBusinessScreen':
          RoleSettingsBusinessScreenWidget(updateCurrentTub: updateCurrentTub),
      'settingsSelectionBusinessScreen': MainSettingsSelectionBusiness(
          updateCurrentTub: updateCurrentTub,
          nameBusiness: nameBusiness,
          directionBusiness: directionBusiness),
      'addTeamMemberBusiness': AddTeamMemberBusinessScreen(
        updateCurrentTub: updateCurrentTub,
      ),
    };
    StatefulWidget currentScreen = mapScreenWidgets.entries
        .firstWhere((element) => element.key == currentTub)
        .value;

    return Query(
      options: QueryOptions(document: gql(getMeQuery)),
      builder: (QueryResult result, {refetch, fetchMore}) {
        print('result ${result.data}');
        if (result.isLoading) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
                child: Image.network(
                    'https://mir-s3-cdn-cf.behance.net/project_modules/disp/ab79a231234507.564a1d23814ef.gif')),
          );
        }
        if (result.data != null &&
            result.data!['getMe']['user'] != null &&
            !result.hasException) {
          List<Business> businesses = [];
          for (var item in result.data!['getMe']['user']['businesses']) {
            print('TEAMS: ${item['teams']}');
            List<Team> teams = [];
            for (var member in item['teams']) {
              teams.add(Team(
                  id: int.parse(member['id'].toString()),
                  email: member['email'].toString(),
                  role: Role(
                      id: int.parse(member['role']['id'].toString()),
                      name: member['role']['name'].toString(),
                      description: ''),
                  member: Member(
                      email: member['role']['member']['email'].toString(),
                      firstName:
                          member['role']['member']['firstName'].toString(),
                      middleName:
                          member['role']['member']['middleName'].toString(),
                      profilePicture: !member['role']['member']
                                  ['profilePicture']
                              .toString()
                              .isEmpty
                          ? member['role']['member']['profilePicture']
                              .toString()
                          : 'https://cdn3.iconfinder.com/data/icons/avatars-15/64/_Ninja-2-512.png'),
                  memberType: MemberType.OWNER));
            }
            businesses.add(Business(
              id: int.parse(item['id'].toString()),
              title: item['title'].toString(),
              description: item['description'].toString(),
              teams: teams.isEmpty ? [] : teams,
              roles: [],
            ));
          }
          print(
              " TYPE RUNTIME!!! ${result.data!['getMe']['user']['profilePicture'].runtimeType}");
          print(
              'VALUE!!! ${result.data!['getMe']['user']['profilePicture'].toString()}');
          print(
              'VALUE!!! ${result.data!['getMe']['user']['profilePicture'].toString().isEmpty}');
          var userNode = User(
              id: int.parse(result.data!['getMe']['user']['id'].toString()),
              email: result.data!['getMe']['user']['email'].toString(),
              firstName: result.data!['getMe']['user']['firstName'].toString(),
              phone: result.data!['getMe']['user']['phone'].toString(),
              profilePicture: result.data!['getMe']['user']['profilePicture']
                      .toString()
                      .isEmpty
                  ? 'https://cdn3.iconfinder.com/data/icons/avatars-15/64/_Ninja-2-512.png'
                  : result.data!['getMe']['user']['profilePicture'].toString(),
              businesses: businesses.isEmpty ? [] : businesses);
          print('USER: ${userNode} ${result.data}');
          store.dispatch(SetUserInformation(user: userNode));
          return Scaffold(
            body: PageStorage(bucket: bucket, child: currentScreen),
            floatingActionButton:
                FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
                notchMargin: 5,
                child: Container(
                    width: double.infinity,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                                minWidth: minWidthMaterialButton,
                                onPressed: () {
                                  updateCurrentTub('generalScreen');
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(iconHome,
                                          width: widthSizeIconBottomMenu,
                                          height: heightSizeIconBottomMenu,
                                          color: currentTub == 0
                                              ? greenColorMenu
                                              : Colors.grey),
                                      SizedBox(height: 5),
                                      Text('Главная',
                                          style: TextStyle(
                                              fontSize: sizeLabelTextBottonMeu,
                                              color: currentTub == 0
                                                  ? greenColorMenu
                                                  : Colors.grey))
                                    ])),
                            MaterialButton(
                                minWidth: minWidthMaterialButton,
                                onPressed: () {
                                  updateCurrentTub('calendarScreen');
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(iconCalendar,
                                          width: widthSizeIconBottomMenu,
                                          height: heightSizeIconBottomMenu,
                                          color: currentTub == 0
                                              ? greenColorMenu
                                              : Colors.grey),
                                      SizedBox(height: 5),
                                      Text('Календарь',
                                          style: TextStyle(
                                              fontSize: sizeLabelTextBottonMeu,
                                              color: currentTub == 1
                                                  ? greenColorMenu
                                                  : Colors.grey))
                                    ])),
                            SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                                minWidth: minWidthMaterialButton,
                                onPressed: () {
                                  updateCurrentTub('financeScreen');
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(iconFinance,
                                          width: widthSizeIconBottomMenu,
                                          height: heightSizeIconBottomMenu,
                                          color: currentTub == 0
                                              ? greenColorMenu
                                              : Colors.grey),
                                      SizedBox(height: 5),
                                      Text('Финансы',
                                          style: TextStyle(
                                              fontSize: sizeLabelTextBottonMeu,
                                              color: currentTub == 2
                                                  ? greenColorMenu
                                                  : Colors.grey))
                                    ])),
                            SizedBox(
                              width: 2,
                            ),
                            MaterialButton(
                                minWidth: minWidthMaterialButton,
                                onPressed: () {
                                  updateCurrentTub('financeScreen');
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(iconChat,
                                          width: widthSizeIconBottomMenu,
                                          height: heightSizeIconBottomMenu,
                                          color: currentTub == 0
                                              ? greenColorMenu
                                              : Colors.grey),
                                      SizedBox(height: 5),
                                      Text('Чат',
                                          style: TextStyle(
                                              fontSize: sizeLabelTextBottonMeu,
                                              color: currentTub == 3
                                                  ? greenColorMenu
                                                  : Colors.grey))
                                    ])),
                          ]),
                    ))),
          );
        }
        return Text('None');
      },
    );
  }
}
