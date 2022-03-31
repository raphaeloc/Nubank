//
//  ContentView.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import SwiftUI

typealias Shortcuts = [Shortcut]

struct Shortcut: Hashable {
    let space: ItemSpace?
}

enum ItemSpaceEdge: Hashable {
    case leading
    case trailing
}

struct ItemSpace: Hashable {
    let edge: ItemSpaceEdge
    let distance: CGFloat
}

struct HomeView: View {
    
    @State var shortcuts: Shortcuts = [
        Shortcut(space: ItemSpace(edge: .leading, distance: 16)),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: ItemSpace(edge: .trailing, distance: 16))
    ]
    
    var body: some View {
        ScrollView {
            
            VStack {
                HeaderView()
                
                AccountBalanceView()
                
                ShortcutsView(shortcuts: $shortcuts)
                
                MyCardsView()
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
                    // any action
                } label: {
                    Image(systemName: "eye")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
                
                Button {
                    // any action
                } label: {
                    Image(systemName: "questionmark.circle")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
                
                Button {
                    // any action
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

struct AccountBalanceView: View {
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Conta")
                    .font(.system(size: 16))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Text("R$ 11,52")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .semibold))
        }
        .padding(16)
    }
}

private struct ShortcutsView: View {
    
    @Binding var shortcuts: Shortcuts
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($shortcuts, id: \.self) { shortcut in
                    
                    VStack {
                        Button {
                            // any action
                        } label: {
                            Image(systemName: "barcode")
                                .renderingMode(.template)
                                .foregroundColor(.black)
                        }
                        .frame(width: 64, height: 64)
                        .background(Color("grayItems"))
                        .cornerRadius(32)
                        
                        Text("barcode")
                            .font(.system(size: 12, weight: .light))
                    }
                    .padding(.trailing, getSpace(for: .trailing, shortcut: shortcut.wrappedValue))
                    .padding(.leading, getSpace(for: .leading, shortcut: shortcut.wrappedValue))
                }
            }
        }
    }
    
    private func getSpace(for edge: ItemSpaceEdge, shortcut: Shortcut) -> CGFloat {
        guard let space = shortcut.space, edge == space.edge else { return 0 }
        return space.distance
    }
}

private struct MyCardsView: View {
    
    var body: some View {
        Button {
            // any action
        } label: {
            HStack(spacing: 16) {
                Image(systemName: "creditcard")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 18)
                    .foregroundColor(.black)
                
                Text("Meus cartões")
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .light))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color("grayItems"))
        .cornerRadius(8)
        .padding(16)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
