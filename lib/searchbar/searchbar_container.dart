part of searchbar;

class _SearchBarContainer extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => _SearchBarContainerState();
}

class _SearchBarContainerState extends State<_SearchBarContainer> {
  @override
  Widget build(BuildContext context) {
    print("debug building searchbar container state");
    return StoreConnector<AppState, _SearchBarViewModel>(
      converter: (Store<AppState> store) => _SearchBarViewModel.create(store),
      builder: (context, viewModel) {
        return _SearchBarView(viewModel);
      },
    );
  }
}