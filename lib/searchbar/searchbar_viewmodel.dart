part of searchbar;

class _SearchBarViewModel {
  final String searchTerm;
  final Function(String) onNewSearchTerm;
  final Function onClearPressed;

  _SearchBarViewModel(
    this.searchTerm,
    this.onNewSearchTerm,
    this.onClearPressed,
  );

  factory _SearchBarViewModel.create(Store<AppState> store) {
    return _SearchBarViewModel(
      store.state.definitionsState.word,
      (searchTerm) {
        store.dispatch(fetchDefinitionsAction(searchTerm));
      },
      () {
        store.dispatch(SetDefinitionsStateAction(DefinitionsState.initial()));
      },
    );
  }
}