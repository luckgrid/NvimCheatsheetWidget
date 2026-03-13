import SwiftUI

struct CheatsheetView: View {
    let onClose: () -> Void
    @State private var searchText = ""
    @State private var selectedSection: KeymapSection?
    
    var filteredSections: [KeymapSection] {
        if searchText.isEmpty {
            return keymapSections
        }
        return keymapSections.compactMap { section in
            let filteredKeymaps = section.keymaps.filter { keymap in
                keymap.keys.localizedCaseInsensitiveContains(searchText) ||
                keymap.description.localizedCaseInsensitiveContains(searchText)
            }
            if filteredKeymaps.isEmpty {
                return nil
            }
            return KeymapSection(title: section.title, icon: section.icon, keymaps: filteredKeymaps)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Neovim Cheatsheet")
                        .font(.system(size: 20, weight: .bold))
                    Text("Custom config with fzf-lua, nvim-tree, gitsigns, mini.nvim")
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                HStack(spacing: 12) {
                    // Search
                    HStack(spacing: 6) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 11))
                            .foregroundColor(.secondary)
                        TextField("Search keymaps...", text: $searchText)
                            .textFieldStyle(.plain)
                            .frame(width: 150)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color(nsColor: .controlBackgroundColor))
                    .cornerRadius(6)
                    
                    Button(action: onClose) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(20)
            .background(Color(nsColor: .windowBackgroundColor))
            
            Divider()
            
            // Content - ScrollView with sections
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(filteredSections) { section in
                        SectionView(section: section)
                    }
                }
                .padding(20)
            }
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}

struct SectionView: View {
    let section: KeymapSection
    @State private var isExpanded = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Section Header
            Button(action: { withAnimation { isExpanded.toggle() } }) {
                HStack(spacing: 8) {
                    Image(systemName: section.icon)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.purple)
                        .frame(width: 20)
                    
                    Text(section.title)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(Color.purple.opacity(0.1))
                .cornerRadius(6)
            }
            .buttonStyle(.plain)
            
            // Keymaps
            if isExpanded {
                VStack(alignment: .leading, spacing: 3) {
                    ForEach(section.keymaps) { keymap in
                        KeymapRow(keymap: keymap)
                    }
                }
                .padding(.leading, 28)
            }
        }
    }
}

struct KeymapRow: View {
    let keymap: Keymap
    
    var body: some View {
        HStack(spacing: 12) {
            // Keys
            Text(keymap.keys)
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .foregroundColor(.purple)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(Color.purple.opacity(0.15))
                .cornerRadius(4)
                .frame(width: 120, alignment: .leading)
            
            // Description
            Text(keymap.description)
                .font(.system(size: 11))
                .foregroundColor(.primary.opacity(0.8))
            
            Spacer()
        }
        .padding(.vertical, 2)
    }
}
