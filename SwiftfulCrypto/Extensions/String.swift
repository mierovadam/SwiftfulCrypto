//
//  String.swift
//  SwiftfulCrypto
//
//  Created by aaaaa on 04/01/2024.
//

import Foundation


extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
