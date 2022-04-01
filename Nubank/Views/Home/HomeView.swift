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
        ScrollView(showsIndicators: false) {
            
            VStack {
                HeaderView(user: $viewModel.homeModel.user)
                
                AccountBalanceView(account: $viewModel.homeModel.account)
                
                ShortcutsView(shortcuts: $viewModel.homeModel.shortcuts)
                
                FilledIconButton(icon: "creditcard", text: "Meus cartões")
                    .padding(16)
                
                HighlightsView(highlights: $viewModel.homeModel.highlights)
                    .padding(.bottom, 16)
                
                ForEach($viewModel.cardTypes, id: \.self) { cardType in
                    getCardViews(for: cardType)
                }
            }
            .background(.white)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: - Cards
    @ViewBuilder func getCardViews(for cardType: Binding<CardType>) -> some View {
        switch cardType.wrappedValue {
        case .creditCard:
            CardView(image: "creditcard", text: "Cartão de crédito", isIconEnabled: true) {
                CreditCardContentView(creditCard: $viewModel.homeModel.creditCard)
            }
        case .loan:
            CardView(image: "banknote", text: "Empréstimo", isIconEnabled: true) {
                VStack(alignment: .leading) {
                    Text("Valor disponível de até")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text($viewModel.homeModel.wrappedValue.loan.available.currency ?? "")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                }
            }
        case .investments:
            CardView(image: "chart.bar.fill", text: "Investimentos", isIconEnabled: true) {
                VStack(alignment: .leading) {
                    Text("O jeito Nu de investir: sem asteriscos, liguagem fácil e a partir de R$1. Saiba mais.")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    FilledIconButton(icon: "banknote", text: "Consultar saldo para transferência")
                }
            }
        case .insurance:
            CardView(image: "umbrella", text: "Seguros", isIconEnabled: false) {
                VStack(alignment: .leading) {
                    Text("Proteção para você cuidar do que importa")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    FilledIconButton(icon: "heart", text: "Seguro vida", rightText: "Conhecer")
                }
            }
        case .shopping:
            CardView(image: "bag", text: "Shopping", isIconEnabled: true) {
                Text("Vantagens exclusivas das nossas marcas preferidas")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - Credit card content view
private struct CreditCardContentView: View {
    
    @Binding var creditCard: CreditCard
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Fatura atual")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.gray)
                
                Text($creditCard.wrappedValue.currentInvoice.currency ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Limite disponível de \($creditCard.wrappedValue.availableLimit.currency ?? "")")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.gray)
            }
            
            FilledButton(text: "Parcelar compras")
                .padding(.vertical, 8)
        }
    }
}

// MARK: - Card view
private struct CardHeaderView: View {
    
    let image: String
    let text: String
    let isIconEnabled: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(systemName: image)
                .renderingMode(.template)
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

// MARK: - Header view
private struct HeaderView: View {
    
    @Binding var user: User
    
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
            
            Text("Olá \(user.name)")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 42)
        .padding(16)
        .background(Color("primaryColor"))
    }
}

// MARK: - Account balance
private struct AccountBalanceView: View {
    
    @Binding var account: Account
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Conta")
                    .font(.system(size: 16))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Text(account.balance.currency ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .semibold))
        }
        .padding(16)
    }
}

// MARK: - Shortcuts view
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
                            Image(systemName: shortcut.wrappedValue.icon)
                                .renderingMode(.template)
                                .foregroundColor(.black)
                                .frame(width: 64, height: 64)
                        }
                        .background(Color("grayItems"))
                        .cornerRadius(32)
                        
                        Text(shortcut.wrappedValue.text)
                            .frame(maxWidth: 64)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(0)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 12, weight: .light))
                    }
                    .padding(.trailing, shortcut.wrappedValue.getSpace(for: .trailing))
                    .padding(.leading, shortcut.wrappedValue.getSpace(for: .leading))
                }
            }
            
        }
    }
}

// MARK: - Highlights view
private struct HighlightsView: View {
    
    @Binding var highlights: Highlights
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach($highlights, id: \.self) { highlight in
                    
                    Button {
                        // any action
                    } label: {
                        Text(highlight.wrappedValue.text)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: UIScreen.main.bounds.width - 128)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.black)
                            .padding(.top, 24)
                            .padding(.bottom, 32)
                            .padding(.horizontal, 16)
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

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel(homeModel: HomeModel(user: User(name: "Raphael"),
                                                           account: Account(balance: 112332456.43),
                                                           shortcuts: [
                                                            Shortcut(space: ItemSpace(edge: .leading, distance: 16), icon: "hexagon", text: "Área Pix"),
                                                            Shortcut(space: nil, icon: "barcode", text: "Pagar"),
                                                            Shortcut(space: nil, icon: "arrow.up.to.line.circle", text: "Transferir"),
                                                            Shortcut(space: nil, icon: "arrow.down.to.line.circle", text: "Depositar"),
                                                            Shortcut(space: nil, icon: "banknote", text: "Pegar emprestado"),
                                                            Shortcut(space: nil, icon: "iphone.homebutton", text: "Recarga de celular"),
                                                            Shortcut(space: nil, icon: "dollarsign.circle", text: "Cobra"),
                                                            Shortcut(space: nil, icon: "heart", text: "Doação"),
                                                            Shortcut(space: ItemSpace(edge: .trailing, distance: 16), icon: "arrow.up.to.line.circle", text: "Transferir Internac.")
                                                           ],
                                                           highlights: [
                                                            Highlight(text: "Você tem até R$ 25.000,00 disponiveis para empréstimo.", space: ItemSpace(edge: .leading, distance: 16)),
                                                            Highlight(text: "Tem SHOPPING no seu bank, Conheça agora.", space: nil),
                                                            Highlight(text: "Tem SHOPPING no seu bank, Conheça agora.", space: ItemSpace(edge: .trailing, distance: 16))
                                                           ],
                                                           creditCard: CreditCard(currentInvoice: 654.54, availableLimit: 65),
                                                           loan: Loan(available: 2500000)))
        
        return HomeView()
            .environmentObject(viewModel)
    }
}
