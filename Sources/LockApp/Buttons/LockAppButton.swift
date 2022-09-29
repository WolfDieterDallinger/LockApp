//
//  LockAppButton.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 21.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import LocalAuthentication
import SwiftUI

/// A `SwiftUI` button to lock and unlock your app.
///
/// To unlock this button uses the system dialog to authenticate you with password, TouchID or FaceID.
///
/// If no password is set this button denies to unlock for security reasons. Use the `View` method `unlockAppWithoutAuthenticationIfPasswordNotSet()` to allow this button to unlock in this case without authentication.
///
/// Use the `View` method `unlockAppWithoutAuthentication()` to allow this button to unlock without authentication regardless whether a password is set or not.
public struct LockAppButton: View {
    @AppIsLocked private var appIsLocked
    @Environment(\.unlockAppWithoutAuthenticationIfPasswordNotSet) private var unlockAppWithoutAuthenticationIfPasswordNotSet
    @Environment(\.unlockAppWithoutAuthentication) private var unlockAppWithoutAuthentication
    @State private var presentAlert = false
    
    public init() { }
    
    public var body: some View {
        Button { buttonAction() } label: { LockAppButtonLabel() }
        .alert(
            String(localized: "LockAppButton:Can’t unlock", bundle: .module),
            isPresented: $presentAlert
        ) {
            Button(String(localized: "LockAppButton:Cancel", bundle: .module), role: .cancel) { }
        }
    }
    
    private func buttonAction() {
        if appIsLocked {
            unlockAction()
        } else {
            lockAction()
        }
    }
    
    private func unlockAction() {
        if unlockAppWithoutAuthentication {
            withAnimation {
                appIsLocked = false
            }
            return
        }
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = String(localized: "LockAppButton:Unlock?", bundle: .module)
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if success {
                    DispatchQueue.main.async {
                        withAnimation {
                            appIsLocked = false
                        }
                    }
                }
            }
        } else {
            if
                unlockAppWithoutAuthenticationIfPasswordNotSet,
                let error = error as? LAError,
                error.code == .passcodeNotSet
            {
                withAnimation {
                    appIsLocked = false
                }
            } else {
                presentAlert = true
            }
        }
    }
    
    private func lockAction() {
        withAnimation {
            appIsLocked = true
        }
    }
}
