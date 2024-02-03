//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by aaaaa on 21/12/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
