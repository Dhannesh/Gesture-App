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

