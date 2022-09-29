//
//  EnvironmentValues+unlockAppWithoutAuthenticationIfPasswordNotSet.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 30.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

private struct MyEnvironmentKey: EnvironmentKey {
    static var defaultValue = false
}

extension EnvironmentValues {
    /// The `EnvironmentKey` used by the `View` method `unlockAppWithoutAuthenticationIfPasswordNotSet()` and the `LockAppButton`.
    ///
    /// Default value is false.
    ///
    /// Only for internal use.
    var unlockAppWithoutAuthenticationIfPasswordNotSet: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}
