//
//  AuthorCardBack.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import SwiftUI

struct AuthorCardBack: View {
    var body: some View {
        Rectangle()
            .frame(width: AuthorConfiguration.cardWidth, height: AuthorConfiguration.cardHeight)
            .background(GradientCard())
            .foregroundColor(Color.white.opacity(AuthorConfiguration.cardOpacity))
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(AuthorConfiguration.shadowOpacity), radius: 25, x: 15, y: 15)
    }
}

struct AuthorCardBack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GradientBackground()            
            AuthorCardBack()
        }
    }
}
