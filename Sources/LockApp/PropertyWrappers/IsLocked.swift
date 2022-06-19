//
//  IsLocked.swift
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
///     @IsLocked private var isLocked
///
///     var body: some View {
///         Text(isLocked ? "This app is locked." : "This app is unlocked.")
///     }
/// }
/// ```
@propertyWrapper public struct IsLocked: DynamicProperty {
    @Environment(\.isLockedDefault) private var isLockedDefault
    @AppStorage(isLockedAppStorageKey) private var isLocked: Bool?
    
    public init() { } // public because it is a package!
    
    public var wrappedValue: Bool {
        get {
            isLocked ?? isLockedDefault
        }
        nonmutating set {
            isLocked = newValue
        }
    }
 
    public var projectedValue: Binding<Bool> {
        Binding(
            get: { isLocked ?? isLockedDefault },
            set: { isLocked = $0 }
        )
    }
}
