//
//  SegmentedView.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import SwiftUI
import Combine

enum FilterType: String, CaseIterable, Identifiable {
    case authors
    case pieces
    case periods

    var id: String {self.rawValue}
}

class Filter: ObservableObject {

    var didChange = PassthroughSubject<Filter, Never>()

    var values = FilterType.allCases
    @Published var selected: FilterType = .authors {
        didSet { self.didChange.send(self) }
    }
}

struct SegmentedView: View {

    @EnvironmentObject var filter: Filter
    @State var selectedFilter = FilterType.authors.rawValue

    let paddingMargin: CGFloat = 30

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white.withAlphaComponent(0.4)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.darkText], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
    }
    
    var body: some View {
        Picker(selection: $selectedFilter, label: Text("Filter")) {
            ForEach(filter.values) {
                Text($0.rawValue.capitalized).tag($0.rawValue)
            }
        }.onChange(of: selectedFilter, perform: { value in
            filter.selected = FilterType(rawValue: selectedFilter) ?? .authors
        })
        .background(Color.gray.opacity(0.2))
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: UIScreen.main.bounds.size.width - paddingMargin * 2)
        .cornerRadius(30)
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView().environmentObject(Filter())
    }
}
