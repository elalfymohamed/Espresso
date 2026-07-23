//
//  SleepManager.swift
//  Caffeine
//
//  Created by Alfy on 02/07/2026.
//

import IOKit.pwr_mgt
import AppKit

final class SleepManager: NSObject {
    static let shared = SleepManager()
    private var assertionID: IOPMAssertionID = 0
    private var assertionActive = false

    private override init() {
        super.init()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleAppTermination),
            name: NSApplication.willTerminateNotification,
            object: nil
        )
    }

    deinit {
        allowSleep()
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func handleAppTermination() {
        allowSleep()
    }

    func preventSleep() {
        guard !assertionActive else { return }
        let reason = "Caffeine app keeping system awake" as CFString
        let success = IOPMAssertionCreateWithName(
            kIOPMAssertionTypeNoDisplaySleep as CFString,
            IOPMAssertionLevel(kIOPMAssertionLevelOn),
            reason,
            &assertionID
        )
        if success == kIOReturnSuccess {
            assertionActive = true
        }
    }

    func allowSleep() {
        guard assertionActive else { return }
        let result = IOPMAssertionRelease(assertionID)
        if result == kIOReturnSuccess {
            assertionActive = false
            assertionID = 0
        }
    }
}
