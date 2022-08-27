//
//  Login.swift
//  MultiLoginPage-Firebase
//
//  Created by Антон Кулик on 26.08.2022.
//

import SwiftUI

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

            }
            .padding(.leading, 60)
            .padding(.vertical, 15)
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
