# Application State Management with ScopedModel

In this article, you will learn to use the **scoped_model** library to update a Flutter mask creator app which has three distinct steps: choose a size, mask & strap color, and a mask material. The **scoped_model** library provides a clean scalable way to share state throughout your widgets. This article assumes you have prior flutter experience. If you have not developed any apps using flutter please see the beginner tutorials for flutter.

## Getting Started

To get started, download the project materials using the download button at the top or bottom of this tutorial. Open up the mask-creator-starter project in visual studio code. Take a look around the project and get familiar with the folder structure, mainly the **pages**, **models** and **widgets** folders along with the **main.dart** file.

**Open** up the **terminal** in Visual Studio (VS) code and **type**:

`flutter run`

and **hit enter**. You should see the following screen in the app:

![Screenshot]()

Okay, cool! So you got the app running but if you tap the plus button and navigate through the pages tap on any of the items and hit the continue button there isn't much going on at all. In fact, the app doesn't do anything other than move you through a few different screens. Before you begin working with the scoped_model library you should first understand a few concepts around state and how it applies to this app.

## State (Theory)

Applications are made up of real world objects modeled in classes. These classes are named and contain both behavior and state. As apps grow, handling state changes can become tedious especially when some objects rely on the state of other objects. For example, consider an e-commerce app that allows you to add items to a cart for purchase. When an item gets added into your cart the state of the app changes and you can now either add more items, update existing items, remove items or checkout. Without properly designing your app to handle state management gracefully you can end up with something difficult to update or maintain. Before looking into a proper solution you should first break down the different types of state your app needs to maintain.

## Types of State

When properly designing the state management of your app it is important to think through the various features your app will provide. Does the app need to maintain session state for a logged in user? Perhaps it needs a local database to store information offline or simply save things to a collection in memory. Depending on how complicated your app is you may be dealing with several different types of state. This article will cover app state and component state.

### Application State

In your apps, you typically need to maintain user specific information such as login, settings, notification preferences, among many others. These would fall into the category of app state because they alter the behavior of the entire app. How you go about maintaining these states takes careful consideration as it will affect the internal working of your users experience in your app. It can also become pretty complex as your app grows overtime. These states influence the behavior of specific parts or your app's logical flow. Mostly however, logical flow is maintained through specific component state.

### Component State

As a user interacts with your app, they will perform functions such as creating, updating, accessing or removing content. These types of actions should yield well defined interactions with your app through the user interface (UI) components. For example, when a user wants to create something in your app it is important that they fill out all required fields before proceeding. If they don't the user should not be allowed to proceed and the UI should prevent it. This interaction with your app is addressed through **component state**.

Okay great, so now you know about state but how does this apply to the mask creator app? It is time to find out.

## Creating the Mask Builder

You should already have the app up and running from the previous sections but if not **re-run** the `flutter run` command in the terminal and you will again see a screen with a some text and a + floating action button.

**Open** the **main.dart** file and observe the `routes` block:

```dart
    routes: {
        '/': (context) => MasksList(model: this.model),
        '/size': (context) =>
            SizeSelection(routeName: '/color', model: MaskSize()),
        '/color': (context) =>
            ColorSelection(routeName: '/material', model: MaskColor()),
        '/material': (context) =>
            MaterialSelection(routeName: '/', model: MaskMaterial()),
      }
```

As you can see there really isn't anything special here. Each FeatureSelection page has a `routeName` and a `model` associated to it. You will change this over the course of this tutorial so that each selection route doesn't have to explicitly define the model in it's constructor using the scoped_model library. So first you need to **import the library** in your **pubspec.yaml** file.

**Open** the **pubspec.yaml** file and **add** the **scope_model** library to the dependencies list:

```yaml
dependencies:
  flutter:
    sdk: flutter

  scoped_model: ^1.0.1
  // omitted for brevity
```

Alright great, now you have imported the **scope_model** library which will give you access to a few objects to make note of:

**Model** - base class that allows your model code to listen for changes.
**ScopedModel** - widget that allows you to pass the model deep down your widgets hierarchy to react to changes
**ScopeModelDescendant** - widget that allows you to find the appropriate ScopedModel in the Widget tree

It is time to make use of the **Model** base class by updating the **Masks** class.

