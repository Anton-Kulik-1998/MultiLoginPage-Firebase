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
    
    
    func getOPTCode() {
        
    }
    
    func verifyOPTCode() {
        
    }
}
