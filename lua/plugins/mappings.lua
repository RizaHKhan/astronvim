return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["="] = "<cmd>Oil<cr>",
          ["Tt"] = ":Neotest run file<cr>",
          ["Tl"] = ":Neotest run last<cr>",
          ["Ts"] = ":Neotest summary<cr>",
          ["To"] = ":Neotest output<cr>",
          ["tn"] = { "<cmd>tabnew<cr>" },
          ["tl"] = { "<cmd>tabnext<cr>" },
          ["th"] = { "<cmd>tabprevious<cr>" },
          ["tc"] = { "<cmd>tabclose<cr>" },
          ["<leader>gh"] = { ":DiffviewFileHistory %<CR>" },
          ["<leader>gd"] = { ":DiffviewOpen<cr>" },
          ["<leader>ge"] = { ":DiffviewClose<cr>" },
          ["gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview Git hunk" },
          ["gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
          ["gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
