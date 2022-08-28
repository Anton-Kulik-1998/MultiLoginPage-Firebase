//
//  LoginViewModel.swift
//  MultiLoginPage-Firebase
//
//  Created by Антон Кулик on 28.08.2022.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    //MARK: View Propreties
    @Published var mobileNo: String = ""
    @Published var otpCode: String = ""
    
    @Published var CLIENT_CODE: String = ""
    @Published var showOPTField: Bool = false
    
    //MARK: Error Properties
    @Published var showError: Bool = false
    @Published var errorMassage: String = ""
    
    
    //MARK: Firebase API's
    func getOPTCode() {
        UIApplication.shared.closeKeybord()
        Task {
            do {
                //MARK: Disble it when testing with Real Device
                Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                
                let code = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(mobileNo)", uiDelegate: nil)
                await MainActor.run(body: {
                    CLIENT_CODE = code
                    //MARK: Enabling OTP Field When It's Success
                    withAnimation(.easeInOut) {showOPTField = true}
                })
            } catch {
                await handleError(error: error)
            }
        }
    }
    
    func verifyOPTCode() {
        UIApplication.shared.closeKeybord()
        Task {
            do {
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: CLIENT_CODE, verificationCode: otpCode)
                
                try await Auth.auth().signIn(with: credential)
                
                //MARK: User Logged is Successfully
                print("Success!")
            } catch {
                await handleError(error: error)
            }
        }
    }
    //MARK: Handing Error
    func handleError(error: Error)async {
        await MainActor.run(body: {
            errorMassage = error.localizedDescription
            showError.toggle()
        })
    }
}


//MARK: Extentensions
extension UIApplication {
    func closeKeybord() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
