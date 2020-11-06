//
//  AuthorModifiers.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import SwiftUI

struct CarrouselModifier: ViewModifier {

    func body(content: Content) -> some View {
        GeometryReader { geometry in
        content
            .rotation3DEffect(Angle(degrees:
                (Double(geometry.frame(in:.global).minX) - 40) / -20), axis: (x: 0.0, y: 40.0, z: 0.0))
        }
    }
}

struct AuthorCardFramed: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(width: AuthorConfiguration.cardWidth, height: AuthorConfiguration.cardHeight)
    }
}


extension View {
    func carroussel() -> some View {
        self.modifier(CarrouselModifier())
    }

    func framed() -> some View {
        self.modifier(AuthorCardFramed())
    }
}
