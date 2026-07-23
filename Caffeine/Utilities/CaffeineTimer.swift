//
//  CaffeineTimer.swift
//  Caffeine
//
//  Created by Alfy on 23/07/2026.
//

import Foundation
import Combine

final class CaffeineTimer: ObservableObject {
    @Published private(set) var remainingSeconds: Int = 0

    private var timerCancellable: AnyCancellable?
    var onExpire: (() -> Void)?

    func startTimer(durationMinutes: Int) {
        guard durationMinutes != -1 else {
            remainingSeconds = 0
            return
        }
        remainingSeconds = durationMinutes * 60
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                if self.remainingSeconds > 0 {
                    self.remainingSeconds -= 1
                } else {
                    self.onExpire?()
                    self.stopTimer()
                }
            }
    }

    func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
        remainingSeconds = 0
    }
}
