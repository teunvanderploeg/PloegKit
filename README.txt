PloegKit beta

Early beta shared UI package. Fixes and updates will follow.

Shared SwiftUI/AppKit design foundations for SoundPloeg, VoicePloeg and PloegShot.
Requires macOS 13+ and Swift 5.9+. Keep this repository beside the app repositories
so their local Swift package dependencies resolve during development.

PloegTheme supplies adaptive light/dark SwiftUI colors and AppKit NSColor values.
PloegAppIcon and PloegAssets load the approved centered generated app icons.
PloegCard, PloegSectionHeader, PloegStatusPill and button styles establish the
shared spacing, surfaces, borders and control hierarchy.

PloegToolbox is a separate Rust application. Its theme uses the same tokens.json
and generated PNG assets; it does not import this Swift package.

Build with swift build. App repositories retain their own bundle identifiers,
preferences, histories, speech engines, capture logic and permission handling.

Design rules
No eyebrow headings or decorative copy. Use a short page title, useful labels
and one clear action. Put setup, version and installation details on demand.
Show status only when it conveys a current result, problem or operation.

Source setup
Clone tag v0.1.0-beta.1 from https://github.com/teunvanderploeg/PloegKit
as the sibling PloegKit folder beside SoundPloeg, VoicePloeg and PloegShot.
