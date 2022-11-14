//
//  LockAppButton.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 21.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import LocalAuthentication
import SwiftUI

/**
 A button to lock and unlock an app using user authentication.

 To unlock the app this button uses the system dialog to authenticate the user with password, TouchID or FaceID.

 ```swift
 struct MyView: View {
     var body: some View {
         LockAppButton()
     }
 }
 ```

 For security reasons this button does not unlock the app if the password is not set. Use the `View` method ``unlockAppWithoutAuthenticationIfPasswordNotSet()`` high enough in the view hierarchy to customize this button to unlock the app without authentication if the password is not set.

 For security reasons this button does only unlock the app with authentication. Use the `View` method ``unlockAppWithoutAuthentication()`` high enough in the view hierarchy to customize this button to unlock the app without authentication.
 */
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
