//
//  SkeletonView.swift
//  SwiftUISkeleton
//
//  Created by Serhii Batsevych on 21.05.2020.
//  Copyright © 2020 Serhii Batsevych. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonView<ShapeType: Shape>: View {
    @State private var animationPosition: CGFloat = -1
    
    let shape: ShapeType
    let animation: Animation
    let gradient: Gradient
    
    public init(shape: ShapeType, animation: Animation, gradient: Gradient) {
        self.shape = shape
        self.gradient = gradient
        self.animation = animation
    }
    
    public var body: some View {
        shape
            .fill(self.gradientFill())
            .onAppear {
                withAnimation(self.animation) {
                    self.animationPosition = 2
                }
        }
    }
    
    private func gradientFill() -> LinearGradient {
        return LinearGradient(gradient: gradient, startPoint: .init(x: self.animationPosition - 1, y: self.animationPosition - 1), endPoint: .init(x: self.animationPosition + 1, y: self.animationPosition + 1))
    }
}

