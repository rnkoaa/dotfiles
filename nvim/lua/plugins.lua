-- if has('nvim-0.5')
--   augroup lsp
--     au!
--     au FileType java lua require('jdtls').start_or_attach({cmd = {'/home/rongshen/.config/nvim/jdt-language-server/start_jdtls'}})
--   augroup end
-- endif
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = DATA_PATH .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

local use = require('packer').use
return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'       -- Package manager

    use 'windwp/nvim-autopairs'
    use {
      "SirVer/ultisnips",
      requires = { "honza/vim-snippets" },
      config = function()
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
    }
    use 'onsails/lspkind-nvim'
    
    use 'neovim/nvim-lspconfig'
    use 'anott03/nvim-lspinstall'
    use 'glepnir/lspsaga.nvim'

    use 'glepnir/dashboard-nvim'

    -- use 'joshdick/onedark.vim'         -- Theme inspired by Atom
    -- use { 'sainnhe/edge' }
    use 'navarasu/onedark.nvim'
    use 'shaunsingh/nord.nvim'
    -- use 'itchyny/lightline.vim'        -- Fancier statusline
    --
    -- Add indentation guides even on blank lines
    use { 'lukas-reineke/indent-blankline.nvim', branch="master" }

    use { 'mhartington/formatter.nvim'}

    -- Add git related info in the signs columns and popups
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
    -- use 'hrsh7th/nvim-compe'           -- Autocompletion plugin
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- Completion - use either one of this
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "hrsh7th/cmp-nvim-lua",
        "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "ray-x/cmp-treesitter",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }

    use {"nvim-treesitter/nvim-treesitter"}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use {'nvim-treesitter/playground' }

    use {"chriskempson/base16-vim"}

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, 
            {'nvim-lua/plenary.nvim'}
        }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- go config
    use {"ray-x/go.nvim"}

    use 'jremmen/vim-ripgrep'

    -- Vim dispatch
    use { 'tpope/vim-dispatch' }

     -- Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    }

   -- Icons
    use { 'kyazdani42/nvim-web-devicons'}
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Fugitive for Git
    use 'tpope/vim-fugitive'           -- Git commands in nvim
    use 'tpope/vim-rhubarb'            -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary'         -- "gc" to comment visual regions/lines
    use { 'tpope/vim-surround' }

    use {'RRethy/nvim-base16'}

    use { 'mfussenegger/nvim-jdtls'}

    -- debugging support
    use 'mfussenegger/nvim-dap'

    use { 'mattn/emmet-vim' }

    use {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        run = 'cd app && yarn install'
    }

    use { 'junegunn/goyo.vim'}
end
)

