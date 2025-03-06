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
The GestureDetector is capable of handling many different gestures based on what callback you have configured. I've specified a callback for the onTap property of the GestureDetector. So, whatever widget this GestureDetector wraps when you tap on that widget, this callback will be invoked, addNameToList which essentially inserts a new subscriber at the very beginning of our list. The rest of the code for the child property is basically defining the look and feel of the add Icon.

So, I'm going to now tap on the add icon and "givem name" has also subscribed. Now let's take a look at some of the other tap handlers that the GestureDetector supports.

I'm going to set up another state variable called makeTextBlue that is initially assigned to false. I'm going to actually display the subscribers in the blue color when we tap down. So, in addition to an onTap handler, set the onTapDown property. The onTap handler checks to see whether a tap is complete. That is, you click on a widget and then you click up onTapDown is invoked when you simply tap down on a widget. You need not have completed the tap. Within the onTapDown handler, you can see that I have called setState and I set the makeTextBlue variable to true so that the text in our list will be displayed in the blue color.

I'll now go down to the ListView and update the ListTile. The color of the text displayed if makeText is Blue will be the blue color, otherwise it will be displayed in black color. Having made this change I'm going to hot restart the app so that all of my state variables are reset.

So, once again I have just three subscribers, Alice, Bob, and James. Let's now add a subscriber, Susan. I'm now going to tap down on the button and I'm still holding on. I haven't tapped up yet. And because tap down, changing the text color of the list items to blue was invoked, you can see that all of the list items are now displayed in blue. I'm holding the click.

I'll move away from the button and release the click, so the onTap has not been triggered and Susan has not been added to the subscriber list. Only if the tap is complete will Susan be added. So, now I'm going to go ahead and tap down and complete the tap on the icon and you can see that Susan has also subscribed. Our list elements are still displayed in blue because makeTextBlue is still true. 

Let's reset it to false in the addNameToList. So, once the tap is complete, I reset makeTextBlue to false. I'll hot restart the app once again to reset all of my state variables and let's now try adding a new subscriber. I'll add Jonas to the subscriber list.

I'm going to set this to false in the onTapUp handler. The onTapUp handler defined on lines 64 through 68 contains an update of state where I set makeTextBlue to false. I set makeTextBlue to true. with an onTapUp, I set it to false once again.'onTapUp checks to see whether the tap up occurred on the wrapped widget.

So, the text will be blue so long as you hold the tap. Let's go ahead and try and add a new subscriber. I'll add Nora. I'm now going to hold down the tap for just a little bit. You can see the text is in blue and as soon as I leave the tap, the text goes back to black. Tap up has occurred. You can try this a few times. Thanks to the way we've set up our handlers. Each time you're holding down the icon, the text will be blue.

Whenever you leave the icon, the tap up occurs, the text goes back to black. And finally,