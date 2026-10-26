import SwiftUI

@MainActor
public struct PloegAppIcon: View {
    private let product: PloegProduct
    private let size: CGFloat

    public init(_ product: PloegProduct, size: CGFloat = 44) {
        self.product = product
        self.size = size
    }

    public init(product: PloegProduct, size: CGFloat = 44) {
        self.init(product, size: size)
    }

    public var body: some View {
        Group {
            if let image = PloegAssets.image(for: product) {
                Image(nsImage: image)
                    .resizable()
                    .renderingMode(.original)
                    .interpolation(.high)
                    .scaledToFit()
            } else {
                Image(systemName: "app.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(PloegTheme.accent)
            }
        }
            .frame(width: size * 1.22, height: size * 1.22)
            .frame(width: size, height: size)
            .accessibilityHidden(true)
    }
}

@MainActor
public struct PloegCard<Content: View>: View {
    private let title: String?
    private let systemImage: String?
    private let padding: CGFloat
    private let content: Content

    public init(title: String? = nil, systemImage: String? = nil,
                padding: CGFloat = 16, @ViewBuilder content: () -> Content) {
        self.title = title
        self.systemImage = systemImage
        self.padding = padding
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            if let title {
                HStack(spacing: 8) {
                    if let systemImage {
                        Image(systemName: systemImage).foregroundStyle(PloegTheme.accent)
                    }
                    Text(title).font(.system(size: 14, weight: .semibold))
                }
                .foregroundStyle(PloegTheme.ink)
            }
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(padding)
        .background(PloegTheme.surface, in: RoundedRectangle(cornerRadius: PloegTheme.cardRadius))
        .overlay(RoundedRectangle(cornerRadius: PloegTheme.cardRadius).stroke(PloegTheme.line, lineWidth: 1))
    }
}

@MainActor
public struct PloegSectionHeader: View {
    private let title: String
    private let subtitle: String?

    public init(_ title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.system(size: 28, weight: .semibold)).foregroundStyle(PloegTheme.ink)
            if let subtitle {
                Text(subtitle).font(.system(size: 13)).foregroundStyle(PloegTheme.muted)
            }
        }
    }
}

@MainActor
public struct PloegStatusPill: View {
    private let title: String
    private let systemImage: String
    private let color: Color

    public init(_ title: String, systemImage: String = "checkmark.circle.fill", color: Color? = nil) {
        self.title = title
        self.systemImage = systemImage
        self.color = color ?? PloegTheme.success
    }

    public var body: some View {
        Label(title, systemImage: systemImage)
            .font(.system(size: 12, weight: .medium))
            .foregroundStyle(color)
            .padding(.horizontal, 9)
            .padding(.vertical, 5)
            .background(color.opacity(0.10), in: Capsule())
    }
}

@MainActor
public struct PloegPrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .semibold))
            .foregroundStyle(PloegTheme.onAccent)
            .padding(.horizontal, 14)
            .frame(minHeight: 36)
            .background(PloegTheme.accent.opacity(configuration.isPressed ? 0.8 : 1),
                        in: RoundedRectangle(cornerRadius: PloegTheme.controlRadius))
            .opacity(isEnabled ? 1 : 0.45)
            .contentShape(RoundedRectangle(cornerRadius: PloegTheme.controlRadius))
    }
}

@MainActor
public struct PloegSecondaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(PloegTheme.ink)
            .padding(.horizontal, 12)
            .frame(minHeight: 36)
            .background(configuration.isPressed ? PloegTheme.accentSoft : PloegTheme.surface,
                        in: RoundedRectangle(cornerRadius: PloegTheme.controlRadius))
            .overlay(RoundedRectangle(cornerRadius: PloegTheme.controlRadius).stroke(PloegTheme.line, lineWidth: 1))
            .opacity(isEnabled ? 1 : 0.45)
            .contentShape(RoundedRectangle(cornerRadius: PloegTheme.controlRadius))
    }
}
