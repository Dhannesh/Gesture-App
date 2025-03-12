# Detecting and Handling Gestures
Users often interact with mobile devices using gestures, which are semantic actions that can update the state of the application. Flutter makes it easy to detect and handle gestures using built-in widgets. In this course, you will discover how the GestureDetector in Flutter helps you detect motions in your app that are gestures. The GestureDetector allows you to configure callbacks for the specific gestures you want to handle and allows you to detect and respond to these gestures. If multiple gesture detectors are activated, Flutter uses the gesture arena to disambiguate and invoke the callback on the right gestures. 

## Gestures in Flutter
You interact with mobile applications using gestures. These can be 
* tap gestures 
* swipe gestures 
* fling gestures
* drags
* long presses
* double tap
* swipes
* scaling gestures

The gesture system in Flutter is made up of two separate layers. The first layer is a lower-level layer which deals with raw pointer events, pointer up, pointer move, pointer down, and so on. Then, you have the second layer that deals with higher-level events. It deals with gestures or semantic actions. Unless you're building very advanced gestures in Flutter, you'll hardly ever have to deal with raw pointer events. But, you should know they exist and you should know what they do. Raw pointer events describe the location and movement of mouse pointers or finger pointers. These pointers usually contain raw data about how exactly the user is interacting with the device's screen.

Now if you want to deal with raw pointer events, you use the RawGestureDetector which is a low-level class that deals with these pointer events and knows how to handle these pointer events. Flutter handles four different types of pointer events. We have the PointerDownEvent, that's when your pointer or the finger has contacted the screen at a certain location. The PointerMoveEvent is when the pointer has moved from one location to another.

The PointerUpEvent means the pointer has stopped moving and has stopped contacting the screen. The PointerCancelEvent is when the input from the pointer is no longer directed to the app. The input has moved away somewhere. Now, when you tap your finger or pointer down on the app, the Flutter framework does what's known as a hit test on your app to determine which widget is under the pointer. It's possible that your app has several overlapping widgets.

The hit test is used to determine which is the widget that you tapped on or pointed to. Pointer events are then dispatched to the innermost widget found by the hit test. These pointer events are not restricted to the innermost widgets. These events bubble up from the innermost widget to all of the parent widgets.

They climb up the tree hierarchy, going straight to the root of the tree. As I'd mentioned earlier, in certain advanced cases, you might want to listen to pointer events directly. But, it's more likely that you'll just use gestures. Gestures are higher-level events. They represent semantic actions, such as tap, drag, scale, swipe, pan, and so on. Now, every gesture is made up of multiple individual pointer events. So, a number of pointer events put together make a gesture. In order to give you much more control over the gesture that you're responding to, a gesture can dispatch multiple events over its lifetime. You can have an event for when the gesture starts, when it's in progress, and when it ends, when it's cancelled and so on.

Here are some of the common gestures that Flutter supports using something known as a GestureDetector. The tap gesture, the double tap that's two quick taps in succession, the long press, that's when you hold down a widget for a little bit of time, the horizontal drag, when you swipe horizontally, the vertical drag where you swipe from top to bottom or bottom to the top, and the pan where you hold down and move the pointer across the screen. You can use the GestureDetector to detect all of these common gestures in Flutter. The GestureDetector is just a widget, just like everything else, and it knows how to recognize standard gestures. It allows you to specify callbacks for the gesture that you're interested in. So, if that gesture occurs, your callback will be invoked.

When you tap, long press, swipe, or drag a widget that's wrapped in a GestureDetector, the GestureDetector will figure out what was the exact gesture that occurred and invoke the right callback. Under certain conditions, Flutter might need to perform gesture disambiguation. At any location on the device screen, there might be multiple gesture detectors at play.

So, let's say you performed a tap or a swipe, it's possible to activate more than one GestureDetector. These GestureDetectors then use a gesture recognizer to determine which gesture to react to. For a given pointer on screen, if there is more than one gesture recognizer, the framework then needs to disambiguate to find the right gesture. It needs to figure out which is the right GestureDetector to invoke.

