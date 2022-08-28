//
//  Login.swift
//  MultiLoginPage-Firebase
//
//  Created by Антон Кулик on 26.08.2022.
//

import SwiftUI
//MARK: Intergrating Apple Sign In
import AuthenticationServices

struct Login: View {
    @StateObject var loginModel: LoginViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: "triangle")
                    .font(.system(size: 38))
                    .foregroundColor(.indigo)
                
                (Text("Welcome,")
                    .foregroundColor(.black) +
                Text("\nLogin to continue")
                    .foregroundColor(.gray)
                )
                .font(.title)
                .fontWeight(.semibold)
                .lineSpacing(10)
                .padding(.top, 20)
                .padding(.trailing, 15)
                
                //MARK: Custom TextField
                CustomTextField(hint: "+38 6505551234", text: $loginModel.mobileNo)
                    .disabled(loginModel.showOPTField)
                    .opacity(loginModel.showOPTField ? 0.4 : 1)
                    .overlay(alignment: .trailing, content: {
                        Button("Change") {
                            withAnimation(.easeInOut) {
                                loginModel.showOPTField = false
                                loginModel.otpCode = ""
                                loginModel.CLIENT_CODE = ""
                            }
                        }
                        .font(.caption)
                        .foregroundColor(.indigo)
                        .opacity(loginModel.showOPTField ? 1 : 0)
                        .padding(.trailing, 15)
                    })
                    .padding(.top, 50)
                
                CustomTextField(hint: "OTP Code", text: $loginModel.otpCode)
                    .disabled(!loginModel.showOPTField)
                    .opacity(!loginModel.showOPTField ? 0.4 : 1)
                    .padding(.top, 30)
                
                Button(action: loginModel.showOPTField ? loginModel.verifyOPTCode : loginModel.getOPTCode) {
                    HStack(spacing: 15) {
                        Text(loginModel.showOPTField ? "Verify Code" : "Get Code")
                            .fontWeight(.semibold)
                            .contentTransition(.identity)
                        Image(systemName: "line.diagonal.arrow")
                            .font(.title3)
                            .rotationEffect(.init(degrees: 45))
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 25)
                    .padding(.vertical)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.black.opacity(0.05))
                    }
                }
                .padding(.top, 30)
                
//                SignInWithAppleButton { (request) in
//                    
//                    //requesting parameters from apple login
//                    loginModel.nonce = randomNonceString()
//                    request.requestedScopes = [.email, .fullName]
//                    request.nonce = sha256(loginModel.nonce)
//                    
//                } onCompletion: { (request) in
//                    switch result {
//                    case .success(let user)
//                        print("success")
//                        //do Login With Firebase...
//                        guard let credential = user.credential as?
//                        ASAuthorizationAppleIDCredential else {
//                            print("error with firebase")
//                            return
//                        }
//                        loginModel.authenticate(credential: credential)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                }
//                .signInWithAppleButtonStyle(.white)
//                .frame(height: 55)
//                .clipShape(Capsule())

            }
            .padding(.leading, 60)
            .padding(.vertical, 15)
        }
        .alert(loginModel.errorMassage, isPresented: $loginModel.showError) {
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
