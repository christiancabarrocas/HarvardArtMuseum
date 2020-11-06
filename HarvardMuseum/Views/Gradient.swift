//
//  Gradient.swift
//  HarvardMuseum
//
//  Created by Shootr on 03/11/2020.
//

import Foundation
import SwiftUI

struct Gradientline: View {

    var body: some View {
        let gradient = Gradient(colors: [Color.landingGradient01, Color.landingGradient02])
        LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
    }
}

struct Gradientline_Previews: PreviewProvider {
    static var previews: some View {
        Gradientline()
    }
}

struct GradientBackground: View {

    var body: some View {
        let gradient = Gradient(colors: [Color.landingGradient02, Color.landingGradient01])
        LinearGradient(gradient: gradient, startPoint: .topTrailing, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}

struct GradientCard: View {

    var body: some View {
        let gradient = Gradient(colors: [Color.almostWhite, .white])
        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
}

struct GradientCard_Previews: PreviewProvider {
    static var previews: some View {
        GradientCard()
    }
}