This disambiguation is done by the framework by having every gesture recognizer that was activated join something known as the gesture arena. This is where the gesture recognizers fight it out. When a user action activates multiple gesture detectors, each GestureDetector sends its gesture recognizer to the gesture arena. The gesture arena is responsible for figuring out which gesture recognizer wins, so that the right callback can be invoked. Once in the arena, each gesture recognizer can declare defeat and leave the arena.

If just one recognizer is left in the arena, that one will be the winner. Or at any point in time, a gesture recognizer can declare victory and that will cause that recognizer to win and all of the others to lose. Typically in a gesture arena, there can be only one recognizer that wins. You might want to change this behavior, or you might want to customize other behavior characteristics that the gesture arena displays. Developers can override the implementation of the gesture arena to declare multiple winners or specify other customizations.

## Handling Tap Gestures

Mobile application users use gestures to interact with the app. These gestures can be simple gestures, such as tapping on something, maybe long pressing on something, or maybe dragging something from one place to another, or flinging something away. All of these gestures can be handled in Flutter using a very simple gesture detector.

The home property of the simple_gesture is set to the CustomerSubscription StatefulWidget. If you scroll below, you'll see that the CustomerSubscription widget is a StatefulWidget. It extends the StatefulWidget base class. you can see that I have a hardcoded list of names, customers who already subscribed, Alice, Bob, and James. 

This CustomerSubscription widget contains a text field where we can add new names, and it also contains a list of names of individuals who already subscribed. Now this text field is controlled using this nameController defined,TextEditingController. Within the build method of the State object, let's take a look at the basic structure of this app. The TextField where we can add names to subscribe is defined.

You can see that the controller property is set to the nameController. As a part of the decoration of this TextField, I have a suffixIcon, that is the add Icon. you'll see, I use the ListView builder to build up the list view of customers who already subscribed.
Its child is a ListTile. The leading icon for the ListTile is the check Icon so you can see a little check mark before each name, and the title is just a Text widget. I've defined a method called addNameToList. If the text in the nameController isNotEmpty, I update the current state of the widget.

I call setState and insert the new name at the very top of the list at index 0. And then I call nameController.clear. Well, I have this handler. Let's configure this handler within the widget. Now I want the tap gesture to be detected on the plus Icon, which is why I'm going to wrap this Icon that I have set, the suffixIcon with a GestureDetector. Observe that the suffixIcon is now set to a GestureDetector widget.
### onTap
The GestureDetector is capable of handling many different gestures based on what callback you have configured. I've specified a callback for the onTap property of the GestureDetector. So, whatever widget this GestureDetector wraps when you tap on that widget, this callback will be invoked, addNameToList which essentially inserts a new subscriber at the very beginning of our list. The rest of the code for the child property is basically defining the look and feel of the add Icon.

So, I'm going to now tap on the add icon and "givem name" has also subscribed. Now let's take a look at some of the other tap handlers that the GestureDetector supports.
### onTapDown
I'm going to set up another state variable called makeTextBlue that is initially assigned to false. I'm going to actually display the subscribers in the blue color when we tap down. So, in addition to an onTap handler, set the onTapDown property. The onTap handler checks to see whether a tap is complete. That is, you click on a widget and then you click up onTapDown is invoked when you simply tap down on a widget. You need not have completed the tap. Within the onTapDown handler, you can see that I have called setState and I set the makeTextBlue variable to true so that the text in our list will be displayed in the blue color.

I'll now go down to the ListView and update the ListTile. The color of the text displayed if makeText is Blue will be the blue color, otherwise it will be displayed in black color. Having made this change I'm going to hot restart the app so that all of my state variables are reset.

So, once again I have just three subscribers, Alice, Bob, and James. Let's now add a subscriber, Susan. I'm now going to tap down on the button and I'm still holding on. I haven't tapped up yet. And because tap down, changing the text color of the list items to blue was invoked, you can see that all of the list items are now displayed in blue. I'm holding the click.

