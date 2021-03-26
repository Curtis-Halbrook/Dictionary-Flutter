part of searchbar;

class _SearchBarView extends StatefulWidget {
  final _SearchBarViewModel viewModel;

  _SearchBarView(this.viewModel);

  @override
  _SearchBarViewState createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<_SearchBarView> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    print("debug building _SearchBarViewState");
    return Container(
      child: TextField(
        controller: _controller,
        onChanged: widget.viewModel.onNewSearchTerm,
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              widget.viewModel.onClearPressed.call();
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}