//
//  ContentView.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import SwiftUI

protocol Spacable {
    var space: ItemSpace? { get }
    
    func getSpace(for edge: ItemSpaceEdge) -> CGFloat
}

extension Spacable {
    func getSpace(for edge: ItemSpaceEdge) -> CGFloat {
        guard let space = space, edge == space.edge else { return 0 }
        return space.distance
    }
}

typealias Shortcuts = [Shortcut]

struct Shortcut: Hashable, Spacable {
    let space: ItemSpace?
}

typealias Highlights = [Highlight]

struct Highlight: Hashable, Spacable {
    let text: String
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
    
    @State var highlights: Highlights = [
        Highlight(text: "Você tem até R$ 25.000,00 disponiveis para empréstimo.", space: ItemSpace(edge: .leading, distance: 16)),
        Highlight(text: "Tem SHOPPING no seu bank, Conheça agora.", space: nil),
        Highlight(text: "Tem SHOPPING no seu bank, Conheça agora.", space: ItemSpace(edge: .trailing, distance: 16))
    ]
    
    var body: some View {
        ScrollView {
            
            VStack {
                HeaderView()
                
                AccountBalanceView()
                
                ShortcutsView(shortcuts: $shortcuts)
                
                MyCardsView()
                
                HighlightsView(highlights: $highlights)
                
                Divider()
                    .padding(.vertical, 16)
            }
            .background(.white)
        }
        .edgesIgnoringSafeArea(.top)
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
        .padding(.top, 42)
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
                                .frame(width: 64, height: 64)
                        }
                        .background(Color("grayItems"))
                        .cornerRadius(32)
                        
                        Text("barcode")
                            .font(.system(size: 12, weight: .light))
                    }
                    .padding(.trailing, shortcut.wrappedValue.getSpace(for: .trailing))
                    .padding(.leading, shortcut.wrappedValue.getSpace(for: .leading))
                }
            }
        }
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
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .background(Color("grayItems"))
        .cornerRadius(8)
        .padding(16)
    }
}

private struct HighlightsView: View {
    
    @Binding var highlights: Highlights
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach($highlights, id: \.self) { highlight in
                    
                    Button {
                        // any action
                    } label: {
                        Text("Você tem até R$ 25.000,00 disponiveis para empréstimo.")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.black)
                            .frame(maxWidth: UIScreen.main.bounds.width - 16 - 8 - 60, maxHeight: 80)
                            .padding(.top, 24)
                            .padding(.bottom, 32)
                            .background(Color("grayItems"))
                            .cornerRadius(8)
                            .padding(.trailing, highlight.wrappedValue.getSpace(for: .trailing))
                            .padding(.leading, highlight.wrappedValue.getSpace(for: .leading))
                    }
                }

            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
