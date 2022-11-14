//
//  UnlockAppWithoutAuthentication.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 31.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

fileprivate struct MyEnvironmentKey: EnvironmentKey {
    static var defaultValue = false
}

extension EnvironmentValues {
    // Property is used by LockAppButton, too.
    var unlockAppWithoutAuthentication: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}

fileprivate struct UnlockAppWithoutAuthentication: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.unlockAppWithoutAuthentication, true)
    }
}

public extension View {
    /**
     A `View` method to customize the ``LockAppButton`` to unlock the app without authentication.
     
     For security reasons the ``LockAppButton`` does only unlock the app with authentication. Use this `View` method high enough in the view hierarchy to customize the ``LockAppButton``  to unlock the app without authentication.
     
     ```swift
     MyView()
         .unlockAppWithoutAuthentication()
     ```
     */
    func unlockAppWithoutAuthentication() -> some View {
        modifier(UnlockAppWithoutAuthentication())
    }
}
