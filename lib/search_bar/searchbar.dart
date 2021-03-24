import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu_layer.dart' as Mvu;

///Here we have the Model for the SearchBar.  As expected, it contains only
///a single Text field, along with a convenience (though not needed in this case)
///'copyWith' method to facilitate bulk shifting of other values in the case
///where the model only updates a single field.  In this case, we only HAVE one
///field... :)
class Model {
  final String text;

  Model(this.text);

  //This is kind of overkill, but it would help in cases where
  //we have a model with a LOT of fields, and we only want to
  //modify one.
  //REMEMBER: in MVU we don't CHANGE values in the model, we return
  //brand new models every time.
  Model copyWith(String text) => Model(text);
}

///The Messenger class is the mechanism by which we declare the ways we can
///change the model, as well as setting up the initial state for the model.
///Note that this should be the ONLY way to change the model!!!
class Messenger extends Mvu.Messenger<Model> {
  Messenger(text) : super(Mvu.Update(Model(text)));

  void changeText(String newText) => modelDispatcher(
        (model) => Model(newText),
      );

  void clearText() => modelDispatcher((model) => Model(''));
}

///This is a constructor class to create a SearchBar widget that reflects the
///current state of the Model.  This is an important distinction: The UI should
///always reflect Model state and allow messages to be sent that change it.
class SearchBarWidget {
  static Widget builder(
    BuildContext context,
    Messenger messenger,
    Model model,
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
