//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Shivangi Dutta on 02/05/25.
//

import SwiftUI

struct SelectCurrency: View {

    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency : Currency
    
    var body: some View {
        ZStack {
            // background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // text
                Text("Select the currency you are starting with:").fontWeight(.bold)
                    
                
                // currency icons
                IconGrid(currency: $topCurrency)
             
                
                //text
                Text("Select the currency you would like to convert to:").fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                
                // currency icons
                IconGrid(currency: $bottomCurrency)
                
                //done button
                
                Button("Done"){
                    dismiss()
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
