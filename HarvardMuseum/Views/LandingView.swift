//
//  LandingView.swift
//  HarvardMuseum
//
//  Created by Christian Cabarrocas on 29/10/2020.
//

import SwiftUI

struct LandingView: View {

    @ObservedObject var dataprovider: Dataprovider
    @EnvironmentObject var filter: Filter

    var body: some View {
        ZStack {
            GradientBackground()
            ZStack {
                VStack {
                    Spacer()
                    AuthorList(dataprovider: dataprovider)
                }
                VStack {
                    HeaderView(title: "Harvard \nArt \nMuseum",
                               subtitle: "Explore all ").environmentObject(Filter())
                    Spacer()
                }
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