I'll move away from the button and release the click, so the onTap has not been triggered and Susan has not been added to the subscriber list. Only if the tap is complete will Susan be added. So, now I'm going to go ahead and tap down and complete the tap on the icon and you can see that Susan has also subscribed. Our list elements are still displayed in blue because makeTextBlue is still true. 

Let's reset it to false in the addNameToList. So, once the tap is complete, I reset makeTextBlue to false. I'll hot restart the app once again to reset all of my state variables and let's now try adding a new subscriber. I'll add Jonas to the subscriber list.
### onTapUp
I'm going to set this to false in the onTapUp handler. The onTapUp handler contains an update of state where I set makeTextBlue to false. I set makeTextBlue to true. with an onTapUp, I set it to false once again.'onTapUp checks to see whether the tap up occurred on the wrapped widget.

So, the text will be blue so long as you hold the tap. Let's go ahead and try and add a new subscriber. I'll add Nora. I'm now going to hold down the tap for just a little bit. You can see the text is in blue and as soon as I leave the tap, the text goes back to black. Tap up has occurred. You can try this a few times. Thanks to the way we've set up our handlers. Each time you're holding down the icon, the text will be blue.
### onTapCancel
Whenever you leave the icon, the tap up occurs, the text goes back to black. And finally, one last tap related gesture we'll look at today, the onTapCancel. A tap cancel event occurs when you tap down on a widget that'swrapped by a GestureDetector, but the tap up occurs outside of the widget. So, you've moved your cursor away or your hand away.

Now if you cancel the tap, I'm going to pop-up a snackBar with the text that says ''Did you not want to subscribe?''. The snackBar will have a single action button, the SnackBarAction OK button, I show the snackBar using the ScaffoldMessenger. Let's go back and hot restart our app to reset the state.

I'm now going to try and subscribe a few individuals, starting with Susan. I'm going to tap on the icon, hold the tap and then tap up away from the icon. Observe that the text is all in blue. That's because tap down which made the text blue occurred, tap up did not occur, And finally, you can see the snackBar that says ''Did you not want to subscribe?''. That's because the onTapCancel handler was invoked.

### Handling Long Press and Double Tap Gestures
* onLongPress
* onLongPressDown
* onLongPressEnd
* onLongPressCancel

Now, it's possible that you want to allow users to add subscribers to the list on the long press action. So, you don't want the tap action, you want them to hold down the icon for a reasonable bit of time. That is the long press, and you want the GestureDetector to react to those events. In this commit, we'll see how you can handle the long press, double tap, and other events using the GestureDetector. The one import statement that I have added to this code is, gestures.dart.

you can see onLongPress, I add a new subscriber to the list. I invoke addNameToList. I handle the onLongPressDown event. This is where I update the state to display the text in blue, makeTextBlue is equal to true. I handle the onLongPressEnd event.

The onLongPressEnd property is the equivalent of the onTapUp. So, when you're at the end of the long press, I update the state to set makeTextBlue to false yet again. And finally,  I've defined the handler for the onLongPressCancel. This is when you start the long press on an icon or a widget and then you move away and you cancel the long press.

This of course is the equivalent of the onTapCancel, and I show a snackBar asking ''Did you not want to subscribe?''. Now, I realize that in this commit, it'll be hard for you to tell whether I'm doing a long press or just a tap. But when you're trying this code out on your own, you'll be able to tell the difference.

#### onDoubleTap
The onDoubleTap event is handled, and that's where we addNameToList, that is add a new subscriber.
Let's take a look at how this works. I have hot restarted my app. Let me try add a name using long press. I'm trying to add Joe as a subscriber here, and I have long pressed and essentially I see the snackBar that says, "Double tap to subscribe!" it's not the long press. Unfortunately, you won't be able to tell that I'm actually double tapping or double clicking, but you can see that Joe has successfully subscribed.

### InkWell and InkResponse
area of material that responds to touch

