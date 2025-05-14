//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Shivangi Dutta on 02/05/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage : ImageResource
    let currencyName : String
    var body: some View {
        // Currency Icons
        ZStack(alignment: .bottom){
             //currency image
             Image(currencyImage)
                 .resizable()
                 .scaledToFit()
             
             //currency Text
             Text(currencyName)
                 .padding(3)
                 .font(.caption)
                 .frame(maxWidth: .infinity)
                 .background(.brown.opacity(0.75))
         }
         .padding(3)
         .frame(width: 100, height: 100)
         .background(.brown)
         .clipShape(.rect(cornerRadius: 25))
     

    }
}

#Preview {
    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Piece")
}
