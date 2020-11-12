//
//  TimerTest.swift
//  HarvardMuseum
//
//  Created by Shootr on 10/11/2020.
//

import Foundation
import SwiftUI
import Combine

struct TimerView: View {
    static private let zeroTime = "00:00"

    @State private var timeString: String = TimerView.zeroTime
    @State private var startDate: Date? = nil
    @State private var isActive: Bool = false
    @State private var timer: AnyCancellable? = nil

    var body: some View {
        VStack {
            Text(timeString)
                .font(Font.system(size: 80, weight: .semibold, design: .default)
                    .monospacedDigit()
            )
            startStopButton
        }.onAppear(perform: viewDidAppear)
    }

    var startStopButton: some View {
        Button(action: startStop, label: {
            Text(isActive ? "Stop" : "Start")
                .font(.title)
        })
    }

    func startStop() {
        if isActive {
            timer?.cancel()
        } else {
            timer = createTimer()
        }
        isActive.toggle()
    }

    func viewDidAppear() {

        // Create a timer to output to console
        timer = Timer.publish(every: 0.2, on: .main, in: .default)
            .autoconnect()
            .sink {
                print($0)
        }
    }

    func createTimer() -> AnyCancellable {
        startDate = Date()

        return Timer.publish(every: 0.01, on: .main, in: .default)
            .autoconnect()
            .sink { (now) in
                if let startDate = self.startDate,
                    let time = self.timeFormatter.string(from: now.timeIntervalSince(startDate)) {
                    self.timeString = time
                }
            }


    }

    var timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowsFractionalUnits = true
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }()
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
