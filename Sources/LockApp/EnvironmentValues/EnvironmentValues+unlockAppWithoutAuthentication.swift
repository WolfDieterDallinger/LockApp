//
//  EnvironmentValues+unlockAppWithoutAuthentication.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 31.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

private struct MyEnvironmentKey: EnvironmentKey {
    static var defaultValue = false
}

extension EnvironmentValues {
    /// The `EnvironmentKey` used by the `View` method `unlockAppWithoutAuthentication()` and the `LockAppButton`.
    ///
    /// Default value is false.
    ///
    /// Only for internal use.
    var unlockAppWithoutAuthentication: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}