**Open** the **masks_model.dart** file and **update** the class definition as follows:

```dart
class Masks extends Model { // 1
    // omitted for brevity
}
```

Here you have made the **Masks** class *inherit* from the **Model** class of the scoped_model library.
**Note:** you will have to resolve the import for **Model** if the IDE doesn't do it for you.

Next, **delete** the **getter** for the **masks** by removing the following code:

```dart
  List<MaskItem> get masks {
    return _masks;
  }
```

Finally, **refactor** the **_masks** variable name to **masks** using **F2** (in VS code):

```dart
  List<MaskItem> masks = List<MaskItem>();
```

Okay great! You have implemented your first Model class from the scoped_model library. Next you will need to update the **MasksList** class.

**Open** the **masks_list.dart** file and **delete** the **constructor**:

```dart
 // final Masks model; <-- comment out or delete this line
 // MasksList({@required this.model}); <-- comment out or delete this constructor
```

Here you have dropped both the Masks member variable and the constructor.

Now, you need to wrap the **MasksList** in the **ScopedModelDescendent** widget. To do so **replace** the `body` of the **Scaffold** object with the following code:

```dart
body: ScopedModelDescendant<Masks>(builder: (context, child, model) { // 1
    if (model.masks.length == 0) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text('You have not created any masks'),
                ],
            ),
        );
    } else {
        return ListView.separated(
            separatorBuilder: (context, index) => ListDivider(),
            itemCount: model.masks.length,
            itemBuilder: (context, index) {
                return MaskListItem(item: model.masks[index]);
            },
        );
    }
}),

```

Here you have made the `body` a **ScopedModelDescendant** widget passing in the **Masks** type. 
**Note:** you will have to resolve the import for **ScopedModelDescendent** if the IDE doesn't do it for you.

Next, you will need to update the **main.dart** file to make use of this new model.

**Open** the **main.dart** file and **replace** the `main()` method call with the following code:

```dart
void main() => runApp(MyApp());

```

Here you have removed the `Masks()` model from the MyApp constructor call. You now need to update the **MyApp** constructor to account for this change.

**Delete** the `var Masks model` variable from the **MyApp** class and **update** the **constructor** to match the following code:

```dart
  // final Masks model; <-- 1 comment out or delete this line
  const MyApp({Key key}) : super(key: key); // 2
```

Here you have removed the variable model from the class and removed it from the constructor for **MyApp**.

In order to provide the **Masks** model to the rest of the app you need to wrap the entire **MaterialApp** width with a **ScopedModel**.

In the build method, **copy the entire contents** of the **MaterialApp** widget and past it into a **ScopedModel** widget passing in the **Masks** model:

```dart
    return ScopedModel<Masks>( // 1
      model: Masks(), // 2
      child: MaterialApp(
        title: 'Mask Creator',
        routes: {
          '/': (context) => MasksList(), // 3
          '/size': (context) => SizeSelection(routeName: '/color', model: MaskSize()),
          '/color': (context) =>
              ColorSelection(routeName: '/material', model: MaskColor()),
          '/material': (context) =>
              MaterialSelection(routeName: '/', model: MaskMaterial()),
        },
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.red,
          fontFamily: 'Baloo',
          primaryIconTheme: IconThemeData(),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
```

Here you have:
1. Wrapped the MaterialApp in a ScopedModel widget of type Masks
2. Provided the Masks model to the entire app
3. update the MasksList constructor to no longer take the Masks model

**Note:** you will have to resolve the import for **ScopedModel** if the IDE doesn't do it for you.

Alright, phew. That was a lot of work. Next you will start to see some real power of the scoped_model library.

First, you will need to update the **MaskSize** class in a similar way.

### Choosing a size

**Open** the **size_step_model.dart** file and **add** the following to the class definition:

```dart
class MaskSize extends Model { // 1
    // omitted for brevity
}
```

Here you have made **MaskSize** *inherit* from the **Model** class of the **scoped_model** library.

Next, **delete** the **getter** for **maskSizes** by removing the following code:

```dart
  List<SizeItem> get maskSizes {
    return sizes;
  }
```

And then **refactor** the **variable** name from `sizes` to `maskSizes` using **F2** (in VS code):

```dart
    var maskSizes = List<SizeItem>();
```

