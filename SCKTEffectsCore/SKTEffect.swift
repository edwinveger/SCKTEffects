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

public typealias TimingFunction = ((CGFloat) -> CGFloat)

/// A simple struct containing several effect configuration properties.
public struct EffectConfiguration<T: Mathable> {
    
    /// The start value of the effect.
    var start: T {
        didSet {
            delta = end - start
        }
    }
    
    var delta: T {
        get {
            return end - start
        }
        set {
            end = start + delta
        }
    }
    
    var end: T {
        didSet {
            delta = end - start
        }
    }
    
    /// Do not set manually.
    var previous: T
}

/// Allows you to perform actions with custom timing functions.
public protocol SKTEffect: class {
    associatedtype Node: EffectNode
    associatedtype Property: Mathable
    
    var node: Node { get }
    var duration: TimeInterval { get set }
    var configuration: EffectConfiguration<Property> { get set }
    
    var timingFunction: TimingFunction { get set }
    
    func update(_ t: CGFloat)
}

extension SKTEffect {
    
    /// Adjust the effect duration.
    ///
    /// - Parameter duration: The new duration.
    /// - Returns: An effect object.
    public func withDuration(_ duration: TimeInterval) -> Self {
        self.duration = duration
        return self
    }
    
    /// Adjust the starting value.
    ///
    /// - Parameter start: The new starting value.
    /// - Returns: An effect object.
    public func starting(at start: Property) -> Self {
        configuration.start = start
        return self
    }

    /// Animate a specific change.
    /// - Note: This will affect the `end` of the animation.
    ///
    /// - Parameter change: The change you wish to animate.
    /// - Returns: An effect object.
    public func animating(_ change: Property) -> Self {
        configuration.delta = change
        return self
    }
    
    /// Use a custom timing function.
    ///
    /// - Parameter timingFunction: The custom timing function you want the effect to use.
    /// - Returns: An effect object.
    public func using(_ timingFunction: @escaping TimingFunction) -> Self {
        self.timingFunction = timingFunction
        return self
    }

    /// Adjust the ending value.
    ///
    /// - Parameter end: The new ending value.
    /// - Returns: An effect object.
    public func ending(at end: Property) -> Self {
        configuration.end = end
        return self
    }
}
