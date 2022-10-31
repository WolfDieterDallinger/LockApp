//
//  AppIsLocked.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 20.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

/// A `PropertyWrapper` for a dynamic property to access whether the app is locked.
///
/// Usage:
///
/// ```swift
/// struct MyView: View {
///     @AppIsLocked private var appIsLocked
///
///     var body: some View {
///         Text(appIsLocked ? "This app is locked." : "This app is unlocked.")
///     }
/// }
/// ```
///
/// - Note: If you need a `Binding` with inverted boolean value take a look at the operator ! in the Framework [BindingHelper](https://github.com/WolfDieterDallinger/BindingHelper).
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
