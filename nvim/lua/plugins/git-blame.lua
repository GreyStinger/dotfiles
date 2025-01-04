return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    message_template = " <summary> • <author> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M",
    virtual_text_column = 80,
  },
}
