//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Evgeny on 17.04.22.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
