//
//  EnvironmentValues+appIsLockedByDefault.swift
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
    /// The `EnvironmentKey` used by the `View` method `appIsUnlockedByDefault()` and the `PropertyWrapper` `AppIsLocked`.
    ///
    /// Default value is true.
    ///
    /// Only for internal use.
    var appIsLockedByDefault: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}
