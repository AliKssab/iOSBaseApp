//
//  TimerUtil.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 23/06/2025.
//


import Foundation
import Combine

@MainActor
class TimerUtil: ObservableObject {
    
    @Published var timeString: String = "00:00 Mins"
    @Published var isFinished: Bool = false

    private var duration: TimeInterval
    private var remainingTime: TimeInterval
    private var timerTask: Task<Void, Never>?
    
    private let formatter: DateComponentsFormatter = {
        let f = DateComponentsFormatter()
        f.allowedUnits = [.minute, .second]
        f.unitsStyle = .positional
        f.zeroFormattingBehavior = .pad
        return f
    }()

    init(duration: TimeInterval) {
        self.duration = duration
        self.remainingTime = duration
        updateTimeString()
    }
    
    func start() {
        stop() // cancel any existing timer first
        isFinished = false
        
        timerTask = Task {
            while remainingTime > 0 {
                try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 sec
                remainingTime -= 1
                updateTimeString()
            }
            isFinished = true
        }
    }

    func stop() {
        timerTask?.cancel()
        timerTask = nil
    }
    
    func reset() {
        stop()
        remainingTime = duration
        updateTimeString()
        isFinished = false
    }

    private func updateTimeString() {
        let formatted = formatter.string(from: remainingTime) ?? "00:00"
        timeString = "\(formatted) Mins"
    }

    deinit {
        timerTask?.cancel()
        timerTask = nil
    }


    // Optional delay utility
    static func delay(
        by seconds: TimeInterval,
        _ closure: @escaping @MainActor () -> Void
    ) {
        Task {
            try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
            closure() // already isolated to @MainActor
        }
    }
}
