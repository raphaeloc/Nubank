//
//  ContentView.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            
            VStack {
                HeaderView()
            }
        }
    }
}

private struct HeaderView: View {
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack(spacing: 18) {
                    Button {
                        
                    } label: {
                        Image(systemName: "person")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                    .frame(width: 56, height: 56)
                    .background(Color("primaryLightColor"))
                    .cornerRadius(28)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "eye")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "questionmark.circle")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "person.badge.plus")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
            }
            
            Text("Olá Raphael")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea(.all, edges: .top)
        .padding(16)
        .background(Color("primaryColor"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
