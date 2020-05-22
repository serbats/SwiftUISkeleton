//
//  View+Skeleton.swift
//  SwiftUISkeleton
//
//  Created by Serhii Batsevych on 21.05.2020.
//  Copyright © 2020 Serhii Batsevych. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
    func skeleton(with: Bool) -> some View {
        return self.skeleton(with: with, shape: Rectangle())
    }
    
    func skeleton<ShapeType: Shape>(with: Bool, shape: ShapeType, animation: Animation = Animation.easeInOut(duration: 3).repeatForever(autoreverses: false), gradient: Gradient = Gradient(colors: [.gray, .white, .gray])) -> some View {
        return self.modifier(SkeletonModifier(loading: with, shape: shape, animation: animation, gradient: gradient))
    }
}
