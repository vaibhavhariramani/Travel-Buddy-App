import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ScrollWrapper extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final List<Widget> slivers;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Future<void> Function()? onRefresh;
  final ScrollController? scrollController;

  const ScrollWrapper({
    Key? key,
    this.appBar,
    required this.slivers,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.onRefresh,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        appBar: appBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: onRefresh == null
              ? CustomScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  slivers: slivers,
                )
              : RefreshIndicator(
                  onRefresh: onRefresh!,
                  color: Theme.of(context).indicatorColor,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  displacement: 0,
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    slivers: slivers,
                  ),
                ),
        ),
      ),
    );
  }
}
