//
//  SkeletonForEach.swift
//  SwiftUISkeleton
//
//  Created by Serhii Batsevych on 21.05.2020.
//  Copyright © 2020 Serhii Batsevych. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct SkeletonForEach<Data, Content>: View where Data : RandomAccessCollection, Content: View {
    let data: Data
    private let quantity: Int
    let content: (Data.Element?) -> Content
    
    init(_ data: Data, quantity: Int = 1, @ViewBuilder content: @escaping (Data.Element?) -> Content) {
        self.data = data
        self.quantity = quantity
        self.content = content
    }
    
    var body: some View {
        ForEach(0 ..< (data.isEmpty ? quantity : data.count), id: \.self) { index in
            self.content(self.data.isEmpty ? nil : self.data.map { $0 }[index])
        }
    }
}

