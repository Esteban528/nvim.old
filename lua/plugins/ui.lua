return {
  {
    "echasnovski/mini.starter",
    version = false,
    -- lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    event = "VimEnter",
    opts = function()
      local logo = table.concat({
        "         *                  *",
        "             __                *",
        "          ,db'    *     *",
        "         ,d8/       *        *    *",
        "         888",
        "         `db\\       *     *",
        "           `o`_                    **",
        "      *               *   *    _      *",
        "            *                 / )",
        "         *    (\\__/) *       ( (  *",
        "       ,-.,-.,)    (.,-.,-.,-.) ).,-.,-.",
        "      | @|  ={      }= | @|  / / | @|o |",
        "     _j__j__j_)     `-------/ /__j__j__j_",
        "     ________(               /___________",
        "      |  | @| \\              || o|O | @|",
        "      |o |  |,'\\       ,   ,\"|  |  |  |",
        "     vV\\|/vV|`-'\\  ,---\\   | \\Vv\\hjwVv\\//v",
        "                _) )    `. \\ /",
        "               (__/       ) )",
        "                         (_/"
      }, "\n")


      print(logo)

      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Find file", "Telescope find_files", "Telescope"),
          new_section("Recent files", "Telescope oldfiles", "Telescope"),
          new_section("Grep text", "Telescope live_grep", "Telescope"),
          new_section("Config", "lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config')})", "Config"),
          new_section("Extras", "LazyExtras", "Config"),
          new_section("Lazy", "Lazy", "Config"),
          new_section("New file", "ene | startinsert", "Built-in"),
          new_section("Quit", "qa", "Built-in"),
          new_section("Session restore", [[lua require("persistence").load()]], "Session"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
    config = function(_, config)
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      local starter = require("mini.starter")
      starter.setup(config)
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function(ev)
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 8)
          starter.config.footer = pad_footer
              .. "⚡ Neovim loaded "
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms"
          if vim.bo[ev.buf].filetype == "starter" then
            pcall(starter.refresh)
          end
        end,
      })
    end,
  },
}
