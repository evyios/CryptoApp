//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Evgeny on 12.04.22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
