//
//  CountdownTimerUtil.swift
//  AseerAlKotobSwiftUI
//
//  Created by khaled mohammed on 27/06/2025.
//


import Foundation
import Combine

final class CountdownTimerUtil: ObservableObject {
    @Published var secondsRemaining: Int
    @Published var isFinished: Bool = false

    private var timer: Timer?
    private let totalDuration: Int
    private let specificTriggerTime: Int?
    private let onTick: ((Int) -> Void)?
    private let onComplete: (() -> Void)?
    private let onSpecificTime: (() -> Void)?

    init(
        duration: Int,
        specificTriggerTime: Int? = nil,
        onTick: ((Int) -> Void)? = nil,
        onSpecificTime: (() -> Void)? = nil,
        onComplete: (() -> Void)? = nil
    ) {
        self.secondsRemaining = duration
        self.totalDuration = duration
        self.specificTriggerTime = specificTriggerTime
        self.onTick = onTick
        self.onSpecificTime = onSpecificTime
        self.onComplete = onComplete
        start()
    }

    private func start() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
                self.onTick?(self.secondsRemaining)

                if let specificTime = self.specificTriggerTime,
                   self.secondsRemaining == specificTime {
                    self.onSpecificTime?()
                }
            } else {
                self.isFinished = true
                self.timer?.invalidate()
                self.onComplete?()
            }
        }
    }

    func reset() {
        timer?.invalidate()
        secondsRemaining = totalDuration
        isFinished = false
        start()
    }

    deinit {
        timer?.invalidate()
    }
}
