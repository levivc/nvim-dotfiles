return {
  "MunsMan/kitty-navigator.nvim",
  build = {
    "cp navigate_kitty.py ~/.config/kitty",
    "cp pass_keys.py ~/.config/kitty",
  },
  keys = {
    {"<A-h>", function() require("kitty-navigator").navigateLeft() end, desc = "Move left a Split", mode = {"n", "i", "t"}},
    {"<A-j>", function() require("kitty-navigator").navigateDown() end, desc = "Move down a Split", mode = {"n", "i", "t"}},
    {"<A-k>", function() require("kitty-navigator").navigateUp() end, desc = "Move up a Split", mode = {"n", "i", "t"}},
    {"<A-l>", function() require("kitty-navigator").navigateRight() end, desc = "Move right a Split", mode = {"n", "i", "t"}},
  },
}
