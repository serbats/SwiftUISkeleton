# SwiftUISkeleton


SwiftUISkeleton gives easy way to animate loading of SwiftUI View.

# Requirements :gear:

- macOS 10.15.
- Xcode 11.0.
- Swift 5.0.

# Supported Platforms :iphone:

- iOS 13.0.
- tvOS 13.0.
- watchOS 6.0.
- macOS 10.15.

# Installation :computer:

### Swift Package Manager
[Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. Once you have your Swift package set up, adding `SwiftUISkeleton` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
  dependencies: [
  .package(url: "https://github.com/serbats/SwiftUISkeleton.git", .branch("master"))
  ]
```

# Features :sparkles:

- [x] SwiftUI simple, declarative syntax.
- [x] Super easy and simple to set up.
- [x] All Views are skeletonables.
- [x] Fully customizable.
- [x] Universal (iPhone, iPad, iPod, Apple TV, Apple Watch, Mac).
- [x] SwiftUI ViewModifier power.
- [x] Lightweight codebase.

# Usage :rocket:

### 

```swift
import SwiftUI
import SwiftUISkeleton

struct UsersView: View {
    @State var users: [String] = []
    
    var body: some View {
        VStack {
            Text("Test1")
                .font(.system(size: 15, weight: .bold))
                .skeleton(with: self.users.isEmpty)
            
            SkeletonForEach( self.users, quantity: 2 ) {  user in
                Text(user ?? "Test2")
                .font(.system(size: 55, weight: .bold))
                    .skeleton(with: self.users.isEmpty, shape: RoundedRectangle(cornerRadius: 15), animation: Animation.linear(duration: 1).repeatForever(autoreverses: true), gradient: Gradient(colors: [.blue, .yellow, .red, .blue]))
            }
            
            Text("Test3")
            .skeleton(with: self.users.isEmpty, shape: RoundedRectangle(cornerRadius: 8))
            
            Text("Test4")
            .skeleton(with: self.users.isEmpty, shape: Rectangle(), gradient: Gradient(colors: [.red, .black, .white, .black, .red]))
            
            Button("fade") {
                withAnimation(.easeInOut) {
                    if self.users.isEmpty {
                        self.users = ["John Doe",
                                      "Jane Doe",
                                      "James Doe",
                                      "Judy Doe"]
                    } else {
                        self.users = []
                    }
                }
            }
        }
    }
}
```

# Credits :speak_no_evil:

SwiftUISkeleton is owned and maintained by [email](mailto:serbats@ukr.net).

# License :mortar_board:

SwiftUISkeleton is released under the MIT license. See [LICENSE](https://github.com/serbats/SwiftUISkeleton/blob/master/LICENSE) for details.
