return {
  'RaafatTurki/hex.nvim',
  keys = {
    { "<leader>hd", function() require("hex").dump() end, desc = "Switch to hex view" },
    { "<leader>ha", function() require("hex").assemble() end, desc = "Switch to normal view" },
    { "<leader>ht", function() require("hex").toggle() end, desc = "Switch between hex and normal views" }
  }
}
