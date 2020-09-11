# Application State Management with ScopedModel

## Getting Started
download materials, other articles to refer to if no experience, etc.

---

State management (Theory)
What is it?
Why does it matter?
How can it be achieved?

---

## Application State (Theory)

Applications are made up of real world objects modelled in classes. These classes are named and contain both behavior and state. As applications grow, handling state changes can become tedious especially when some objects rely on the state of other objects. For example, consider an e-commerce application that allows you to add items to a cart for purchase. When an item gets added into your cart the state of the application changes and you can now either add more items, update existing items, remove items or checkout. Without properly designing your application to handle state management gracefully you can end up with something difficult to update or maintain. Before looking into a proper solution you should first break down the different types of state your application needs to maintain.

## Types of State

When properly designing the state management of your application it is important to think through the various features your application will provide. Does the application need to maintain session state for a logged in user? Perhaps it needs a local database to store information offline or simply save things to a collection in memory. Depending on how complicated your application is you may be dealing with several different types of state. This article will cover application state and component state.

### Application State

In your applications, you typically need to maintain user specific information such as login, settings, notification preferences, among many others. These would fall into the category of application state because they alter the behavior of the entire application. How you go about maintaining these states takes careful consideration as it will affect the internal working of your users experience in your application. It can also become pretty complex as your application grows overtime. These states can also often influence the behavior of specific parts or your application's logical flow. Mostly however, logical flow is maintained through specific component state.

### Component State

As a user interacts with your application, they will perform functions such as creating, updating, accessing or removing content. These types of actions should yeild well defined interactions with your application through the user interface (UI) components. For example, when a user wants to create something in your application it is important that they fill out all required fields before proceeding. If they don't the user should not be allowed to proceed and the UI should prevent it. This interaction with your application is address through component state.


## View State
scoped_model

## Model
ScopedModel
ScopedModelDescendant

## Creating the Mask Builder

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