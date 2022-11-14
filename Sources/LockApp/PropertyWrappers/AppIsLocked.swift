//
//  AppIsLocked.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 20.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

/**
 A [property wrapper](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617) for a dynamic property to access a persistently stored state whether an app is locked or not.
 
 ```swift
 struct MyView: View {
     @AppIsLocked private var appIsLocked

     var body: some View {
         Text(appIsLocked ? "This app is locked." : "This app is unlocked.")
     }
 }
 ```

 For security reasons the app is locked by default. Use the `View` method ``LockAppButton/appIsUnlockedByDefault()`` high enough in the view hierarchy to customize the app to be unlocked by default.

 - Note: If you need a `Binding` with inverted boolean value use the operator ! from the Framework [BindingHelper](https://github.com/WolfDieterDallinger/BindingHelper).
 */
@propertyWrapper public struct AppIsLocked: DynamicProperty {
    @AppStorage(appIsLockedAppStorageKey) private var appIsLocked: Bool?
    @Environment(\.appIsLockedByDefault) private var appIsLockedByDefault
    
    public init() { }
    
    public var wrappedValue: Bool {
        get {  appIsLocked ?? appIsLockedByDefault }
        nonmutating set { appIsLocked = newValue }
    }
 
    public var projectedValue: Binding<Bool> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
}