The GestureDetector is great for all kinds of tap, long press, double tap detections, but you can tell that it doesn't really highlight the widget that you're tapping on. Well, you can set up the highlights yourself, but instead of that, why not use a built-in Flutter widget for exactly this. The InkWell and InkResponse widgets in Flutter both define an Area of Material design that responds to touch. The InkWell widget has a rectangular shape. The InkResponse widget has a configurable shape.

When you perform touch actions on these classes, it animates, highlights, and creates a splash like effect on the widgets, giving you feedback that you actually performed the tap or the touch. If you take a look at the widget, you can see that all I've done is replace the GestureDetector with the InkResponse.

The InkResponse and the InkWell as well has all of the touch handlers that you can configure on the GestureDetector. onDoubleTap, I add the subscriber name to the list. When this particular widget is tapped, I want the highlightColor to be orangeAccent and I want the highlightShape to be the circle shape. Basically, it's common practice to use the InkWell or the InkResponse rather than building your own GestureDetector with highlights.  I've set the icon to be the plain plus with no radial gradient, nothing. When I longPress on it, notice you can see the orange circular highlight. It's very clear that I've actually clicked on that icon. Rather than use the RawGestureDetector for taps, long presses, double taps, et cetera, make sure you use the InkWell or InkResponse, you get the highlighting for free.

## Detecting Horizontal and Vertical Drags
we'll see how you can use the GestureDetector to detect drag gestures. It's common practice in mobile applications to have the drag mean something. Maybe you're dismissing a particular list item, maybe you're moving from one page to another. In this demo, we'll see how you can detect the horizontal and vertical drag.

Just a heads up that when you perform the drag operations on the emulator, make sure you have the mouse pressed. That's what simulates a drag. In our example here, we'll use the drag gesture for navigation. We'll navigate from the Product page to the Product Details page. If you scroll down, you'll see that the DetectDrag is a StatelessWidget and its components, basically, set up your widget tree as shown in the emulator. Within the build method, I have a Column widget defined.
The first child of the Column is the Container that holds my image. This Container with the image is defined you'll find a Center widget with a Text widget composed within it. This is the text that contains the simple product description. I have an expanded widget with an ElevatedButton within to navigate from the Product page to the Product Details page. If you click on this button, you'll navigate to the Product Details page. Observe the onPressed handler defined, I call Navigator.push and I push the MaterialPageRoute that instantiates the ProductDetails page.

Let's now switch that to using gestures. Now the way you set up the GestureDetector is that you wrap the widget on which you want to detect gestures. Here, I want the gesture to be detected across the entire page. So, anywhere you swipe on the page, I want the gesture to be captured. So, I'm going to right click on my main Scaffold, select Show Context Actions and select Wrap with widget. In this manner, I'm going to wrap the entire Scaffold of this HomePage with a GestureDetector. So, the widget is the GestureDetector, its child is now the Scaffold. This will allow us to detect gestures on the entire Scaffold, and the gesture that I want to detect first is **onHorizontalDragUpdate**. This is the handler that is invoked when you have a pointer, which can be your mouse or it can be your hand, that is in touch with the screen and moving in the horizontal direction. Within this handler on line 31, I print out the details of the delta. The delta object contains how many pixels your pointer has moved in the x and y directions. I check to see if the movement in the x direction is less than 0. Negative values of x are towards the left, positive values of x are towards the right.

So, when you move from the right to the left, dx will be less than 0. And I navigate to the Product Details page if I find that dx is less than 0. Let's check how this GestureDetector works. I'm going to restart my app and now I'm going to position my pointer on the right and move towards the left. Observe that I move to the Product Details page. If you look at the Run console, you can see the delta Offset, the dx value is -1.5. There was no vertical move, dy is 0.0.

I'm going to go back to the Product page and do the horizontal drag once again at the top of the page. Once again, I move to the Product Details page. Let's head back and this time I'm going to do a drag operation at the bottom of the page. You can see that the horizontal drag gesture is detected across the entire home page. That's because my GestureDetector wraps the Scaffold. Now I'm going to go back to the Product page and this time I'm going to do a drag from the top to the bottom. Well, on vertical drag, we did not move to the Product Details page.

