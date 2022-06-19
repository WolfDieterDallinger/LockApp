//
//  LockButton.swift
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
/// If no password is set the `LockButton` denies to unlock for security reasons. Use the `View` method `unlockWithoutAuthenticationIfPasswordNotSet()` to allow this button to unlock in this case without authentication.
///
/// Use the `View` method `unlockWithoutAuthentication()`to allow the `LockButton` to unlock without authentication regardless whether a password is set or not.
public struct LockButton: View {
    @IsLocked private var isLocked
    @Environment(\.unlockWithoutAuthenticationIfPasswordNotSet) private var unlockWithoutAuthenticationIfPasswordNotSet
    @Environment(\.unlockWithoutAuthentication) private var unlockWithoutAuthentication
    @State private var presentAlert = false
    
    public init() { }
    
    public var body: some View {
        Button { buttonAction() } label: { LockButtonLabel() }
        .alert(
            String(localized: "LockButton:Can’t unlock", bundle: .module),
            isPresented: $presentAlert
        ) {
            Button(String(localized: "LockButton:Cancel", bundle: .module), role: .cancel) { }
        }
    }
    
    private func buttonAction() {
        if isLocked {
            unlockAction()
        } else {
            lockAction()
        }
    }
    
    private func unlockAction() {
        if unlockWithoutAuthentication {
            isLocked = false
            return
        }
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = String(localized: "LockButton:Unlock?", bundle: .module)
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if success {
                    DispatchQueue.main.async {
                        isLocked = false
                    }
                }
            }
        } else {
            if
                unlockWithoutAuthenticationIfPasswordNotSet,
                let error = error as? LAError,
                error.code == .passcodeNotSet
            {
                isLocked = false
            } else {
                presentAlert = true
            }
        }
    }
    
    private func lockAction() {
        isLocked = true
    }
}