Okay, great work you are almost ready to see some real changes.

**Open** the **size_step.dart** file in the **pages** folder and **update** the following lines as so:

```dart
  // 1 final MaskSize model;
  SizeSelection({@required this.routeName}); // 2
```

Here you have:
1. removed the MaskSize model member variable (or commented it out)
2. removed the required constructor parameter for the SizeSelection class.

This causes an error but you will fix that in the next step.

After the return statement of the build method you need to add the **ScopeModel** widget and wrap the whole **Scaffold** widget. 

To do this, **copy** the entire **contents** of the **Scaffold** Object *(excluding the ; at the end)* being returned and **paste** the following code:

```dart
    return ScopedModel<MaskSize>(
      model: MaskSize(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose a size"),
        ),
        body: ScopedModelDescendant<MaskSize>(builder: (context, child, model) {
          return SafeArea(
            bottom: true,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => ListDivider(),
                    itemCount: model.maskSizes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: SizeListItem(item: model.maskSizes[index]),
                        onTap: () {
                          model.setSelected(index);
                        },
                      );
                    },
                  ),
                ),
                _buildButtonBar(context, model)
              ],
            ),
          );
        }),
      ),
    );
```

Finally, you will need to update the **main.dart** file to no longer pass the **MaskSize** model in the constructor of the **SizeSelection** widget in the `routes` object.

**Open** the **main.dart** file and **replace** the **SizeSelection** `route` with the following code:

```dart
    '/size': (context) => SizeSelection(routeName: '/color'),
```

**Clean up any unused imports** at the top of the file.

**Re-run** the app using `flutter run` from the **terminal** and **tap the plus button** to get to the size selection screen.

![Screenshot]()


Okay so nothing really changed right? It is time to make the component react to the size selection.

**Open** the **size_step_model.dart** file again and **replace** the **setSelected** method with the following code:

```dart
  void setSelected(int index) {
    if (selected != -1) {
      maskSizes[selected].setSelected(false);
    }

    if (index != selected) {
      selected = index;
      maskSizes[selected].setSelected(true);
    } else {
      selected = -1;
    }
    notifyListeners(); // 1
  }
```

Here you have added the `notifyListeners()` method call from the **Model** object in the **scoped_model** library. Now you only need to update one more code snippet before seeing some state change in the app.

**Re-open** the **size_step.dart** file and **navigate** to the **NextButton** widget of the `_buildButtonBar` method and **overwrite** it with the following code:

```dart
    enabled: model.selected != -1, // 1
    nextAction: () {
        var homeModel = ScopedModel.of<Masks>(context); // 2
        homeModel.size = model.maskSizes[model.selected]; // 3
        Navigator.pushNamed(context, this.routeName);
    }),
```

Here you have:
1. Added some logic to the `enabled` state of the **NextButton**
2. You have found the **Masks** model named `homeModel` since it is coming from the home page of the app through the **MaterialApp** widget which is possible do to the **ScopedModel** widget you wrapped **MaterialApp** with from the previous step.
3. Set the `size` in the Masks model `size` attribute.

**Re-run** the app from **terminal** using `flutter run`

![Screenshot of disabled and no check]()
![Screenshot of enabled and a check]()

Great job! You just updated the state of the SizeSelection step to enable and disable the continue button based on the MaskSize model's selected attribute. You also found the Masks model and update the global app state by setting the **MaskSize** object in the `homeModel`.

Next, you will need to do this with the other 2 steps in the mask builder.

### Choosing color

**Open** the **color_step_model.dart** file and make the **MaskColor** class *inherit* from **Model** with the following code:

```dart
class MaskColor extends Model {
    // omitted for brevity
}
```

Next, **update** the `setSelectedMaskColor` to call `notifyListeners();` by **replacing the method** with the following code:

```dart
  void setSelectedMaskColor(int maskColorIndex) {
    if (selectedMaskColor != -1) {
      maskColors[selectedMaskColor].setSelected(false);
    }

    if (maskColorIndex != selectedMaskColor) {
      selectedMaskColor = maskColorIndex;
      maskColors[selectedMaskColor].setSelected(true);
    } else {
      selectedMaskColor = -1;
    }

    notifyListeners(); // 1
  }
```

Here you have added the `notifyListeners()` method call from the Model base class. 

