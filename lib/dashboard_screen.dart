import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_login/theme.dart';
import 'package:flutter_login/widgets.dart';
import 'login/transition_route_observer.dart';
import 'login/widgets/fade_in.dart';
import 'login/constants.dart';
// import 'login/widgets/round_button.dart';
import 'challenges/challenge_solver.dart';
import 'personal_info/personal_info.dart';
import 'login/main.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context).pushReplacementNamed('/').then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute?>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  late Animation<double> _headerScaleAnimation;
  AnimationController? _loadingController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController!,
      curve: headerAniInterval,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>?);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController!.forward();

  Widget _buildHeader(ThemeData theme) {
    final primaryColor =
        Colors.primaries.where((c) => c == theme.primaryColor).first;
    final linearGradient = LinearGradient(colors: [
      primaryColor.shade800,
      primaryColor.shade200,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 418.0, 78.0));

    return ScaleTransition(
      scale: _headerScaleAnimation,
      child: FadeIn(
        controller: _loadingController,
        curve: headerAniInterval,
        fadeDirection: FadeDirection.bottomToTop,
        offset: .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Start',
              style: theme.textTheme.headline3!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardGrid(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChallengeSolver()),
                );
              },
              child: const Text("Challenges"),
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                minimumSize: const Size(200, 100),
                primary: Colors.green,
                shadowColor: Colors.grey,
                elevation: 5,
                side: BorderSide(
                    color: Colors.green.shade400,
                    width: 2,
                    style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonalInfo()),
                );
              },
              child: const Text("Personal info"),
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                minimumSize: const Size(200, 100),
                primary: Colors.blue,
                elevation: 5,
                side: BorderSide(
                    color: Colors.blue.shade400,
                    width: 2,
                    style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              child: const Text("Log out"),
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                minimumSize: const Size(200, 100),
                primary: Colors.red,
                shadowColor: Colors.grey,
                elevation: 5,
                side: BorderSide(
                    color: Colors.redAccent.shade400,
                    width: 2,
                    style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => _goToLogin(context),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white, //theme.primaryColor.withOpacity(.1),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Expanded(
                      flex: 2,
                      child: _buildHeader(theme),
                    ),
                    Expanded(
                      flex: 8,
                      child: _buildDashboardGrid(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
