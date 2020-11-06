//
//  AuthorCard.swift
//  HarvardMuseum
//
//  Created by Shootr on 03/11/2020.
//

import SwiftUI

struct AuthorConfiguration {
    static let cardWidth: CGFloat = 250
    static let cardHeight: CGFloat =  350
    static let cardOpacity: Double = 0.8
    static let shadowOpacity: Double = 0.2
}

struct AuthorCard: View {

    var author: AuthorViewModel

    var body: some View {
        ZStack {
            AuthorCardBack()

            VStack(alignment: .leading) {
                HStack {
                    Text(author.culture)
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .padding()
                    Spacer()
                    Button(action: {
                        print("FAV")
                    }, label: {
                        Image(systemName: Symbols.star)
                            .foregroundColor(.secondary)
                            .font(Font.system(size: 32, weight: .light))
                            .padding()
                    })
                }

                Spacer()
                Text(author.displayname)
                    .font(Font.system(size: 40, weight: .bold, design: .rounded))
                    .padding(.leading)
                if author.birthplace.hasValue {
                    Text("from " + author.birthplace)
                        .padding(.leading)
                        .foregroundColor(.secondary)
                        .font(Font.system(size: 18, weight: .semibold).italic())
                }
                Gradientline()
                    .frame(width: AuthorConfiguration.cardWidth, height: 1)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .framed()
        }
    }
}

struct AuthorCard_Previews: PreviewProvider {

    static var previews: some View {
        let author = Author(alphasort: "Boticelli, Francesco",
                           birthplace: "Verona",
                           deathplace: "Modena",
                           name: "Francesco Boticelli",
                           displayname: "Francesco Boticelli",
                           culture: "Italian",
                           displaydate: "2018-08-30T04:40:43-0400")
        let viewModel = AuthorViewModel(author: author)

        ZStack {
            GradientBackground()
            AuthorCard(author: viewModel)
        }
    }
}
