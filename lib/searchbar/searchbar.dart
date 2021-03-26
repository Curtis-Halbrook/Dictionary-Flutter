library searchbar;

import 'package:dictionary_flutter/redux/definitions/definitions_actions.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:dictionary_flutter/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

part 'searchbar_container.dart';
part 'searchbar_view.dart';
part 'searchbar_viewmodel.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _SearchBarContainer(),
    );
  }
}
