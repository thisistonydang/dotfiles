-- Rex configuration

-- Move focus between splits with Option+Command and Vim direction keys.
rex.bind("alt+cmd+h", "pane.focus", { direction = "left" })
rex.bind("alt+cmd+j", "pane.focus", { direction = "down" })
rex.bind("alt+cmd+k", "pane.focus", { direction = "up" })
rex.bind("alt+cmd+l", "pane.focus", { direction = "right" })

-- Create splits with Shift+Command and Vim direction keys.
rex.bind("shift+cmd+h", "pane.split", { direction = "left" })
rex.bind("shift+cmd+j", "pane.split", { direction = "down" })
rex.bind("shift+cmd+k", "pane.split", { direction = "up" })
rex.bind("shift+cmd+l", "pane.split", { direction = "right" })

-- Resize panes with Shift+Command and arrow keys.
rex.bind("shift+cmd+left", "pane.resize", { direction = "left" })
rex.bind("shift+cmd+down", "pane.resize", { direction = "down" })
rex.bind("shift+cmd+up", "pane.resize", { direction = "up" })
rex.bind("shift+cmd+right", "pane.resize", { direction = "right" })
rex.bind("shift+cmd+=", "pane.balance")

