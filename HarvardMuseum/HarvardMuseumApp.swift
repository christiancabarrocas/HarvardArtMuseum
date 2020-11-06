//
//  HarvardMuseumApp.swift
//  HarvardMuseum
//
//  Created by Christian Cabarrocas on 29/10/2020.


import UIKit
import SwiftUI
import Console

@main
struct HarvardMuseumApp: App {

    @StateObject private var dataprovider = Dataprovider()
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            LandingView(dataprovider: dataprovider)
                .onAppear(perform: {
                    dataprovider.loadAuthors()
                })

        }
        .onChange(of: scenePhase) { newPhase in
              switch newPhase {
              case .active:
                print("Active")
              case .inactive:
                print("Inactive")
              case .background:
                print("Background")
              @unknown default:
                print("Unexpected")
              }
            }
    }
}
