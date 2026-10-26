import AppKit
import SwiftUI

public enum PloegProduct: String, CaseIterable, Sendable {
    case toolbox, sound, voice, shot

    public var displayName: String {
        switch self {
        case .toolbox: return "PloegToolbox"
        case .sound: return "SoundPloeg"
        case .voice: return "VoicePloeg"
        case .shot: return "PloegShot"
        }
    }
}

@MainActor
public enum PloegTheme {
    public static let controlRadius: CGFloat = 8
    public static let cardRadius: CGFloat = 12
    public static let pagePadding: CGFloat = 24
    public static let sidebarWidth: CGFloat = 216

    public static let canvasNS = adaptive(0xEDF2F8, 0x121B2A)
    public static let surfaceNS = adaptive(0xFFFFFF, 0x1B283C)
    public static let inkNS = adaptive(0x19283F, 0xF1F5FC)
    public static let mutedNS = adaptive(0x58677C, 0xACBBD0)
    public static let lineNS = adaptive(0xD8E0EB, 0x35455E)
    public static let accentNS = adaptive(0x245BD4, 0x89AEFF)
    public static let accentSoftNS = adaptive(0xE8EFFD, 0x293E61)
    public static let onAccentNS = adaptive(0xFFFFFF, 0x10203B)
    public static let successNS = adaptive(0x087C78, 0x79D2BC)
    public static let warningNS = adaptive(0x865B12, 0xF1C375)
    public static let dangerNS = adaptive(0xB43142, 0xFF9CA8)
    public static let recordingNS = adaptive(0xC43243, 0xFF9CA8)

    public static var canvas: Color { Color(nsColor: canvasNS) }
    public static var sidebar: Color { canvas }
    public static var surface: Color { Color(nsColor: surfaceNS) }
    public static var ink: Color { Color(nsColor: inkNS) }
    public static var muted: Color { Color(nsColor: mutedNS) }
    public static var line: Color { Color(nsColor: lineNS) }
    public static var accent: Color { Color(nsColor: accentNS) }
    public static var blue: Color { Color(red: 36 / 255, green: 91 / 255, blue: 212 / 255) }
    public static var accentSoft: Color { Color(nsColor: accentSoftNS) }
    public static var onAccent: Color { Color(nsColor: onAccentNS) }
    public static var success: Color { Color(nsColor: successNS) }
    public static var warning: Color { Color(nsColor: warningNS) }
    public static var danger: Color { Color(nsColor: dangerNS) }
    public static var recording: Color { Color(nsColor: recordingNS) }

    public static func adaptive(_ light: UInt32, _ dark: UInt32) -> NSColor {
        NSColor(name: nil) { appearance in
            let hex = appearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua ? dark : light
            return NSColor(srgbRed: CGFloat((hex >> 16) & 0xFF) / 255,
                           green: CGFloat((hex >> 8) & 0xFF) / 255,
                           blue: CGFloat(hex & 0xFF) / 255, alpha: 1)
        }
    }
}

@MainActor
public enum PloegAssets {
    public static func image(for product: PloegProduct) -> NSImage? {
        guard let url = Bundle.module.url(forResource: product.rawValue, withExtension: "png") else { return nil }
        return NSImage(contentsOf: url)
    }
}
