//
//  ContentView.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView {
            
            VStack {
                HeaderView()
                
                AccountBalanceView()
                
                ShortcutsView(shortcuts: $viewModel.shortcuts)
                
                FilledIconButton(icon: "creditcard", text: "Meus cartões")
                    .padding(16)
                
                HighlightsView(highlights: $viewModel.highlights)
                    .padding(.bottom, 16)
                
                CardView(image: "creditcard", text: "Cartão de crédito", isIconEnabled: true) {
                    CreditCardContentView()
                }
                
                CardView(image: "banknote", text: "Empréstimo", isIconEnabled: true) {
                    VStack(alignment: .leading) {
                        Text("Valor disponível de até")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Text("R$ 25.000,00")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                
                CardView(image: "chart.bar.fill", text: "Investimentos", isIconEnabled: true) {
                    VStack(alignment: .leading) {
                        Text("O jeito Nu de investir: sem asteriscos, liguagem fácil e a partir de R$1. Saiba mais.")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        FilledIconButton(icon: "banknote", text: "Consultar saldo para transferência")
                    }
                }
            }
            .background(.white)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

private struct CreditCardContentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Fatura atual")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.gray)
                
                Text("R$ 451,52")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Limite disponível de R$ 65.00")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.gray)
            }
            
            FilledButton(text: "Parcelar compras")
                .padding(.vertical, 8)
        }
    }
}

private struct CardHeaderView: View {
    
    let image: String
    let text: String
    let isIconEnabled: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 20, height: 18)
                .foregroundColor(.black)
            
            HStack {
                Text(text)
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
                
                if isIconEnabled {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

private struct CardView<Content: View>: View {
    let image: String
    let text: String
    let isIconEnabled: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                
                CardHeaderView(image: image, text: text, isIconEnabled: isIconEnabled)
                
                content
            }
            .padding(.horizontal, 16)
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
            
            Text("R$ 11.324.451,52")
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
            .environmentObject(HomeViewModel())
    }
}
