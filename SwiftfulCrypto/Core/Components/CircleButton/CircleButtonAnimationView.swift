//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by aaaaa on 18/12/2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.5)
            .opacity(animate ? 0.0 : 0.5)
            .animation(animate ? Animation.easeOut(duration: 0.5) : .none, value: animate)
            .frame(width: 70, height: 70)

    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .foregroundColor(.red)
    }
}
