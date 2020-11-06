//
//  AuthorList.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import SwiftUI

struct AuthorList: View {

    @ObservedObject var dataprovider: Dataprovider

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(dataprovider.authors) { author in
                    AuthorCard(author: author)
                        .carroussel()
                        .framed()
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: AuthorConfiguration.cardHeight+50)
    }
}

struct AuthorList_Previews: PreviewProvider {
    static var previews: some View {
        let dataProvider = Dataprovider()
        ZStack {
            GradientBackground()
            AuthorList(dataprovider: dataProvider)
                .onAppear(perform: {
                    dataProvider.loadAuthors()
                })
        }
    }
}
