//
//  SegmentedView.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import SwiftUI

enum Filter: Int {
    case authors, pieces, period
}

struct SegmentedView: View {

    @State var selectedFilter: Int = 0
    let paddingMargin: CGFloat = 30

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white.withAlphaComponent(0.4)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.darkText], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
    }
    
    var body: some View {

        Picker(selection: $selectedFilter, label: Text("Filter")) {
                        Text("Authors").tag(0)
                        Text("Technique").tag(1)
                        Text("Period").tag(2)
        }
        .background(Color.gray.opacity(0.2))
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: UIScreen.main.bounds.size.width - paddingMargin * 2)
        .cornerRadius(30)
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}
