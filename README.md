# SCKTEffects

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SCKTEffectsCore.svg)](https://img.shields.io/cocoapods/v/SCKTEffectsCore.svg)

A collection of SpriteKit and SceneKit animation helper classes, written in Swift.

It is based on SKTUtils, which was originally written for the book [iOS Games by Tutorials, Second Edition](http://raywenderlich.com/store/ios-games-by-tutorials), which is published through [raywenderlich.com](http://raywenderlich.com).

## Introducting SCKTEffects

SCKTEffects is based on SKTEffects (which is part of SKTUtils). It allows you to run translate, rotate and scale actions in Sprite Kit and Scene Kit using custom timing functions.

Note: The iOS 8 version of Sprite Kit includes an `SKAction.timingFunction` property, but unfortunately it is [pretty useless](https://openradar.appspot.com/radar?id=6464265753985024). It's a step in the right direction, but it still won't let you perform the kinds of effects that make games juicy.

The only reason `SKTEffects` exists is because `SKAction` does not allow arbitrary timing functions, only standard ease-in and ease-out. The `SKTEffect` subclasses are re-implementations of what `SKAction` already does but with the addition of custom timing functions.

## What can SCKTEffects do for you?

Custom timing functions for animations! There are currently three `SKTEffect` subclasses:

- `SKTMoveEffect`
- `SKTRotateEffect`
- `SKTScaleEffect`

You typically don't include SCKTEffectsCore directly, but instead one of the pods below.

## SCKTEffectSpriteKit

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SCKTEffectsSpriteKit.svg)](https://img.shields.io/cocoapods/v/SCKTEffectsSpriteKit.svg)

```swift
import SCKTEffectsSpriteKit

let node = SKNode()

let effect = node.moveEffect()
    .withDuration(1.5)
    .using(SKTTimingFunction.elasticEaseOut)
    .ending(at: CGPoint(x: size.width / 2, y: size.height / 2))

node.run(effect.asAction())
```

#### Podfile

To integrate SCKTEffectSpriteKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
target 'TargetName' do
pod 'SCKTEffectSpriteKit'
end
```

You create the effect by calling the corresponding factory method on the node. Custom methods allow you to adjust the start, end, timing function and duration of the animation.

You can use the supplied timing functions - see **SKTTimingFunctions.swift** for a complete list.

You can combine multiple effects at the same time, e.g. have more than one scale effect going at once on the same node.

Effects keep state (unlike `SKActions`), so you should not reuse the same effect instance in multiple actions.

## SCKTEffectSceneKit

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SCKTEffectsSpriteKit.svg)](https://img.shields.io/cocoapods/v/SCKTEffectsSpriteKit.svg)

Using SCKTEffects with SceneKit is almost identical:

```swift
import SCKTEffectsSceneKit

let node = SCNNode()

let effect = node.moveEffect()
    .ending(at: CGPoint(x: size.width / 2, y: size.height / 2))

node.runAction(effect.asAction())
```

#### Podfile

To integrate SCKTEffectSceneKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
target 'TargetName' do
pod 'SCKTEffectSceneKit'
end
```
