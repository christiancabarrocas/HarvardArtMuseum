//
//  DateExtension.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import Foundation

extension Date {

    func hour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
