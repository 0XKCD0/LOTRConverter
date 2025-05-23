//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Shivangi Dutta on 11/05/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left and right currency to bring up the Select Currency screen")
    
    var image : Image? = Image(systemName: "hand.tap.fill")
}
