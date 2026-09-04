# ☕ Espresso

A lightweight macOS menu bar app that keeps your Mac awake — for a set duration, or indefinitely.

Built with SwiftUI power management assertions (the same mechanism behind the built-in `caffeinate` command).

---

## Features

- **Menu bar only** — no Dock icon, no windows, stays out of your way
- **Timed sessions** — 5, 10, 15, 30 minutes, 1, 2, or 5 hours
- **Indefinite mode** — stay awake until you turn it off
- **Custom time picker** — choose your own stop time
- **Live countdown** — see time remaining, click to cancel early
- **Animated icon** — the cup changes state when caffeine is active

---

## Requirements

| | |
|---|---|
| macOS | 14.6 (Sonoma) or later |
| Xcode | 15.0 or later |
| Swift | 5.9+ |

---

## Installation

### Download

<!--Grab the latest `.app` from the [Releases](../../releases) page, unzip it, and drag it to `/Applications`.-->

### Build from source

```bash
git clone https://github.com/elalfymohamed/Caffeine-macOS
cd Caffeine-macOS
open Caffeine-macOS.xcodeproj
```

Then press `⌘R` in Xcode.

---

## Usage

1. Click the coffee cup in your menu bar.
2. Pick a duration from the **Activate for** dropdown.
3. Your Mac stays awake — the countdown shows time remaining.
4. Click the countdown to stop early, or let it expire on its own.

To verify it's working, run this in Terminal while Caffeine is active:

```bash
pmset -g assertions
```

You should see the app's assertion listed under `PreventUserIdleDisplaySleep`.

---

## How it works

Caffeine creates an **IOKit power management assertion** via `IOPMAssertionCreateWithName`, using the `kIOPMAssertionTypeNoDisplaySleep` type. This prevents both display sleep and idle system sleep for as long as the assertion is held.

When you turn Caffeine off — manually or by timer expiry — the assertion is released with `IOPMAssertionRelease` and normal sleep behavior resumes.

Assertions are tied to the process, so macOS automatically releases them if the app quits unexpectedly. The app also releases explicitly on termination via `applicationWillTerminate`.


