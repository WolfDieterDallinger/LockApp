//
//  IfAppIsUnlocked().swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 28.09.22.
//

import SwiftUI

fileprivate struct IfAppIsUnlocked: ViewModifier {
    @AppIsLocked private var appIsLocked

    func body(content: Content) -> some View {
        if !appIsLocked {
            content
        }
    }
}

public extension View {
    /**
     A `View` method to show the `View` only if the app is unlocked.
     
     ```swift
     MyView()
         .ifAppIsUnlocked()
     ```
     */
    func ifAppIsUnlocked() -> some View {
        modifier(IfAppIsUnlocked())
    }
}
