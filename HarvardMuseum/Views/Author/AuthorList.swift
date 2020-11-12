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
                        .frame(width: UIScreen.main.bounds.size.width/1.5,
                               height: UIScreen.main.bounds.size.height)
                }
            }
            .padding()
        }
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
