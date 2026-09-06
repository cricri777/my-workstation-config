return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- default OFF at startup
    vim.g.completion = false

    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.g.completion
      end,
      set = function(state)
        vim.g.completion = state
      end,
    }):map("<leader>uk")

    opts.enabled = function()
      return vim.g.completion ~= false
    end

    return opts
  end,
}
