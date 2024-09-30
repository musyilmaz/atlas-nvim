return {
  {
    "OscarCreator/rsync.nvim",
    build = "make",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local rsync = require("rsync")

      rsync.setup()
    end,
  },
}
