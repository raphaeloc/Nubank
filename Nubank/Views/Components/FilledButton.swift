//
//  FilledButton.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import SwiftUI

struct FilledButton: View {
    
    var text: String
    
    var body: some View {
        Button {
            // any action
        } label: {
            Text("Parcelar compras")
                .foregroundColor(.black)
                .font(.system(size: 12, weight: .regular))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color("grayItems"))
        .cornerRadius(16)
    }
}

struct FilledButton_Previews: PreviewProvider {
    static var previews: some View {
        FilledButton(text: "Parcelar compras")
    }
}