You need to do the same for the `setSelectedStrapColor` method by **replacing the method** with the following code:

```dart
  void setSelectedStrapColor(int strapColorIndex) {
    if (selectedStrapColor != -1) {
      strapColors[selectedStrapColor].setSelected(false);
    }

    if (strapColorIndex != selectedStrapColor) {
      selectedStrapColor = strapColorIndex;
      strapColors[selectedStrapColor].setSelected(true);
    } else {
      selectedStrapColor = -1;
    }
    notifyListeners(); // 1
  }
```

Here you have added the `notifyListeners()` method call similar to the step above.


Next, **open** the **color_step.dart** file. **Remove or comment** out the **MaskColor** member variable and **update** the **constructor** to match the following code:

```dart
  // 1 final MaskColor model;
  ColorSelection({@required this.routeName}); // 2
```
Here you have:
1. Removed or commented out the member variable for MaskColor
2. Update the constructor to no longer require the MaskColor model to be passed in

Next, **update** the `build` method to wrap the **Scaffold** object in a **ScopedModel** with type **MaskColor** by **replacing the return** statement with the following code:

```dart
return ScopedModel<MaskColor>( // 1
      model: MaskColor(), // 2
      child: ScopedModelDescendant<MaskColor>(builder: (context, child, model) { // 3
        return Scaffold(
          appBar: AppBar(
            title: Text("Choose a color"),
          ),
          body: SafeArea(
            bottom: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                createMaskColorSection('Masks', model),
                createStrapColorSection('Straps', model),
                Spacer(),
                Row(
                  children: <Widget>[
                    PreviousButton(text: 'Back'),
                    NextButton(
                        text: 'Continue',
                        enabled: true,
                        nextAction: () {
                          Navigator.pushNamed(context, routeName);
                        }),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
```

Here you have:
1. Made the build method return a ScopeModel widget with a model of type MaskColor
2. You have added the MaskColor model to the ScopedModel widget
3. Wrapped the Scaffold widget in a ScopedModelDescendent

Next, update the NextButton logic to react to the selected color state change for both the mask and strap colors.

**Replace** the **NextButton**'s `enabled` and `nextAction` properties with the following code:

```dart
    enabled: model.selectedMaskColor != -1 && model.selectedStrapColor != -1, // 1
    nextAction: () {
        var homeModel = ScopedModel.of<Masks>(context); // 2
        homeModel.mColor = model.maskColors[model.selectedMaskColor]; // 3
        homeModel.sColor = model.strapColors[model.selectedStrapColor]; // 4
        Navigator.pushNamed(context, routeName);
    },
```

Here you have:
1. Updated the NextButton's `enabled` property to react to the mask and strap selected color properties
2. Found the Masks model named homeModel from the ScopedModelDescendant
3. Updated the homeModel's mColor (mask color) property with the selected color from the Widget
4. Updated the homeModel's sColor (strap color) property with the selected color from the Widget

Finally, **open** the **main.dart** file to account for the updated constructor of the **ColorSelection** `route` by replacing the `route` with the following code:

```dart
'/color': (context) => ColorSelection(routeName: '/material'),
```

**Re-run** the app from **terminal** using `flutter run`

![Screenshot of disabled and no check]()
![Screenshot of enabled and a check]()


Great job! Now your app will have some state in the color selection component as well as hold onto the mask and strap color selections. You have also made the widgets NextButton react the the selection state to make sure both a mask and strap color selection are made before proceeding. Only two more widgets to update!

### Choosing materials

**Open** the **material_step_model.dart** file and **update** the **class** definition to *inherit* from the **Model** base class with the following code:

```dart
class MaskMaterial extends Model {
    // omitted for brevity
}
```

**Delete** the `materials` getter be **removing** the following lines of code:

```dart
  List<MaterialItem> get materials {
    return _materials;
  }
```

**Refactor** the `_material` member variable to be named `materials` using **F2**:

```dart
  var materials = List<MaterialItem>();
```

Finally, **update** the `setSelected` method to call `notifyListeners()` be **replacing the method** with the following code:

```dart
  void setSelected(int index) {
    if (selected != -1) {
      materials[selected].setSelected(false);
    }

    if (index != selected) {
      selected = index;
      materials[selected].setSelected(true);
    } else {
      selected = -1;
    }
    notifyListeners(); // 1
  }
```

