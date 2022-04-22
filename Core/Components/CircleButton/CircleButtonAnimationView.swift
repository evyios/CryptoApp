//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Evgeny on 10.04.22.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool 
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? Animation.easeOut(duration: 0.8) : .none, value: animate)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
    }
}
