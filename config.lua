-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  { "lunarvim/colorschemes" },
  {
    "slugbyte/lackluster.nvim",
    config = function()
      require("lackluster").setup({
        tweak_background = {
        normal = 'none',    -- transparent
        -- normal = '#a1b2c3',    -- hexcode 
        -- normal = color.green,    -- lackluster color
        telescope = 'default', -- telescope
        menu = 'default',      -- nvim_cmp, wildmenu ... (bad idea to transparent)
        popup = 'default',     -- lazy, mason, whichkey ... (bad idea to transparent)
      },
      })
    end,
  }
}
lvim.colorscheme = "lackluster"
