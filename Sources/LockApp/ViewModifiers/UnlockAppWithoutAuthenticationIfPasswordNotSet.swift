//
//  UnlockAppWithoutAuthenticationIfPasswordNotSet.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 30.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

fileprivate struct MyEnvironmentKey: EnvironmentKey {
    static var defaultValue = false
}

extension EnvironmentValues {
    // Property is used by LockAppButton, too.
    var unlockAppWithoutAuthenticationIfPasswordNotSet: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}

fileprivate struct UnlockAppWithoutAuthenticationIfPasswordNotSet: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.unlockAppWithoutAuthenticationIfPasswordNotSet, true)
    }
}

public extension View {
    /**
     A `View` method to customize the ``LockAppButton`` to unlock the app without authentication if the password is not set.

     For security reasons the ``LockAppButton`` does not unlock the app if the password is not set. Use this `View` method high enough in the view hierarchy to customize the ``LockAppButton`` to unlock the app without authentication if the password is not set.
     
     ```swift
     MyView()
         .unlockAppWithoutAuthenticationIfPasswordNotSet()
     ```
     */
    func unlockAppWithoutAuthenticationIfPasswordNotSet() -> some View {
        modifier(UnlockAppWithoutAuthenticationIfPasswordNotSet())
    }
}
