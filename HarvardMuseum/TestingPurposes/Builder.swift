//
//  Builder.swift
//  HarvardMuseum
//
//  Created by Shootr on 02/11/2020.
//

import Foundation
import UIKit


public class AlertBuilder {

    /// AlertController to be presented
    private let alertController: UIAlertController

    /// The top most view controller currently presented
    private let topMostViewController: UIViewController? = UIApplication.shared.topViewController()

    // MARK: - Init
    init(alertController: UIAlertController) {
        self.alertController = alertController
    }

    /// Sets the title of your action
    /// - Parameter title: The title of the AlertController
    @discardableResult
    public func setTitle(_ title: String) -> AlertBuilder {
        alertController.title = title
        return self
    }

    /// Sets the message of your action
    /// - Parameter message: The message to be shown in the AlertController
    @discardableResult
    public func setMessage(_ message: String) -> AlertBuilder {
        alertController.message = message
        return self
    }

    /// Adds an action into your AlertController
    /// - Parameter action: The action to be add into your AlertController
    @discardableResult
    public func addAction(_ title: String,
                          style: UIAlertAction.Style = .default,
                          _ handler: @escaping ((UIAlertAction) -> Void)) -> AlertBuilder {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        alertController.addAction(action)
        return self
    }

    /// Sets the tint color of your AlertController
    /// - Parameter action: The action to be add into your AlertController
    @discardableResult
    public func setTintColor(_ tint: UIColor) -> AlertBuilder {
        alertController.view.tintColor = tint
        return self
    }

    /// Presents the AlertController
    public func show() {
        guard let controller = topMostViewController else { return }
        controller.present(alertController, animated: true, completion: nil)
    }

}

// @State private var selectedFilter = 0
//                Picker(selection: $selectedFilter, label: Text("Filter")) {
//                                Text("Authors").tag(0)
//                                Text("Technique").tag(1)
//                                Text("Period").tag(2)
//                }
//                .background(Color.white)
//                .pickerStyle(SegmentedPickerStyle())
//                .frame(width: 300)


//@State private var currentDate = Date()
//let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//.onReceive(timer) { time in
//    currentDate = Date()
//}
//
//Text("\(currentDate.hour())")
//    .padding()
