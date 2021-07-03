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
    use 'onsails/lspkind-nvim'
    
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'anott03/nvim-lspinstall'
    use 'glepnir/lspsaga.nvim'

    use 'glepnir/dashboard-nvim'

    -- use 'joshdick/onedark.vim'         -- Theme inspired by Atom
    -- use { 'sainnhe/edge' }
        use 'navarasu/onedark.nvim'
    -- use 'itchyny/lightline.vim'        -- Fancier statusline
    --
    -- Add indentation guides even on blank lines
    use { 'lukas-reineke/indent-blankline.nvim', branch="lua" }

    use 'sbdchd/neoformat'

    -- Add git related info in the signs columns and popups
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
    use 'hrsh7th/nvim-compe'           -- Autocompletion plugin

    use {"nvim-treesitter/nvim-treesitter"}
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
    use 'kyazdani42/nvim-tree.lua'

   -- Icons
    -- use {"kyazdani42/nvim-web-devicons", opt = true}
    use { 'kyazdani42/nvim-web-devicons'}

    -- Fugitive for Git
    use 'tpope/vim-fugitive'           -- Git commands in nvim
    use 'tpope/vim-rhubarb'            -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary'         -- "gc" to comment visual regions/lines
    use { 'tpope/vim-surround' }

    use {'RRethy/nvim-base16'}
    use { 'sindrets/diffview.nvim' }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use { 'mfussenegger/nvim-jdtls'}
end
)

-- require'nvim-web-devicons'.get_icons()
