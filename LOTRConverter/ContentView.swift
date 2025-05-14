//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Shivangi Dutta on 30/04/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency : Currency = .silverPiece
    @State var rightCurrency : Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack{
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                // pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //currency converter
                HStack{
                    //Left Conversion
                    VStack{
                        // currency
                        HStack{
                            //currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        // Textfield
                        TextField("Enter Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            
                            
                    }
                    
                    //equal
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // right conversion
                    VStack{
                        // currency
                        HStack{
                            //currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        // Textfield
                        TextField("Enter Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.containerRelative)
                .keyboardType(.decimalPad)
                
                Spacer()
                
                //info button
        
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                        
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .task {
                        try? Tips.configure()
                    }
                    .onChange(of: leftAmount){
                        if leftTyping{
                            rightAmount =
                            leftCurrency
                                .convert(leftAmount, to: rightCurrency)
                        }
                    }
                    .onChange(of: rightAmount){
                        if rightTyping{
                            leftAmount = rightCurrency
                                .convert(rightAmount, to: leftCurrency)
                            
                        }
                    }
                    .onChange(of : leftCurrency){
                        leftAmount = rightCurrency
                            .convert(rightAmount, to: leftCurrency)
                        
                    }
                    .onChange(of : rightCurrency){
                        rightAmount =
                        leftCurrency
                            .convert(leftAmount, to: rightCurrency)
                        
                    }
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
