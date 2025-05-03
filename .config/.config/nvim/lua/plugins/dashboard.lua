local logo = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
      ]]

return {
  { "nvimdev/dashboard-nvim", enabled = false },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        pane_gap = 30,
        enabled = true,
        preset = {
          header = logo,
        },

        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },

          -- function()
          --   local path = vim.api.nvim_buf_get_name(0)
          --   path = svim.fs.normalize(path)
          --   path = path == "" and (vim.uv or vim.loop).cwd() or path
          --   local in_git = Snacks.git.get_root() ~= nil and string.find(path, "hometap") ~= nil
          --   local open_gitlab = function()
          --     vim.fn.jobstart("glab mr view -w", { detach = true })
          --   end
          --   local cmds = {
          --     {
          --       icon = " ",
          --       title = "My MRs",
          --       section = "terminal",
          --       cmd = "glab mr list --not-draft --assignee=@me",
          --       key = "G",
          --       action = function()
          --         if pcall(open_gitlab) then
          --           vim.notify("Opening MR in GitLab", "info")
          --         else
          --           vim.fn.jobstart("glab repo view -w", { detach = true })
          --         end
          --       end,
          --     },
          --     {
          --       icon = " ",
          --       title = "Assigned to Me",
          --       section = "terminal",
          --       cmd = "glab mr list --not-draft --reviewer=@me",
          --     },
          --     {
          --       icon = " ",
          --       title = "In Review",
          --       section = "terminal",
          --       cmd = "jira sprint list --current --status 'In Review'",
          --       key = "J",
          --       action = function()
          --         vim.fn.jobstart("jira open", { detach = true })
          --       end,
          --     },
          --   }
          --   return vim.tbl_map(function(cmd)
          --     return vim.tbl_extend("force", {
          --       pane = 2,
          --       section = "terminal",
          --       enabled = in_git,
          --       width = 90,
          --       padding = 2,
          --       ttl = 5 * 60,
          --       align = "right",
          --     }, cmd)
          --   end, cmds)
          -- end,
          { section = "startup" },
        },
      },
    },
  },
}
