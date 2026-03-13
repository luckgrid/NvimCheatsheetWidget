import SwiftUI

struct WidgetView: View {
    let onExpand: () -> Void
    let onClose: () -> Void
    @State private var isHovered = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Image(systemName: "command")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.purple)
                Text("Neovim")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.primary)
                Spacer()
                
                // Close button
                Button(action: onClose) {
                    Image(systemName: "xmark")
                        .font(.system(size: 9))
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
                .help("Close widget")
                
                // Expand button
                Button(action: onExpand) {
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
                .help("Open cheatsheet")
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.black.opacity(0.01))
            
            Divider()
                .padding(.horizontal, 8)
            
            // Compact keymaps
            VStack(alignment: .leading, spacing: 4) {
                ForEach(compactKeymaps) { keymap in
                    HStack(spacing: 8) {
                        Text(keymap.keys)
                            .font(.system(size: 10, weight: .medium, design: .monospaced))
                            .foregroundColor(.purple)
                            .frame(width: 70, alignment: .leading)
                        
                        Text(keymap.description)
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                }
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(nsColor: .windowBackgroundColor).opacity(0.85))
                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
        .onHover { hovering in
            isHovered = hovering
            if let window = NSApp.windows.first(where: { $0.contentView?.subviews.first is NSHostingView<WidgetView> }) {
                window.level = hovering ? .popUpMenu : .floating
            }
        }
    }
}
