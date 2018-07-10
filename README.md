# SCKTEffects

A collection of SpriteKit and SceneKit animation helper classes, written in Swift.

It is based on SKTUtils, which was originally written for the book [iOS Games by Tutorials, Second Edition](http://raywenderlich.com/store/ios-games-by-tutorials), which is published through [raywenderlich.com](http://raywenderlich.com).

## Introducting SCKTEffects

SCKTEffects is based on SKTEffects, which is part of SKTUtils. It allows you to run translate, rotate and scale actions in Sprite Kit and Scene Kit using custom timing functions.

Note: The iOS 8 version of Sprite Kit includes an `SKAction.timingFunction` property, but unfortunately it is [pretty useless](https://openradar.appspot.com/radar?id=6464265753985024). It's a step in the right direction, but it still won't let you perform the kinds of effects that make games juicy.

The only reason `SKTEffects` exists is because `SKAction` does not allow arbitrary timing functions, only standard ease-in and ease-out. The `SKTEffect` subclasses are re-implementations of what `SKAction` already does but with the addition of custom timing functions.

## What can SCKTEffects do for you?

There are currently three `SKTEffect` subclasses:

- `SKTMoveEffect`
- `SKTRotateEffect`
- `SKTScaleEffect`

You use them like this:

```swift
let moveEffect = SKTMoveEffect(node: node, duration: 1.0, startPosition: startPoint, endPosition: endPoint)

moveEffect.timingFunction = SKTTimingFunctionBounceEaseOut

node.runAction(SKAction.actionWithEffect(moveEffect))
```

First you create the `SKTMoveEffect` object and pass it the node that it should animate, the duration of the animation in seconds, and the starting and ending position of the node.

Then you (optionally) set the timing function on the effect object. You can use the supplied timing functions -- for example, elastic, bounce, and many others -- or create your own. See **SKTTimingFunctions.swift** for a complete list.

Finally, you wrap the effect object inside a regular `SKAction` and run that action on the node.

The process for `SKTRotateEffect` and `SKTScaleEffect` is identical, but you specify rotation angles and scale vectors, respectively.

You can combine multiple effects at the same time, e.g. have more than one scale effect going at once on the same node.

### Warning about SKTScaleEffect

IMPORTANT: When using `SKTScaleEffect`, the node that you're scaling must *not* have a physics body, otherwise the physics body gets scaled as well and collision detection becomes unpredictable (objects may suddenly move through other objects).

To solve this, make a new `SKNode`, give it the physics body, and add the node that you're scaling as a child node.

### Caveats

Currently there is no "relative" version of the effects. You always have to supply an absolute starting and ending position, rotation angle, or scale. Most of the time this is no big deal, but it does mean you cannot put them into repeating actions.

For example, the demo project does the following to rotate a node every second by 45 degrees:

```swift
node.runAction(SKAction.repeatActionForever(SKAction.sequence([
  SKAction.waitForDuration(0.75),
  SKAction.runBlock {
    let effect = SKTRotateEffect(node: node, duration: 0.25, startAngle: node.zRotation, endAngle: node.zRotation + π/4)

    effect.timingFunction = SKTTimingFunctionBackEaseInOut

    node.runAction(SKAction.actionWithEffect(effect))
  }])))
```

If the effects had a relative version, this could have simply been written as:

```swift
let effect = SKTRotateEffect(node: node, duration: 0.25, byAngle: π/4)

effect.timingFunction = SKTTimingFunctionBackEaseInOut

node.runAction(SKAction.repeatActionForever(SKAction.sequence([
  SKAction.waitForDuration(0.75),
  SKAction.actionWithEffect(effect)
  ])))
```

Not only is this simpler to read, it also saves you from having to create a new effect instance for every repetition. However, this doesn't work in the current version of the library.

Effects keep state (unlike `SKActions`), so you should not reuse the same effect instance in multiple actions.

If you use a lot of effects over a long period of time, you may run into memory fragmentation problems, because you need to allocate a new object for every effect. Currently, effects cannot be reset, so it's tricky to put them into an object pool and reuse them.

Because actions keep state, you cannot put them into an action after a delay if the node also moves in the mean time. In other words, doing the following may or may not work:

```swift
let effect = SKTMoveEffect()

let action = SKAction.sequence([
  SKAction.waitForDuration(5.0),
  SKAction.actionWithEffect(effect)
  ])
```

If the node has moved during the delay, either through another `SKAction`, physics, or the app changing the node's `position` property, then the effect will start in the wrong place.

## Unit tests

The **Examples/Tests** folder contains an Xcode project with unit tests for SKTUtils. Press Command+U to run the tests.
