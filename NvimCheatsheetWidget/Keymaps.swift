import Foundation

struct KeymapSection: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let keymaps: [Keymap]
}

struct Keymap: Identifiable {
    let id = UUID()
    let keys: String
    let description: String
}

// Compact preview shortcuts (most common)
let compactKeymaps: [Keymap] = [
    Keymap(keys: "i/Esc", description: "Insert / Normal mode"),
    Keymap(keys: ":w/:q/:wq", description: "Save/Quit/Save+Quit"),
    Keymap(keys: "dd/yy/p", description: "Cut line / Copy line / Paste"),
    Keymap(keys: "u/<C-r>", description: "Undo / Redo"),
    Keymap(keys: "<Space>ff", description: "Find files"),
    Keymap(keys: "<Space>ide", description: "Toggle IDE mode"),
    Keymap(keys: "<Space>?", description: "Open this widget"),
]

// Full sections for expanded view
let keymapSections: [KeymapSection] = [
    
    // MARK: - Vim Basics (for beginners)
    KeymapSection(title: "Vim Basics (Essential)", icon: "play.circle", keymaps: [
        Keymap(keys: "i", description: "Insert mode (start typing)"),
        Keymap(keys: "v", description: "Visual mode (select text)"),
        Keymap(keys: "V", description: "Visual line mode (select lines)"),
        Keymap(keys: "Esc", description: "Back to normal mode"),
        Keymap(keys: ":w", description: "Save file"),
        Keymap(keys: ":q", description: "Quit (if no changes)"),
        Keymap(keys: ":wq", description: "Save and quit"),
        Keymap(keys: ":q!", description: "Quit without saving"),
        Keymap(keys: ":x", description: "Save and quit (shorter)"),
        Keymap(keys: "u", description: "Undo"),
        Keymap(keys: "<C-r>", description: "Redo"),
        Keymap(keys: "dd", description: "Delete (cut) line"),
        Keymap(keys: "yy", description: "Copy (yank) line"),
        Keymap(keys: "p", description: "Paste after cursor"),
        Keymap(keys: "P", description: "Paste before cursor"),
        Keymap(keys: "x", description: "Delete character"),
        Keymap(keys: "dw", description: "Delete word"),
        Keymap(keys: "cw", description: "Change word (delete + insert)"),
        Keymap(keys: "cc", description: "Change line (delete + insert)"),
        Keymap(keys: "o", description: "New line below + insert"),
        Keymap(keys: "O", description: "New line above + insert"),
        Keymap(keys: "A", description: "Append at end of line"),
        Keymap(keys: "I", description: "Insert at start of line"),
        Keymap(keys: "/", description: "Search forward"),
        Keymap(keys: "?", description: "Search backward"),
        Keymap(keys: "n/N", description: "Next/previous search result"),
        Keymap(keys: "*", description: "Search word under cursor"),
        Keymap(keys: ":", description: "Command mode"),
        Keymap(keys: ":help {topic}", description: "Open help for topic"),
    ]),
    
    // MARK: - Navigation
    KeymapSection(title: "Navigation", icon: "arrow.up.arrow.down", keymaps: [
        Keymap(keys: "h/j/k/l", description: "Left/Down/Up/Right"),
        Keymap(keys: "w/W", description: "Word forward / WORD forward"),
        Keymap(keys: "b/B", description: "Word back / WORD back"),
        Keymap(keys: "e/E", description: "End of word / WORD"),
        Keymap(keys: "0/^/$", description: "Line start / first non-blank / end"),
        Keymap(keys: "gg/G", description: "First line / Last line"),
        Keymap(keys: "{count}G", description: "Go to line {count}"),
        Keymap(keys: "<C-d>", description: "Half page down (centered)"),
        Keymap(keys: "<C-u>", description: "Half page up (centered)"),
        Keymap(keys: "<C-f>/<C-b>", description: "Page down / up"),
        Keymap(keys: "<C-o>/<C-i>", description: "Jump back / forward"),
        Keymap(keys: "zz", description: "Center cursor on screen"),
    ]),
    
    // MARK: - File Explorer (nvim-tree)
    KeymapSection(title: "File Explorer (nvim-tree)", icon: "folder", keymaps: [
        Keymap(keys: "<Space>e", description: "Toggle file tree"),
        Keymap(keys: "a", description: "New file/directory"),
        Keymap(keys: "d", description: "Delete file"),
        Keymap(keys: "r", description: "Rename file"),
        Keymap(keys: "c", description: "Copy file"),
        Keymap(keys: "x", description: "Cut file"),
        Keymap(keys: "p", description: "Paste file"),
        Keymap(keys: "y", description: "Copy filename"),
        Keymap(keys: "R", description: "Refresh tree"),
        Keymap(keys: "H", description: "Toggle hidden files"),
        Keymap(keys: "?", description: "Show help"),
    ]),

    // MARK: - IDE Mode
    KeymapSection(title: "IDE Mode (Custom Layout)", icon: "square.split.2x2", keymaps: [
        Keymap(keys: "<Space>ide", description: "Toggle IDE mode on/off"),
        Keymap(keys: "<Space>ic", description: "Toggle AI chat panel (right)"),
        Keymap(keys: "<Space>ir", description: "Toggle right terminal panel"),
        Keymap(keys: "<Space>ib", description: "Toggle bottom terminal panel"),
        Keymap(keys: "<Space>ix", description: "Toggle diagnostics panel (bottom)"),
        Keymap(keys: "<Space>iq", description: "Toggle quickfix panel (bottom)"),
        Keymap(keys: "<Space>ih", description: "Open this cheatsheet widget"),
    ]),
    
    // MARK: - Search (fzf-lua)
    KeymapSection(title: "Search (fzf-lua)", icon: "magnifyingglass", keymaps: [
        Keymap(keys: "<Space>ff", description: "Find files"),
        Keymap(keys: "<Space>fg", description: "Live grep"),
        Keymap(keys: "<Space>fb", description: "Buffers"),
        Keymap(keys: "<Space>fh", description: "Help tags"),
        Keymap(keys: "<Space>fx", description: "Document diagnostics"),
        Keymap(keys: "<Space>fX", description: "Workspace diagnostics"),
        Keymap(keys: "<Space>c", description: "Clear search highlights"),
    ]),

    // MARK: - AI Assistant
    KeymapSection(title: "AI Assistant (CodeCompanion)", icon: "sparkles", keymaps: [
        Keymap(keys: "<Space>ic", description: "Toggle CodeCompanion chat panel"),
        Keymap(keys: ":CodeCompanionChat", description: "Open chat buffer"),
        Keymap(keys: ":CodeCompanion", description: "Inline AI prompt"),
        Keymap(keys: ":CodeCompanionActions", description: "Open action palette"),
        Keymap(keys: "#{buffer}", description: "Share current buffer context"),
        Keymap(keys: "@{files}", description: "Enable file tools in chat"),
        Keymap(keys: "<CR>/<C-s> (chat)", description: "Send message in chat"),
        Keymap(keys: "ga (chat)", description: "Change adapter/model"),
    ]),
    
    // MARK: - LSP
    KeymapSection(title: "LSP", icon: "chevron.left.forwardslash.chevron.right", keymaps: [
        Keymap(keys: "gd", description: "Go to definition"),
        Keymap(keys: "gD", description: "Go to declaration"),
        Keymap(keys: "<Space>gd", description: "Definition (fzf)"),
        Keymap(keys: "<Space>gS", description: "Definition in split"),
        Keymap(keys: "K", description: "Hover docs"),
        Keymap(keys: "<Space>ca", description: "Code actions"),
        Keymap(keys: "<Space>rn", description: "Rename symbol"),
        Keymap(keys: "<Space>fr", description: "Find references"),
        Keymap(keys: "<Space>ft", description: "Type definitions"),
        Keymap(keys: "<Space>fs", description: "Document symbols"),
        Keymap(keys: "<Space>fw", description: "Workspace symbols"),
        Keymap(keys: "<Space>oi", description: "Organize imports"),
    ]),
    
    // MARK: - Diagnostics
    KeymapSection(title: "Diagnostics", icon: "exclamationmark.triangle", keymaps: [
        Keymap(keys: "<Space>d", description: "Line diagnostics"),
        Keymap(keys: "<Space>D", description: "Cursor diagnostics"),
        Keymap(keys: "<Space>nd", description: "Next diagnostic"),
        Keymap(keys: "<Space>pd", description: "Prev diagnostic"),
        Keymap(keys: "<Space>q", description: "Diagnostic list"),
        Keymap(keys: "<Space>td", description: "Toggle diagnostics"),
    ]),

    // MARK: - Panels (trouble.nvim)
    KeymapSection(title: "Panels (trouble.nvim)", icon: "list.bullet.rectangle", keymaps: [
        Keymap(keys: "<Space>ix", description: "Toggle diagnostics panel"),
        Keymap(keys: "<Space>iq", description: "Toggle quickfix panel"),
        Keymap(keys: ":Trouble diagnostics toggle", description: "Open diagnostics in split"),
        Keymap(keys: ":Trouble qflist toggle", description: "Open quickfix in split"),
    ]),
    
    // MARK: - Git (gitsigns)
    KeymapSection(title: "Git (gitsigns)", icon: "arrow.triangle.branch", keymaps: [
        Keymap(keys: "]h", description: "Next hunk"),
        Keymap(keys: "[h", description: "Previous hunk"),
        Keymap(keys: "<Space>hs", description: "Stage hunk"),
        Keymap(keys: "<Space>hr", description: "Reset hunk"),
        Keymap(keys: "<Space>hp", description: "Preview hunk"),
        Keymap(keys: "<Space>hb", description: "Blame line"),
        Keymap(keys: "<Space>hB", description: "Toggle inline blame"),
        Keymap(keys: "<Space>hd", description: "Diff this"),
    ]),
    
    // MARK: - Window Management
    KeymapSection(title: "Window Management", icon: "uiwindow.split.2x1", keymaps: [
        Keymap(keys: "<C-h/j/k/l>", description: "Navigate windows"),
        Keymap(keys: "<Space>sv", description: "Split vertical"),
        Keymap(keys: "<Space>sh", description: "Split horizontal"),
        Keymap(keys: "<C-Up/Down>", description: "Resize height"),
        Keymap(keys: "<C-Left/Right>", description: "Resize width"),
    ]),
    
    // MARK: - Buffer Management
    KeymapSection(title: "Buffer Management", icon: "rectangle.stack", keymaps: [
        Keymap(keys: "<Space>bn", description: "Next buffer"),
        Keymap(keys: "<Space>bp", description: "Previous buffer"),
        Keymap(keys: "<Space>fb", description: "List buffers"),
        Keymap(keys: "Bufferline", description: "Tab bar enabled for open buffers"),
    ]),
    
    // MARK: - Terminal
    KeymapSection(title: "Terminal", icon: "terminal", keymaps: [
        Keymap(keys: "<Space>t", description: "Toggle floating terminal"),
        Keymap(keys: "<Space>ib", description: "Toggle bottom terminal panel"),
        Keymap(keys: "<Space>ir", description: "Toggle right terminal panel"),
        Keymap(keys: "<Esc> (in terminal)", description: "Close terminal"),
    ]),

    // MARK: - Plugin Management
    KeymapSection(title: "Plugin Management (vim.pack)", icon: "shippingbox", keymaps: [
        Keymap(keys: "<Space>pu", description: "Update plugins"),
        Keymap(keys: "<Space>pl", description: "Sync plugins to lockfile"),
        Keymap(keys: ":PackUpdateAll", description: "Run vim.pack.update()"),
        Keymap(keys: ":PackSyncLockfile", description: "Run lockfile target sync"),
    ]),
    
    // MARK: - Editing
    KeymapSection(title: "Editing", icon: "pencil", keymaps: [
        Keymap(keys: "J", description: "Join lines (keep cursor)"),
        Keymap(keys: "<A-j>/<A-k>", description: "Move line down/up"),
        Keymap(keys: "</> (visual)", description: "Indent left/right"),
        Keymap(keys: "<Space>p (visual)", description: "Paste without yanking"),
        Keymap(keys: "<Space>x", description: "Delete without yanking"),
        Keymap(keys: "gcc", description: "Comment line"),
        Keymap(keys: "gc (visual)", description: "Comment selection"),
        Keymap(keys: "ys{motion}{char}", description: "Add surrounding"),
        Keymap(keys: "ds{char}", description: "Delete surrounding"),
        Keymap(keys: "cs{old}{new}", description: "Change surrounding"),
    ]),
    
    // MARK: - Text Objects
    KeymapSection(title: "Text Objects", icon: "textformat", keymaps: [
        Keymap(keys: "viw", description: "Select inner word"),
        Keymap(keys: "vi\"/vi'/vi`", description: "Select inner quotes"),
        Keymap(keys: "vi{/vi[", description: "Select inner braces"),
        Keymap(keys: "vip", description: "Select inner paragraph"),
        Keymap(keys: "vib/vi(", description: "Select inner parentheses"),
    ]),
    
    // MARK: - Folding
    KeymapSection(title: "Folding", icon: "rectangle.compress.vertical", keymaps: [
        Keymap(keys: "za", description: "Toggle fold"),
        Keymap(keys: "zc", description: "Close fold"),
        Keymap(keys: "zo", description: "Open fold"),
        Keymap(keys: "zM", description: "Close all folds"),
        Keymap(keys: "zR", description: "Open all folds"),
        Keymap(keys: "zA", description: "Toggle all under cursor"),
    ]),
    
    // MARK: - Marks
    KeymapSection(title: "Marks", icon: "bookmark", keymaps: [
        Keymap(keys: "m{a-z}", description: "Set local mark"),
        Keymap(keys: "'{a-z}", description: "Jump to mark line"),
        Keymap(keys: "`{a-z}", description: "Jump to exact position"),
        Keymap(keys: ":delmarks a-z", description: "Delete marks a-z"),
    ]),
    
    // MARK: - Misc
    KeymapSection(title: "Miscellaneous", icon: "gearshape", keymaps: [
        Keymap(keys: "<Space>pa", description: "Copy file path"),
        Keymap(keys: "n/N", description: "Next/prev search (centered)"),
        Keymap(keys: "<leader>", description: "Space"),
    ]),
]
