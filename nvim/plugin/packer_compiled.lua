-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/rnkoaa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rnkoaa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rnkoaa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rnkoaa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rnkoaa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-spell"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/cmp-treesitter"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/go.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nightfox.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nord.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-base16"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.cmp\frequire\0" },
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    config = { "\27LJ\2\nC\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0&UltiSnipsRemoveSelectModeMappings\6g\bvim\0" },
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/rnkoaa/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\nC\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0&UltiSnipsRemoveSelectModeMappings\6g\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
