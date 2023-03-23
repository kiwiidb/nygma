import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BottomNavigationDotBar extends StatefulWidget {
  final List<BottomNavigationDotBarItem> leftItems;
  final List<BottomNavigationDotBarItem> rightItems;
  final Color color;
  final int currentIndex;

  const BottomNavigationDotBar({
    required this.leftItems,
    required this.rightItems,
    required this.currentIndex,
    this.color = Colors.black45,
  });

  @override
  State<StatefulWidget> createState() => _BottomNavigationDotBarState();
}

class _BottomNavigationDotBarState extends State<BottomNavigationDotBar> {
  late Color _color;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    _color = Colors.black45;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(31),
          color: Color(0xFF751515d),
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _createNavigationIconButtonList(
                        widget.leftItems.asMap()),
                  ),
                ),
                const SizedBox(width: 56.0),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _createNavigationIconButtonList(
                        widget.rightItems.asMap()),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  List<_NavigationIconButton> _createNavigationIconButtonList(
      Map<int, BottomNavigationDotBarItem> mapItem) {
    List<_NavigationIconButton> children = <_NavigationIconButton>[];
    mapItem.forEach((index, item) => children.add(_NavigationIconButton(
          item.icon,
          _color,
          item.onTap,
          item.id == widget.currentIndex,
        )));

    return children;
  }
}

class BottomNavigationDotBarItem {
  final IconData icon;
  final NavigationIconButtonTapCallback onTap;
  final int id;
  const BottomNavigationDotBarItem(
      {required this.icon, required this.onTap, required this.id})
      : assert(icon != null);
}

typedef NavigationIconButtonTapCallback = void Function();

class _NavigationIconButton extends StatefulWidget {
  final IconData _icon;
  final Color _colorIcon;
  final NavigationIconButtonTapCallback _onTapInternalButton;
  final bool _isActive;

  const _NavigationIconButton(
    this._icon,
    this._colorIcon,
    this._onTapInternalButton,
    this._isActive,
  );

  @override
  _NavigationIconButtonState createState() => _NavigationIconButtonState();
}

class _NavigationIconButtonState extends State<_NavigationIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  double _opacityIcon = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.93).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (_) {
          _controller.forward();
          setState(() {
            _opacityIcon = 0.7;
          });
        },
        onTapUp: (_) {
          _controller.reverse();
          setState(() {
            _opacityIcon = 1;
          });
        },
        onTapCancel: () {
          _controller.reverse();
          setState(() {
            _opacityIcon = 1;
          });
        },
        onTap: () {
          widget._onTapInternalButton();
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedOpacity(
            opacity: _opacityIcon,
            duration: const Duration(milliseconds: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget._icon, color: widget._colorIcon),
                AnimatedContainer(
                  padding: EdgeInsets.only(top: widget._isActive ? 4 : 0),
                  duration: const Duration(milliseconds: 300),
                  width: widget._isActive ? 4 : 0,
                  height: widget._isActive ? 8 : 0,
                  child: const CircleAvatar(
                      radius: 4, backgroundColor: kWhiteColor),
                ),
              ],
            ),
          ),
        ),
      );
}
