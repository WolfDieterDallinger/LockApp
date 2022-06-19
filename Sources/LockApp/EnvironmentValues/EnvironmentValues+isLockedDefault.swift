//
//  EnvironmentValues+isLockedDefault.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 30.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

private struct MyEnvironmentKey: EnvironmentKey {
    static var defaultValue = true
}

extension EnvironmentValues {
    /// The `EnvironmentKey` used by the `View` method `unlockOnFirstStart()`, the `PropertyWrapper` `IsLocked` and the `PropertyWrapper` `IsNotLocked`.
    ///
    /// Default value is true.
    ///
    /// Only for internal use.
    var isLockedDefault: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}
