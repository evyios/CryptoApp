//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Evgeny on 16.04.22.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notificaton(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
