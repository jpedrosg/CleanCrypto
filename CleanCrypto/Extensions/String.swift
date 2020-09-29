//
//  String.swift
//  CleanCrypto
//
//  Created by João Pedro Giarrante on 28/09/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import UIKit

extension String {
    
     static func formatValueForCurrencyCode(value: Double, myCode: String) -> String? {
        
        let locales: NSArray = NSLocale.availableLocaleIdentifiers as NSArray
        for localeID in locales as! [NSString] {
            let locale = NSLocale(localeIdentifier: localeID as String)
            let code = locale.object(forKey: NSLocale.Key.currencyCode) as? String
            
            
            if code == myCode {
                
                // Formatting Number
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .currency
                numberFormatter.locale = Locale(identifier: locale.localeIdentifier)
                let number = NSNumber(value: value)
                var price = numberFormatter.string(from: number)!
                if number == 0 {price = " Não Encontrado "}
                return price
            }
        }
        return " Não Encontrado "
    }
        
}
