//
//  SkeletonModifier.swift
//  SwiftUISkeleton
//
//  Created by Serhii Batsevych on 21.05.2020.
//  Copyright © 2020 Serhii Batsevych. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct SkeletonModifier: ViewModifier {
    let loading: Bool
    let overlayView: AnyView
    
    init<ShapeType: Shape>(loading: Bool, shape: ShapeType, animation: Animation, gradient: Gradient) {
        self.loading = loading
        overlayView = AnyView(SkeletonView(shape:shape, animation: animation, gradient: gradient))
    }
    
    func body(content: Content) -> some View {
        Group {
            if loading {
                content
                    .overlay(overlayView)
                    .transition(.opacity)
            } else {
                content
                    .transition(.opacity)
            }
        }
    }
}

