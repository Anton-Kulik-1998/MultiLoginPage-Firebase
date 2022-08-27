//
//  Login.swift
//  MultiLoginPage-Firebase
//
//  Created by Антон Кулик on 26.08.2022.
//

import SwiftUI

struct Login: View {
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