Here you have added the `notifyListeners()` method call from the Model base class. Now you have to update the MaterialSelection step similar to the other selection steps from above.

**Open** the **material_step.dart** file and **remove** the *member variable* for **MaskMaterials** and **remove** the required **MaskMaterial** `model` from the constructor:

```dart
// 1 final MaskMaterial model;
  MaterialSelection({@required this.routeName}); // 2
```

Here you have:
1. Removed the MaskMaterial member variable
2. Updated the constructor to account for this change

Next, **update** the `build` method to return a **ScopedModel** widget and set its child to a **ScopedModelDescendent** with the **Scaffold** widget **as its return type** with the following code:

```dart
return ScopedModel<MaskMaterial>( // 1
      model: MaskMaterial(), // 2
      child:
          ScopedModelDescendant<MaskMaterial>(builder: (context, child, model) { // 3
        return Scaffold(
          appBar: AppBar(
            title: Text("Choose a material"),
          ),
          body: SafeArea(
            bottom: true,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => ListDivider(),
                    itemCount: model.materials.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: MaterialListItem(item: model.materials[index]),
                        onTap: () {
                          model.setSelected(index);
                        },
                      );
                    },
                  ),
                ),
                _buildButtonBar(context, model),
              ],
            ),
          ),
        );
      }),
    );
```

Here you have:
1. Returned a ScopedModel with type MaskMaterial
2. Provide the MaskMaterial model as the model for the ScopedModel widget
2. Set the child of the ScopedModel widget to a ScopedModelDescendant wrapping the Scaffold widget


Next, **update** the **NextButton**'s `enabled` attribute of the `_buildButtonBar` method with the following code:

```dart
enabled: model.selected != -1,
```


Finally, update the route for the MaterialSelection in the main.dart file.

**Open** the **main.dart** file and **replace** the **MaterialSelection** `route` with the following code:

```dart
'/material': (context) => MaterialSelection(routeName: '/'),
```

**Re-run** the app from **terminal** using `flutter run`

![Screenshot of disabled and no check]()
![Screenshot of enabled and a check]()

You have now finished all 3 steps in the mask builder process. Great job. Give yourself a pat on the back. But there is just one more step to add the created mask to the Masks model so it shows up in the list of masks on the main page!

### Confirmation

**Navigate** to the **widgets** folder and **open** the **confirmation_dialog.dart** file. **Update** the `saveMask` method with the following code:

```dart
 void saveMask(context, model) {
    var homeModel = ScopedModel.of<Masks>(context); // 1
    homeModel.material = model.materials[model.selected]; // 2
    homeModel.createNewMask(nameController.text); // 3
    Navigator.popUntil(context, ModalRoute.withName(widget.routeName));
  }
```

Here you have:
1. Found the Masks model named homeModel from the ScopedModel widget
2. Set the homeModel's material property to the selected material from the previous step
3. Called the createNewMask method using the text from the on screen dialog as its name

Finally, you need to **call** `notifyListeners()` by **updating** the **MasksModel** `createNewMask` method by **replacing** it with the following code:

```dart
  void createNewMask(String maskName) {
    // add a Mask
    masks.add(MaskItem(
        name: maskName,
        size: this.maskSize,
        maskColor: this.mColor,
        strapColor: this.sColor,
        material: this.maskMaterial));

    notifyListeners(); // 1
  }
```

Here you have added the `notifyListeners()` method call from the Model base class.

**Re-run** the app from **terminal** using `flutter run`

![Screenshot of disabled and no check]()
![Screenshot of enabled and a check]()

Congratulations you made it to the end of this scoped_model tutorial. As you can see there is quite a bit of plumbing to setup the scoped_model library but once it is setup the process is fairly simple to follow for updating your models to provide your Widgets the ability to listen to the changes within them! If you were unable to complete the tutorial please download the mask-creator-finished project and take a look around the code to see if you made any mistakes. 

## Where to Go from Here
If you had fun with this tutorial you can try to update the applications to save the masks to a database or try to abstract the plumbing of the scoped model setup to its own abstract base class so there is less boiler plate setup. Leave a comment or rating below if you liked this tutorial!
