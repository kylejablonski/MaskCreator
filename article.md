# Application State Management with ScopedModel

## Getting Started
In this article, you will learn to use the scoped_model library to update a Flutter mask creator application which has three distinct steps: choose a size, mask & strap color, as well as mask material. The scoped_model library provides a clean scalable way to share state throughout your widgets. This article assumes you have prior flutter experience. If you have not developed any applications using flutter please see the beginner tutorials for flutter.

To get started download, the project materials using the download button at the top or bottom of this tutorial. Open up the mask-creator-starter project in visual studio code. Take a look around the project and get familiar with the folder structure, mainly the pages, models and widgets folders along with the main.dart file. Open up the terminal in VS code and type

`flutter run`

and hit enter. You should see the following screen in the application.

[Screenshot]

Okay, cool! So you got the application running but if you tap on any of the items and hit the continue button there isn't much going on at all. In fact, the app doesn't do anything other than move you through a few different screens. Before you begin working with the scoped_model library you should first understand a few concepts around state and how it applies to this application.

## State (Theory)

Applications are made up of real world objects modeled in classes. These classes are named and contain both behavior and state. As applications grow, handling state changes can become tedious especially when some objects rely on the state of other objects. For example, consider an e-commerce application that allows you to add items to a cart for purchase. When an item gets added into your cart the state of the application changes and you can now either add more items, update existing items, remove items or checkout. Without properly designing your application to handle state management gracefully you can end up with something difficult to update or maintain. Before looking into a proper solution you should first break down the different types of state your application needs to maintain.

## Types of State

When properly designing the state management of your application it is important to think through the various features your application will provide. Does the application need to maintain session state for a logged in user? Perhaps it needs a local database to store information offline or simply save things to a collection in memory. Depending on how complicated your application is you may be dealing with several different types of state. This article will cover application state and component state.

### Application State

In your applications, you typically need to maintain user specific information such as login, settings, notification preferences, among many others. These would fall into the category of application state because they alter the behavior of the entire application. How you go about maintaining these states takes careful consideration as it will affect the internal working of your users experience in your application. It can also become pretty complex as your application grows overtime. These states can also often influence the behavior of specific parts or your application's logical flow. Mostly however, logical flow is maintained through specific component state.

### Component State

As a user interacts with your application, they will perform functions such as creating, updating, accessing or removing content. These types of actions should yield well defined interactions with your application through the user interface (UI) components. For example, when a user wants to create something in your application it is important that they fill out all required fields before proceeding. If they don't the user should not be allowed to proceed and the UI should prevent it. This interaction with your application is address through component state.

Okay great, so now you know about state but how does this apply to the mask creator app? It is time to find out.

## Creating the Mask Builder

You should already have the app up and running from the previous sections but if not re-run the `flutter run` command in the terminal and you will again see a screen with a some text and a + floating action button. 

Open the main.dart file

## View State
scoped_model

## Model
ScopedModel
ScopedModelDescendant

### Choosing a size
MaskSize
SizeSelection

### Choosing color or pattern
MaskColor
ColorSelection

### Choosing materials
MaskMaterial
MaterialSelection

### Confirmation
ConfirmationModel
ConfirmationView

### Viewing All Made masks
MaskListModel
MaskList

## Where to Go from Here
Back the application with a database
Point to other articles on RW