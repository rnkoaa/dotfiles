# Simple Quick NVIM Config

Quickly configure nvim for writing code in the following languages

-   Java
-   Typescript
-   JavaScript
-   Lua

## Language Servers

-   Java
-   Typescript
-   JavaScript
-   Bash

## Plugins

-   nightfox
-   neo-tree
-   formatter
-   nvim-lspconfig
-   nvim-treesitter
-   lualine.nvim
-   lspsaga-nvim
-   lspkind-nvim
-   vim-jsx-pretty
-   nvim-autopairs
-   nvim-telescope
-   nvim-cmp
-   luasnip
-   vim-commentary
-   indent-blankline
-   nvim-jdtls

npm install @microsoft/compose-language-service

## Links

## lazy nvim helper
https://medium.com/linux-with-michael/lazy-nvim-the-blazingly-fast-neovim-package-manager-19a7a952835c

-   https://github.com/systemcoding/dotfiles
-   https://github.com/igorgue/dotnvim/blob/main/lua/plugins/extras/lang/java.lua

## Inspiration

- https://github.com/alpha2phi/modern-neovim

## kotlin language server

How to setup kotlin language server

```sh
cd  ~/.config/kotlin-language-server
./gradlew :server:installDist
ln -s ~/.config/kotlin-language-server/server/build/install/server/bin/kotlin-language-server ~/bin/kotlin-language-server
kotlin-language-server
```

