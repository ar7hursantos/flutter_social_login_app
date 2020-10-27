import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/user_model.dart';
import '../../../shared/util/asuka_messages_util.dart';
import '../../../shared/util/theme_util.dart';
import '../../home/presenter/stores/home_store.dart';
import 'drawer_app_store.dart';
import 'states/drawer_app_state.dart';

class DrawerAppPage extends StatefulWidget {
  @override
  _DrawerAppPageState createState() => _DrawerAppPageState();
}

class _DrawerAppPageState extends ModularState<DrawerAppPage, DrawerAppStore> {
  final List<ReactionDisposer> _disposers = [];
  GlobalKey<ScaffoldState> _homeScaffoldKey;
  GlobalKey<ScaffoldState> _drawerAppKey;
  HomeStore _homeStore;

  @override
  void initState() {
    super.initState();
    _homeStore = Modular.get<HomeStore>();
    _homeScaffoldKey = _homeStore.homeScaffoldKey;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers.add(
      reaction((_) => controller.state, (stateResult) {
        if (stateResult is DrawerAppLoadingState) {
          AsukaMessagesUtil.showLoading();
        } else {
          AsukaMessagesUtil.hideLoading(_homeScaffoldKey);
          if (stateResult is DrawerAppErrorState) {
            AsukaMessagesUtil.showDefaultSnackBar(stateResult.error.message);
          }
        }
      }),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _drawerAppKey,
      child: _buildDrawer(),
    );
  }

  List<MenuItemData> getMenuItemDataList() {
    return [
      MenuItemData(
        'SAIR',
        Icons.exit_to_app,
        isLast: true,
        callback: () => controller.logout(_homeStore.userStore.currentUser),
      ),
    ];
  }

  Widget _buildHeader() {
    return Observer(builder: (_) {
      var currentUser = _homeStore.userStore.currentUser;
      var username = (currentUser?.name != null && currentUser.name.isNotEmpty)
          ? currentUser?.name
          : '';
      var email = currentUser?.email != null ? currentUser?.email : '';

      var userImage = CachedNetworkImage(
        imageUrl: currentUser?.photoUrl != null
            ? currentUser?.photoUrl
            : UserModel.defaultPhotoUrlPath,
        imageBuilder: (context, imageProvider) => Container(
          width: 175.w,
          height: 175.w,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: ThemeUtil.primaryColor,
              width: 7.h,
            ),
          ),
        ),
        placeholder: (context, url) => ClipOval(
          child: Image.asset(
            "assets/images/load_01.gif",
            height: 175.w,
            width: 175.w,
            fit: BoxFit.cover,
          ),
        ),
        errorWidget: (context, url, error) => ClipOval(
          child: Image.asset(
            UserModel.defaultPhotoUrlPath,
            height: 175.w,
            width: 175.w,
            fit: BoxFit.cover,
          ),
        ),
      );

      var usernameText = Padding(
        padding: EdgeInsets.only(top: 12.h, bottom: 9.h),
        child: Text(
          username,
          style: TextStyle(
              fontFamily: 'Ubuntu_Regular',
              fontWeight: FontWeight.w300,
              fontSize: 33.sp,
              color: Color(0xFF707070)),
        ),
      );

      var userEmailText = Text(
        email,
        style: TextStyle(
            fontFamily: 'Ubuntu_Light',
            fontWeight: FontWeight.w300,
            fontSize: 26.sp,
            color: Color(0xFF707070)),
      );

      return Container(
        margin: EdgeInsets.only(
            top: ThemeUtil.isHighScreeDefinition ? 60.h : 50.h,
            bottom: ThemeUtil.isHighScreeDefinition ? 44.h : 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            userImage,
            usernameText,
            userEmailText,
          ],
        ),
      );
    });
  }

  Widget _buildDrawer() {
    Widget _buildDrawerTile(MenuItemData menuItemData) {
      return Container(
        height: ThemeUtil.isHighScreeDefinition ? 104.h : 125.h,
        margin: EdgeInsets.symmetric(
            horizontal: ThemeUtil.isHighScreeDefinition ? 7.w : 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              dense: true,
              leading: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: ThemeUtil.isHighScreeDefinition ? 14.w : 30.w),
                child: Icon(
                  menuItemData.icon,
                  color: Color(0xFF707070),
                  size: ThemeUtil.isHighScreeDefinition ? 50.sp : 55.sp,
                ),
              ),
              title: Align(
                alignment: Alignment(
                    ThemeUtil.isHighScreeDefinition ? -1.9.w : -2.0.w, 0.0),
                child: Text(
                  menuItemData.title,
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 28.sp,
                    fontFamily: 'Ubuntu_Medium',
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              onTap: menuItemData.callback,
            ),
          ],
        ),
      );
    }

    var menuListView = Container(
      height: ThemeUtil.isHighScreeDefinition ? 890.h : 840.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          itemCount: getMenuItemDataList().length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => Divider(
                color: Color(0xFF707070).withAlpha(100),
                height: 0.0,
                indent: 30.w,
                endIndent: 35.w,
              ),
          itemBuilder: (context, index) {
            final item = getMenuItemDataList()[index];
            return _buildDrawerTile(item);
          }),
    );

    return Container(
      width: 100.w,
      color: Color(0xFFF2F2F2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(children: <Widget>[
            _buildHeader(),
            menuListView,
          ])
        ],
      ),
    );
  }
}

class MenuItemData {
  final String title;
  final IconData icon;
  final bool isLast;
  final void Function() callback;

  MenuItemData(this.title, this.icon, {this.isLast = false, this.callback});
}
