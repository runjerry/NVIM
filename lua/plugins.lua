-- automatically install Packer.nvim
-- plugin installation location
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("Installing Pakcer.nvim ...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim installed")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Cannot find packer.nvim")
  return
end

packer.startup({
  function(use)
    -- Packer automatically upgrade itself
    use("wbthomason/packer.nvim")
    -------------------------- plugins -------------------------------------------
    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
          "kyazdani42/nvim-web-devicons",
      },
      tag = 'nightly'
    })
    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    })
    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    use("zane-/cder.nvim")
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    --------------------- LSP --------------------
    -- use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    -- use({ "williamboman/nvim-lsp-installer" })
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- complete engine
    use("hrsh7th/nvim-cmp")
    -- Snippet engine
    use("hrsh7th/vim-vsnip")
    -- completion resource
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- common programming language resource
    use("rafamadriz/friendly-snippets")
    -- UI enhancement
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")
    -- codes formatter
    use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- TypeScript enhancement
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- Lua enhhancement
    use("folke/lua-dev.nvim")
    -- JSON enhancement
    use("b0o/schemastore.nvim")
    -- Rust enhancement
    use("simrat39/rust-tools.nvim")
    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    use("mhartington/oceanic-next")
    -- gruvbox
    use({
      "ellisonleao/gruvbox.nvim",
      requires = { "rktjmp/lush.nvim" },
    })
    -- zephyr
    -- use("glepnir/zephyr-nvim")
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")
    -- moonfly
    use("bluz71/vim-moonfly-colors")
    -- neon
    use "rafamadriz/neon"
    -- neovim-ayu
    use("Shatur/neovim-ayu")
    -------------------------------------------------------
    use({ "akinsho/toggleterm.nvim" })
    -- surround
    use("ur4ltz/surround.nvim")
    -- Comment
    use("numToStr/Comment.nvim")
    -- nvim-autopairs
    use("windwp/nvim-autopairs")
    -- git
    use({ "lewis6991/gitsigns.nvim" })
    -- debug
    -- use("sakhnik/nvim-gdb")
    -- use({
    --     'tanvirtin/vgit.nvim',
    --     requires = {"nvim-lua/plenary.nvim"}
    --     })
    -- vimspector
    -- use("puremourning/vimspector")
    -- use {
    --     "puremourning/vimspector",
    --     cmd = { "VimspectorInstall", "VimspectorUpdate" },
    --     fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
    --     config = function()
    --         require("plugin-config.vimspector").setup()
    --     end,
    -- }
    ----------------------------------------------
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    -- use("Pocco81/DAPInstall.nvim")
    -- use("jbyuki/one-small-step-for-vimkind")

    use("j-hui/fidget.nvim")
    if paccker_bootstrap then
      packer.sync()
    end
  end,
  config = {
    -- locked plugin version is not in snapshots list
    -- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- locked version is v1, will not update plugin
    -- snapshot = "v1",

    -- mas jobs
    max_jobs = 16,
    -- customized resources
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    -- display = {
    -- use float window
    --   open_fn = function()
    --     return require("packer.util").float({ border = "single" })
    --   end,
    -- },
  },
})

-- when saving plugins.lua, automatically install plugins
-- move to autocmds.lua
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
