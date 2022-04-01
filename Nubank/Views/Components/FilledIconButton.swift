//
//  FilledButton.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import SwiftUI

struct FilledIconButton: View {
    
    var icon: String
    var text: String
    
    var body: some View {
        Button {
            // any action
        } label: {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 18)
                    .foregroundColor(.black)
                
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .regular))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color("grayItems"))
        .cornerRadius(8)
    }
}

struct FilledIconButton_Previews: PreviewProvider {
    static var previews: some View {
        FilledIconButton(icon: "creditcard", text: "Meus cartões")
    }
}