If you look at the Run console, you can see the dx Offset was 0.0 and that's why the navigation was not performed. I'll do the vertical drag from the bottom to the top. Once again, dx is not negative, so no navigation was performed. Now let's say you want the navigation to be performed when you swipe from the left to the right rather than right to the left. Simply change the sign here. Check for delta.dx greater > 0. Swiping towards the right, that is from the left to the right produces a dx value greater than 0, and that's when the navigation will be performed. If you want to detect vertical drags, the property that you should set the callback for is onVerticalDragUpdate. 
So, if the change in the y position is less than 0, that means you have dragged from the bottom to the top. So, towards the top, you have negative dy and towards the bottom, you have positive dy. So, even for a very small swipe from the bottom to the top, I'll navigate to the Product Details page. I'm going to do this drag slowly. I go to the bottom of the screen and then I'm going to drag to the top and that will take me to the Product Details page. Now, the drag will work for navigation only from the bottom to the top. So, if I try to drag from the top to the bottom or from the left to the right or right to the left, none of that will work. If you want your app to respond to a drag from the top to the bottom, well, make sure you check for dy greater than 0.
A change in y position downward is a positive change. So, if dy is greater than 0, a swipe from the top to the bottom will take me to the Product Details page. Now, what if you want an action to be performed on any kind of swipe, whether it's horizontal or vertical? You specify a callback for any drag property. Here, I've set a callback for onHorizontalDragUpdate.


Instead of checking for a horizontal or vertical drag, I just check to see whether the direction is greater than 0. This will encompass both horizontal as well as vertical drags. Now, even though I have specified a callback for onHorizontalDragUpdate, this will be invoked for vertical drags as well.

So, if you choose to specify a callback for onVerticalDragUpdate, that's totally fine as well. Both horizontal and vertical drag update handlers are invoked, whenever there is a drag within a GestureDetector.
I update the state to have the dragDirection be Horizontal and I update the velocity which I get from details.velocity.pixelsPerSecond.dx. So, here I'm getting the horizontal velocity of the drag. The onVerticalDragEnd callback I update the state to have the dragDirection be Vertical and I access the velocity using details.velocity.pixelsPerSecond.dy. That'll give me the vertical velocity.

## Dismissible Widgets to Delete List Elements
we'll see how you can use drag to delete items from the list. But rather than using the GestureDetector, we'll use the Dismissible class. The Dismissible class is a widget that can be dismissed by dragging in the right direction.

I've already set up the code here and run the app. The app displays a list of products. Heels is the first product, then we have Clogs, Sandals, Flip Flops, and so on. Observe at the very right of each list item, I have a little arrow pointing towards the left. This indicates that I can get rid of a product by dragging towards the left. 

Now I have my MyStore StatelessWidget app and the body of the Scaffold is set to point to the ProductView, that is the widget that displays the list of products. you'll see that ProductView is a StatefulWidget. Every list item is wrapped in the Card widget that allows us to style the look and feel of our list item.

The child of the Card widget is set to the ListTile, and each ListTile has a title with the name of the product. The title is a simple Text widget, and the trailing property of each ListTile is set to an Icon, the arrow_back. 

This will allow us to wrap our ListTile in a Dismissible widget, so each list element will now be dismissible.
Each Dismissible widget requires the key property. You need to specify a unique key for each dismissible item so that Flutter can identify which item you've chosen to dismiss from your list of items. I'll now go ahead and add the key property to this Dismissible, and the key is simply the name of the product. I'm assuming that each of the product names is unique. If this is not the case, you'll have to choose a different key.

Now, once you have the Dismissable widget, you can swipe that widget left or right and when you do that, the onDismissed handler is called. So, I've set up a callback for this handler as well. Whenever we swipe to get rid of an item in the list, onDismissed will be called and I remove the product at the current index, that is a products.removeAt (index). Make sure that this is within the setState callback. Having made the changes to our app, I'm now ready to try out the Dismissible widget. I have the first list item selected. I'm now going to swipe towards the left/right in order to get rid of this list item. 