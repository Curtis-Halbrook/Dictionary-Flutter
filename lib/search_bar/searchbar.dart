import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu_layer.dart';

///Here we have the Model for the SearchBar.  As expected, it contains only
///a single Text field, along with a convenience (though not needed in this case)
///'copyWith' method to facilitate bulk shifting of other values in the case
///where the model only updates a single field.  In this case, we only HAVE one
///field... :)
class SearchBarModel {
  final String text;

  SearchBarModel(this.text);

  //This is kind of overkill, but it would help in cases where
  //we have a model with a LOT of fields, and we only want to
  //modify one.
  //REMEMBER: in MVU we don't CHANGE values in the model, we return
  //brand new models every time.
  SearchBarModel copyWith(String text) => SearchBarModel(text);
}

///The Messenger class is the mechanism by which we declare the ways we can
///change the model, as well as setting up the initial state for the model.
///Note that this should be the ONLY way to change the model!!!
class SearchBarMessenger extends Messenger<SearchBarModel> {
  SearchBarMessenger() : super(Update(SearchBarModel('')));

  void changeText(String newText) {
    modelDispatcher(
      (model) => SearchBarModel(newText),
    );
  }

  void clearText() {
    modelDispatcher((model) => SearchBarModel(''));
  }
}

///This is a constructor class to create a SearchBar widget that reflects the
///current state of the Model.  This is an important distinction: The UI should
///always reflect Model state and allow messages to be sent that change it.
class SearchBarWidget {
  static Widget builder(
    BuildContext context,
    SearchBarMessenger messenger,
    SearchBarModel model,
  ) =>
      Container(
        child: TextFormField(
          initialValue: model.text,
          onChanged: (text) => messenger.changeText(text),
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => messenger.clearText(),
            ),
          ),
        ),
      );
}
