//
//  HeaderView.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import SwiftUI

//enum Filter {
//    case authors, pieces, period
//}

struct HeaderView: View {

    let paddingMargin: CGFloat = 30
    var title: String
    var subtitle: String
//    @State var selectedFilter: Filter = .authors

    var body: some View {
        VStack(alignment: .leading) {
            SegmentedView()
            Text(title)
                .font(Font.system(size: 40, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .padding(.trailing, 50)
                .padding(.top)
            Text(subtitle)
                .foregroundColor(.white)
        }
        .padding(.leading, paddingMargin)
        .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .leading)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [Color.landingGradient01,
                                              Color.landingGradient02]),
                           startPoint: .topTrailing,
                           endPoint: .bottomLeading).ignoresSafeArea()

            HeaderView(title: "Harvard \nArt \nMuseum",
                       subtitle: "Explore the entire collection")
        }
    }
}
