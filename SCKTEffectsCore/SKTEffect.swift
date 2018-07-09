/*
 * Copyright (c) 2013-2017 Razeware LLC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/// Allows you to perform actions with custom timing functions.
public class SKTEffect<T: EffectNode> {
    unowned var node: T
    public var duration: TimeInterval
    public var timingFunction: ((CGFloat) -> CGFloat)?
    
    public init(node: T, duration: TimeInterval) {
        self.node = node
        self.duration = duration
        timingFunction = SKTTimingFunction.linear
    }
    
    public func update(_ t: CGFloat) {
        // empty implementation
    }
}

/// Moves a node from its current position to a new position.
public class SKTMoveEffect<T: EffectNode>: SKTEffect<T> {
    var startPosition: T.Position
    var delta: T.Position
    var previousPosition: T.Position
    
    public init(node: T, duration: TimeInterval, from start: T.Position, to end: T.Position) {
        previousPosition = node.position
        startPosition = start
        delta = end - start
        
        super.init(node: node, duration: duration)
    }
    
    public override func update(_ t: CGFloat) {
        // This allows multiple SKTMoveEffect objects to modify the same node at the same time.
        let newPosition = startPosition + delta * t
        let diff = newPosition - previousPosition
        previousPosition = newPosition
        node.position += diff
    }
}

/// Scales a node to a certain scale factor.
public class SKTScaleEffect<T: EffectNode>: SKTEffect<T> {
    var startScale: T.Scale
    var delta: T.Scale
    var previousScale: T.Scale
    
    public init(node: T, duration: TimeInterval, from start: T.Scale, to end: T.Scale) {
        previousScale = node.scale
        startScale = start
        delta = end - start
        super.init(node: node, duration: duration)
    }
    
    public override func update(_ t: CGFloat) {
        let newScale = startScale + delta * t
        let diff = newScale / previousScale
        previousScale = newScale
        node.scale *= diff
    }
}

/// Rotates a node to a certain angle.
public class SKTRotateEffect<T: EffectNode>: SKTEffect<T> {
    var startAngle: T.Rotation
    var delta: T.Rotation
    var previousAngle: T.Rotation
    
    public init(node: T, duration: TimeInterval, from start: T.Rotation, to end: T.Rotation) {
        previousAngle = node.rotation
        startAngle = start
        delta = end - start
        super.init(node: node, duration: duration)
    }
    
    public override func update(_ t: CGFloat) {
        let newAngle = startAngle + delta * t
        let diff = newAngle - previousAngle
        previousAngle = newAngle
        node.rotation += diff
    }
}
