//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by aaaaa on 02/01/2024.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
