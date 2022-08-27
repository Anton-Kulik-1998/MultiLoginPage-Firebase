//
//  CustomTextField.swift
//  MultiLoginPage-Firebase
//
//  Created by Антон Кулик on 28.08.2022.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    
    //MARK: View Properties
    @FocusState var isEnabled: Bool
    var contentType: UITextContentType = .telephoneNumber
    var body: some View {
        
        VStack (alignment: .leading, spacing: 15) {
//            TextField("hfgh", text: accessibility(hint: $text))
//                .keyboardType(.numberPad)
//                .textContentType(contentType)
//                .focused($isEnabled)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
