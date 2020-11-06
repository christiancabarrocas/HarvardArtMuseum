//
//  LandingView.swift
//  HarvardMuseum
//
//  Created by Christian Cabarrocas on 29/10/2020.
//

import SwiftUI

struct LandingView: View {

    @ObservedObject var dataprovider: Dataprovider

    var body: some View {
        ZStack {
            GradientBackground()
            VStack {
                HeaderView(title: "Harvard \nArt \nMuseum",
                           subtitle: "Explore the authors")

                AuthorList(dataprovider: dataprovider)
            }
        }
    }

}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        let dataProvider = Dataprovider()
        LandingView(dataprovider: dataProvider)
            .onAppear(perform: {
                dataProvider.loadAuthors()
            })
    }
}
