"==================================================
"
" 基本設定
"
"==================================================
" 行番号を表示
set number
" コマンドラインの行数
set cmdheight=1
" マウスを有効化
set mouse=a
" 画面を縦分割する際に右に開く
set splitright
" 画面を水平分割する際に下に開く
set splitbelow
" yank した文字列をクリップボードにコピー
set clipboard=unnamed
" バッファが編集中でもその他のファイルを開けるように
set hidden
" スワップファイルを作らない
set noswapfile
" カーソルのある行をハイライトする
set cursorline
" 検索時に大文字小文字を無視する
set ignorecase 
" 検索時に大文字を含んでいる場合は大文字小文字を区別する
set smartcase
" カレントディレクトリを自動で移動
set autochdir
" 行を折り返さない
set nowrap
" バッファ内で扱う文字コード(文字列)
set encoding=utf-8
" 読み込む文字コード
set fileencodings=utf-8,utf-16le,sjis,cp932
" windowの上下10行をscrolloffに設定
set scrolloff=10
" フォントを設定
set guifont=Iosevka\ Custom\ RD:h11
" ターミナルでも True Color を使えるようにする
set termguicolors
" ポップアップメニューを半透明化
set pumblend=10
" 不可視文字の可視化
set list
set listchars=eol:¬,tab:>-,trail:⋅,space:⋅,extends:»,precedes:«,nbsp:%
" 自動インデントやコマンドインデントの幅
set shiftwidth=4
" Tabキーで挿入するスペースの数
set softtabstop=4
" 何個分のスペースで1つのタブとしてカウントするか
set tabstop=4
" プログラミング言語に合わせて適切にインデントを自動挿入
set smartindent
" タブをスペースに置き換える
set expandtab


"==================================================
"
" キーバインド
"
"==================================================
" Leaderキーを設定
let mapleader = "\<Space>"
" jjかjkで挿入モードからノーマルモードに戻る
inoremap <silent> jj <Esc>
inoremap <silent> jk <Esc>
inoremap <silent> っｊ <Esc>
inoremap <silent> ｊｋ <Esc>
" 全選択
nnoremap <C-a> gg<S-v>G
" ファイルを保存
nnoremap <silent> <C-s> :w<Return>
inoremap <silent> <C-s> <ESC>:w<Return>
" タブを追加
nnoremap te :tabedit<Return>
" タブを閉じる
nnoremap tc :tabclose<Return>
" ウィンドウのサイズ調整
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-
" 表示行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Move tab
noremap <silent> <C-l> :tabnext<Enter>
noremap <silent> <C-h> :tabprev<Enter>
noremap <Tab>  <Cmd>BufferLineCycleNext<CR>
noremap <S-Tab>  <Cmd>BufferLineCyclePrev<CR>
" edgemotion
noremap <C-j> <Plug>(edgemotion-j)
noremap <C-k> <Plug>(edgemotion-k)
" release select
nnoremap <Esc><Esc> :nohl<CR>
" ターミナルモードから抜ける
:tnoremap <Esc> <C-\><C-n>
" 行を入れ換える
noremap <A-up> ddkP 
noremap <A-down> ddp
" 次の行に改行
inoremap <C-CR> <ESC>o
inoremap <C-S-CR> <ESC>ko
" バッファをリストから指定して開く
" nnoremap <C-b> <cmd>call quickui#tools#list_buffer('tabedit')<CR>
nnoremap <C-b> <cmd>Telescope buffers<CR>
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
" nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fb <cmd>Telescope file_browser<CR>
" Neo-treeを表示
nnoremap <leader>e <cmd>Neotree<CR>
" 検索文字に移動
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
" UndoTreeを表示
nnoremap <leader>u :UndotreeToggle<CR>
" treesitter playground
nnoremap <leader>; :TSPlaygroundToggle<CR>
nnoremap <leader>: :TSHighlightCapturesUnderCursor<CR>
nnoremap <leader>' :TSEditQueryUserAfter highlights 
nnoremap <leader>" :TSEditQuery highlights 
" vim-quickhl
nnoremap <Space>m <Plug>(quickhl-manual-this)
xnoremap <Space>m <Plug>(quickhl-manual-this)
nnoremap <Space>M <Plug>(quickhl-manual-reset)
xnoremap <Space>M <Plug>(quickhl-manual-reset)


"==================================================
"
" プラグイン
"
"==================================================
" 足りないプラグインがあれば :PlugInstall を実行
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" vim-plug :PlugInstall or :PlugClean
call plug#begin('/plugged')
" カラースキーム
Plug 'projekt0n/github-nvim-theme'
" 開いたファイルの内容を見てexpandtab等を自動設定
Plug 'tpope/vim-sleuth'
" :helpを日本語化
Plug 'vim-jp/vimdoc-ja'
" 通知
Plug 'rcarriga/nvim-notify'
" UIを置き換え
Plug 'folke/noice.nvim'
" Lua用
Plug 'nvim-lua/plenary.nvim'
" ファジーファインダー
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
" シンタックスハイライト
Plug 'nvim-treesitter/nvim-treesitter',{'merged': ':0'}
Plug 'nvim-treesitter/playground'
Plug 'p00f/nvim-ts-rainbow'
" ステータスライン
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" エラー表示
Plug 'folke/trouble.nvim'
" スクロールバー
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
" タブバーの装飾
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
" カーソルが当たった単語をハイライト
Plug 'RRethy/vim-illuminate'
" ブックマーク
Plug 'MattesGroeger/vim-bookmarks'
" 縦方向移動の補助
Plug 'haya14busa/vim-edgemotion'
" 検索時に何個目にマッチしたものかを表示
" Plug 'kevinhwang91/nvim-hlslens'
Plug 'rapan931/bistahieversor.nvim'
" 自動補完
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'andymass/vim-matchup'
" LSP管理
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" 関数のシグネチャヘルプを表示
Plug 'ray-x/lsp_signature.nvim'
" lspの状態を表示
Plug 'j-hui/fidget.nvim'
" デバッグ
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'
" コメントアウト
Plug 'numToStr/Comment.nvim'
" インデントの可視化
Plug 'lukas-reineke/indent-blankline.nvim'
" Git
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'
" Gitの状態を表示
Plug 'lewis6991/gitsigns.nvim'
" カーソルがいる行のコミット情報を表示
Plug 'rhysd/git-messenger.vim'
" git blameを表示
Plug 'APZelos/blamer.nvim'
" NerdFont
Plug 'lambdalisue/nerdfont.vim'
" 起動画面
Plug 'goolord/alpha-nvim'
" AI補完
Plug 'tzachar/cmp-tabnine', { 'do': 'powershell ./install.ps1' }
Plug 'github/copilot.vim'
" 補完時にアイコンを表示
Plug 'onsails/lspkind.nvim'
" 色コード部分に色を付与
Plug 'norcalli/nvim-colorizer.lua'
" ファイルツリー
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 's1n7ax/nvim-window-picker'
" 検索文字に移動
Plug 'justinmk/vim-sneak'
" マルチカーソル
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" fで飛べる単語を着色
Plug 'unblevable/quick-scope' 
" 変更履歴をツリー表示
Plug 'mbbill/undotree'
" レジスタの内容を表示
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
" 単語をマークする
Plug 't9md/vim-quickhl'
" メニュー
Plug 'skywind3000/vim-quickui'
" 入力を開始したコマンドのキーバインドを表示
Plug 'folke/which-key.nvim'
call plug#end()


"==================================================
"
" プラグイン詳細設定
"
"==================================================
"-------------------------
" fvim-illuminate
"-------------------------
" illuminateのハイライトを下線ではなく背景に設定
hi LspReferenceText gui=underline
hi LspReferenceWrite gui=underline
hi LspReferenceText gui=underline
autocmd VimEnter * hi LspReferenceText cterm=inverse gui=inverse
autocmd VimEnter * hi LspReferenceRead cterm=inverse gui=inverse
autocmd VimEnter * hi LspReferenceWrite cterm=inverse gui=inverse
hi link IlluminatedWordText Visual
hi link IlluminatedWordRead Visual
hi link IlluminatedWordWrite Visual

"-------------------------
" zenhan
"-------------------------
" 挿入モード終了時にIMEをオフ
if executable('zenhan')
autocmd InsertLeave * :call system('zenhan 0')
autocmd CmdlineLeave * :call system('zenhan 0')
endif

"-------------------------
" telescope.nvim
"-------------------------
lua << EOF
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
EOF

"-------------------------
" gitsigns.nvim
"-------------------------
lua << EOF
require('gitsigns').setup()
EOF

"-------------------------
" nvim-cmp
"-------------------------
lua << EOF
local cmp = require'cmp'

local lspkind = require('lspkind')
local source_mapping = {
        buffer      = "[Buffer]",
        nvim_lsp    = "[LSP]",
        nvim_lua    = "[Lua]",
        vsnip       = "[Vsnip]",
        cmp_tabnine = "[TN]",
        path        = "[Path]",
        git         = "[Git]",
        cmdline     = "[Cmdline]",
}

cmp.setup({
    snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<up>"] = cmp.mapping.select_prev_item(select_opts),
        ["<down>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                cmp.complete()
            end
        end, { 'i', 'c' }),
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp.complete()
            end
        end, { 'i', 'c' }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      { name = 'buffer' },
      { name = 'path' },
      { name = 'git' },
      { name = 'cmdline' },
      { name = 'cmp_tabnine' },
    }),
    formatting = {
    format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        local menu = source_mapping[entry.source.name]
        if entry.source.name == 'cmp_tabnine' then
            if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. ' ' .. menu
            end
            vim_item.kind = ''
        end
        vim_item.menu = menu
    return vim_item
    end
    },
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--  }

local tabnine = require('cmp_tabnine.config')
tabnine.setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = { 
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    },
    show_prediction_strength = false
})
EOF

"-------------------------
" lspsaga.nvim
"-------------------------
lua << EOF
local saga = require('lspsaga')
saga.init_lsp_saga({
  finder_action_keys = {
    open = "<CR>",
    vsplit = "v",
    split = "s",
    tabe = "t",
    quit = "q",
  },
  definition_action_keys = {
    edit = '<C-c><CR>',
    vsplit = '<C-c>v',
    split = '<C-c>s',
    tabe = '<C-c>t',
    quit = 'q',
},
})
EOF

"-------------------------
" lsp_signature.nvim
"-------------------------
lua << EOF
require "lsp_signature".setup()
EOF

"-------------------------
" nvim-treesitter
"-------------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
            "c_sharp",
            "sql",
            "markdown",
            "markdown_inline",
       --     "vim",
            "tsx",
            "python",
            "json",
            "html",
            "css",
            "scss",
        },
    highlight = {
        enable = true,  -- syntax highlightを有効にする
--        disable = {     -- 一部の言語では無効にする
--            'c_sharp',
--        }
    },
    matchup = {
            enable = true,
        }
}
EOF

" vscodeの場合はtreesitterを無効化する
if exists('g:vscode')
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = false,
  }
  }
EOF
endif

"-------------------------
" nvim-ts-rainbow
"-------------------------
lua << EOF
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 5000, -- Do not enable for files with more than n lines, int
    colors = {
      "#79b8ff",
      "#ffab70",
      "#b392f0",
    }
    -- termcolors = {} -- table of colour name strings
  }
}
EOF

" vscodeの場合はts-rainbowを無効化する
if exists('g:vscode')
lua << EOF
require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = false,
  }
}
EOF
endif
"-------------------------
" vim-illuminate
"-------------------------
lua << EOF
require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
})
EOF

"-------------------------
" Comment.nvim
"-------------------------
lua << EOF
require('Comment').setup()
EOF

"-------------------------
" indent-blankline.nvim
"-------------------------
lua << EOF
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

"-------------------------
" mason.nvim
"-------------------------
lua << EOF
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
EOF

"-------------------------
" mason-lspconfig.nvim
"-------------------------
lua << EOF
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
  require('lspconfig')[server].setup(opt)
end,
})
require'lspconfig'.omnisharp.setup {
    cmd = {"OmniSharp.exe","--languageserver"} -- パスを通しておく必要あり
    }
require'lspconfig'.powershell_es.setup {
    bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services"
    }
EOF

"-------------------------
" mason-lspconfig.nvim
"-------------------------
lua << EOF
local neogit = require('neogit')
neogit.setup {
    integrations = {
    diffview = true
    }
    }
local actions = require("diffview.actions")
require("diffview").setup({})
EOF

"-------------------------
" trouble.nvim
"-------------------------
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"-------------------------
" alpha-nvim
"-------------------------
lua << EOF
require'alpha'.setup(require'alpha.themes.dashboard'.config)
EOF

"-------------------------
" folke/which-key.nvim
"-------------------------
lua << EOF
local wk = require("which-key")
wk.setup()
EOF

"-------------------------
" fidget.nvim
"-------------------------
lua << EOF
require"fidget".setup{}
EOF

"-------------------------
" nvim-colorizer.lua
"-------------------------
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
lua require'colorizer'.setup()

"-------------------------
" nvim-window-picker
"-------------------------
lua << EOF
require 'window-picker'.setup{}
EOF

"-------------------------
" neo-tree.nvim
"-------------------------
lua << EOF
require("neo-tree").setup({
        window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = { 
                "toggle_node", 
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
            },
            ["<2-LeftMouse>"] = "open",
            ["<CR>"] = "open",
            ["S"] = "none",
            ["s"] = "none",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = { 
              "add",
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          }
        }
     })
EOF

"-------------------------
" github-nvim-theme
"-------------------------
lua << EOF
require('github-theme').setup({
    theme_style = "dark",
    comment_style = "NONE",
    transparent = "true",
--    colors = {
--        bg_search = '#282c34',
--    }
    overrides = function(c)
    return {
  --   comment = { fg = '#7a8a99' },
    }
  end,
  dev = true,
})
EOF

"-------------------------
" lualine.nvim
"-------------------------
lua << EOF
function searchCount()
  local search = vim.fn.searchcount({maxcount = 0}) -- maxcount = 0 makes the number not be capped at 99
  local searchCurrent = search.current
  local searchTotal = search.total
  if searchCurrent > 0 then
    return "/"..vim.fn.getreg("/").." ["..searchCurrent.."/"..searchTotal.."]"
  else
    return ""
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', file_status=true, path=3}},
    lualine_x = {
      {searchCount},'encoding', 'fileformat', 'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF

"-------------------------
" bufferline.nvim
"-------------------------
lua << EOF
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
     mode = 'tabs',
     indicator = { style = "icon", icon = "▎" },
     separator_style = { '', '' },
     --tab_size = 0,
     modified_icon = '',
     show_buffer_close_icons = true,
     show_close_icon = true,
     color_icons = true,
     always_show_bufferline = false,
  },
})
EOF

"-------------------------
" nvim-notify
"-------------------------
lua << EOF
require("notify").setup({
  background_colour = "#000000",
})
EOF

"-------------------------
" noice.nvim
"-------------------------
if !exists('g:vscode')
lua << EOF
require('noice').setup({
-- views = {
--       cmdline_popup = {
--         border = {
--           style = "none",
--           padding = { 2, 3 },
--         },
--         filter_options = {},
--         win_options = {
--           winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
--         },
--       },
--     },
  routes = {
      -- 検索のポップアップを非表示
      {
        filter = {
          event = "msg_show",
          ["not"] = { kind = "search_count" },
        },
        opts = { skip = true },
      },
      -- -- virtual textを非表示
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
  }
})
EOF
endif

"-------------------------
" vim-sneak
"-------------------------
highlight Sneak ctermfg=8 ctermbg=0
augroup ApplyHighlight
    autocmd!
    autocmd ColorScheme * highlight Sneak ctermfg=8 ctermbg=0
augroup end

"-------------------------
" APZelos/blamer.nvim
"-------------------------
let g:blamer_enabled = 1
let g:blamer_delay = 300
let g:blamer_date_format = '%y/%m/%d %H:%M'

"-------------------------
" bistahieversor.nvim
"-------------------------
lua << EOF
local bistahieversor = require('bistahieversor')

bistahieversor.setup({ maxcount = 1000, echo_wrapscan = true })
vim.keymap.set({'n', 'x', 'o'}, 'n', function() bistahieversor.n_and_echo() end)
vim.keymap.set({'n', 'x', 'o'}, 'N', function() bistahieversor.N_and_echo() end)
EOF

"-------------------------
" undotree
"-------------------------
if has("persistent_undo")
   let target_path = expand('$HOME\AppData\Local\nvim\.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

"-------------------------
" nvim-dap
"-------------------------
" 仮想環境を指定してdap-pythonを起動する
function! InstallVirtualEnv()
  if expand('%:e') == 'py'
    let g:python_env_path = expand('%:p:h') . '/env'

    if !isdirectory(g:python_env_path)
      lua vim.ui.select({ 'Create', 'Select' }, {
            \        prompt = 'Python virtual environment not found. Would you like to create or select one?',
            \        }, function(choice)
            \          vim.g.exec_choice = choice
            \        end)
      if g:exec_choice == 'Create' || g:exec_choice == 'Select'
        let g:python_env_path = input('VirtualEnvPath: ', g:python_env_path)
        " Selectの場合はパスが存在するか判定する
        if g:exec_choice == 'Select'
          if !isdirectory(g:python_env_path)
            let e = input('Python virtual environment not found. Create?(y/n)')
            if e != 'y'
              echo 'Not created.'
              return
            endif
          endif
        endif
        " 仮想環境と各種インストール
        let upgrade_pip = g:python_env_path . '/Scripts/python.exe -m pip install --upgrade pip'
        let install_debugpy = 'pip install debugpy'
        call system('python -m venv ' . g:python_env_path)
        call system(g:python_env_path . '/Scripts/Activate'. ' && ' . upgrade_pip . ' && ' . install_debugpy)
        echo ' Created a VirtualEnv.'
      else
        echo ' Did Not Create a VirtualEnv.'
      endif
    endif

    let g:launch_path = g:python_env_path . '/Scripts/python'
    lua require('dap-python').setup(vim.g.launch_path)
  endif
endfunction

call InstallVirtualEnv()

" pip installコマンド
command! Pip call PipInstallInEnv()
function! PipInstallInEnv()
  if !isdirectory(expand('%:p:h') . '/env')
    echo 'not exists ''./env'''
    return
  endif
  let &shell='powershell'
  let &shellcmdflag = '-c'
  let env = expand('%:p:h') . '/env' . '/Scripts/Activate.ps1'
  let cmd = input('command: ', 'pip install ')
  exec 'split | wincmd j | resize 10 | terminal '. env . ' ; ' . cmd
endfunction

command! PipCopy call PipCopy()
function! PipCopy()
  if !isdirectory(expand('%:p:h') . '/env')
    echo 'not exists ''./env'''
    return
  endif
  let &shell='powershell'
  let &shellcmdflag = '-c'
  let env = expand('%:p:h') . '/env' . '/Scripts/Activate.ps1'
  let cmd = input('command: ', 'pip freeze > requirements.txt')
  exec 'split | wincmd j | resize 10 | terminal '. env . ' ; ' . cmd
endfunction

lua require('dapui').setup()
lua require("nvim-dap-virtual-text").setup()

nnoremap <silent> <F4> <cmd>lua require'dapui'.toggle()<CR>
nnoremap <silent> <F5> <cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message(ex:{var}): '))<CR>
nnoremap <silent> <Leader>dr <cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <cmd>lua require'dap'.run_last()<CR>

lua vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

"-------------------------
" vim-quickui
"-------------------------
" clear all the menus
call quickui#menu#reset()
let g:quickui_border_style = 2

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File", ':call OpenFile()' ],
            \ [ "&Open File\tSpace fb", ':Telescope file_browser' ],
            \ [ "&Close\tCtrl+w c", ':close' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", ':w'],
            \ [ "Save &As", ':call SaveasFile()' ],
            \ [ "Save All\t:wa", ':wa' ],
            \ [ "Change&Encode", 'call ChangeEncode()' ],
            \ [ "Rename", 'call RenameCurrentFile()' ],
            \ [ "--", '' ],
            \ [ "Open $&MYVIMRC", ':e $MYVIMRC' ],
            \ [ "Source $M&YVIMRC", ':source $MYVIMRC' ],
            \ [ "--", '' ],
            \ [ "E&xit\t:qa", ':qa' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Undo', ':undo' ],
            \ [ '&Redo', ':redo' ],
            \ [ '--', ''],
            \ [ '&Copy', 'y' ],
            \ [ '&Paste', 'p' ],
            \ [ '--', ''],
            \ [ '&Find', ':call SearchFile()' ],
            \ [ 'R&eplace', ':call ReplaceWord()' ],
            \ ])

call quickui#menu#install ('&View', [
            \ [ "&Switch Buffer\tCtrl+b", 'call quickui#tools#list_buffer(''tabedit'')' ],
            \ [ '--', ''],
            \ [ "Find &files\tSpace ff", ':Telescope find_files' ],
            \ [ "File &browser\tSpace fb", ':Telescope file_browser' ],
            \ [ "Live &grep\tSpace fg", ':Telescope live_grep' ],
            \ [ '--', ''],
            \ [ "Open &Neotree\tSpace e", ':Neotree' ],
            \ [ "Open &Undotree\tSpace u", ':UndotreeToggle' ],
            \ [ "Open Neog&it\t:Neogit", ':Neogit' ],
            \ [ "Open &Mason\t:Mason", ':Mason' ],
            \ [ '--', ''],
            \ [ "Open T&erminal\t:T", ':T' ],
            \ [ '--', ''],
            \ [ "Open TSInstallInfo\t:TSInstallInfo", ':TSInstallInfo' ],
            \ [ "Open TS&Playground\tSpace ;", ':TSPlaygroundToggle' ],
            \ [ "Edit TS&QueryUser\tSpace '", 'call OpenUserSettingHi()' ],
            \ [ "Edit TSQuery&Default\tSpace \"", 'call OpenSettingHi()' ],
            \])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
            \ ['Set &Wrap %{&wrap? "Off":"On"}', 'set wrap!'],
            \ ['Set &Relativenumber %{&relativenumber? "Off":"On"}', 'set relativenumber!'],
            \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
            \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
            \ ])

call quickui#menu#install("&Run", [
            \ ["Start Debugging\t<F5>", ':lua require''dap''.continue()'],
            \ ["Step Over\t<F10>", ':lua require''dap''.step_over()'],
            \ ["Step Into\t<F11>", ':lua require''dap''.step_into()'],
            \ ["Step Out\t<F12>", ':lua require''dap''.step_out()'],
            \ [ '--', ''],
            \ ["Toggle Breakpoint\tSpace b", ':lua require''dap''.toggle_breakpoint()'],
            \ ["Set Breakpoint With Conditions\tSpace B", ':lua require''dap''.set_breakpoint(vim.fn.input(''Breakpoint condition: ''))'],
            \ ["Logpoints\tSpace lp", ':lua require''dap''.set_breakpoint(nil, nil, vim.fn.input(''Log point message (ex:{var}): ''))'],
            \ [ '--', ''],
            \ ["Toggle ui\t<F4>", ':lua require''dapui''.toggle()'],
            \ ], '<auto>', 'python,ps1,typescriptreact')

" register HELP menu with weight 10000
call quickui#menu#install('&Help', [
            \ ["&Cheatsheet", 'help index', ''],
            \ ['T&ips', 'help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'help tutor', ''],
            \ ['&Quick Reference', 'help quickref', ''],
            \ ['&Summary', 'help summary', ''],
            \ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" 別名で保存
function! SaveasFile()
  exec ':saveas ' quickui#input#open('Enter file name:')
endfunction
" ファイルを開く
function! OpenFile()
  exec ':e ' quickui#input#open('Enter file name:')
endfunction
" ファイル内検索
function! SearchFile()
  let @/ = quickui#input#open('Enter search word:')
  exec 'normal /' . @/ . '\<CR>'
endfunction
" 置換
function! ReplaceWord()
  let before = quickui#input#open('Enter before word:')
  let after = quickui#input#open('Enter after word:')
  let cmd = ':%s/'
  exec ':%s/' . before . '/' . after . '/gc'
endfunction
" Treesitterのハイライト設定を表示
function! OpenUserSettingHi()
  let file = quickui#input#open('Enter filetype')
  exec ':TSEditQueryUserAfter highlights ' . file
endfunction
function! OpenSettingHi()
  let file = quickui#input#open('Enter filetype')
  exec ':TSEditQuery highlights ' . file
endfunction

" hit space twice to open menu
noremap <silent> <space><space> :call quickui#menu#open()<CR>

" Custom Theme
if v:vim_did_enter
  hi! QuickBG guifg=#c9d1d9 guibg=NONE "#24292e
  hi! QuickSel gui=bold guifg=#c9d1d9 guibg=#39414a
  hi! QuickKey gui=bold guifg=#b392f0
  hi! QuickDefaultBorder guifg=#c9d1d9 guibg=NONE "#24292e
  hi! QuickDefaultInput guifg=#c9d1d9 guibg=NONE
else
  autocmd VimEnter * hi! QuickBG guifg=#c9d1d9 guibg=NONE "#24292e
  autocmd VimEnter * hi! QuickSel gui=bold guifg=#c9d1d9 guibg=#39414a
  autocmd VimEnter * hi! QuickKey gui=bold guifg=#b392f0
  autocmd VimEnter * hi! QuickDefaultBorder guifg=#c9d1d9 guibg=NONE "#24292e
  autocmd VimEnter * hi! QuickDefaultInput guifg=#c9d1d9 guibg=NONE
endif

" ノーマルモード時の右クリックコンテキストメニュー
let ncontent = [
            \ ["Goto Definition\tgd", 'exec "lua vim.lsp.buf.definition()"'],
            \ ["Open References\tgr", 'exec "Lspsaga lsp_finder"'],
            \ ["Formatting\tgf", 'exec "lua vim.lsp.buf.formatting()"'],
            \ ["Open Code Action\tga", 'exec "Lspsaga code_action"'],
            \ ["Open Diagnostics\tgx", 'exec ":TroubleToggle document_diagnostics"'],
            \ ['-'],
            \ ["Cut\tdd", 'exec "normal dd"'],
            \ ["Copy\tyy", 'exec "normal yy"'],
            \ ["Paste\tp", 'exec "normal p"'],
            \ ["Paste from register", ':Registers'],
            \ ['-'],
            \ ["Highlight word under cursor\tSpace m", 'exec ":call quickhl#manual#this(''n'')"'],
            \ ["Reset Highlight\tSpace M", 'exec ":call quickhl#manual#reset()"'],
            \ ['-'],
            \ ["Close Window\t:close", ':close'],
            \ ]
" set cursor to the last position
let opts = {'index':g:quickui#context#cursor}
noremap <RightMouse> <cmd>call quickui#context#open(ncontent, opts)<CR>
nnoremap J <cmd>call quickui#context#open(ncontent, opts)<CR>

" ビジュアルモード時の右クリックコンテキストメニュー
let vcontent = [
            \ ["Goto Definition\tgd", 'exec "lua vim.lsp.buf.definition()"'],
            \ ["Open References\tgr", 'exec "Lspsaga lsp_finder"'],
            \ ["Formatting\tgf", 'exec "lua vim.lsp.buf.formatting()"'],
            \ ["Open Code Action\tga", 'exec "Lspsaga code_action"'],
            \ ["Open Diagnostics\tgx", 'exec ":TroubleToggle document_diagnostics"'],
            \ ['-'],
            \ ["Cut\td", 'exec "normal d"'],
            \ ["Copy\ty", 'exec "normal y"'],
            \ ["Paste\tp", 'exec "normal p"'],
            \ ["Paste from register", ':Registers'],
            \ ['-'],
            \ ["Highlight word under cursor\tSpace m", 'exec ":call quickhl#manual#this(''v'')"'],
            \ ["Reset Highlight\tSpace M", 'exec ":call quickhl#manual#reset()"'],
            \ ['-'],
            \ ["Close Window\t:close", ':close'],
            \ ]
" set cursor to the last position
let opts = {'index':g:quickui#context#cursor}
vnoremap <RightMouse> <cmd>call quickui#context#open(vcontent, opts)<CR>


"==================================================
"
" スクリプト
"
"==================================================
"-------------------------
" Powershell or ターミナルを開く
"-------------------------
function! SetShell()
    let &shell = has('win32') ? 'powershell' : 'pwsh'
    let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
endfunction
set shellquote= shellxquote=
command! -nargs=* T call SetShell() | split | wincmd j | resize 10 | terminal <args>
autocmd TermOpen * startinsert

"-------------------------
" リネーム関数呼び出し
"-------------------------
" vim上で「スペースキー + n」でリネーム処理が行えるようにする。
map <leader>n :call RenameCurrentFile()<CR>

function! RenameCurrentFile()
  let old = expand('%')
  let new = input('新規ファイル名: ', old , 'file')
  if new != '' && new != old
    exec ':saveas ' . new
    exec ':silent !rm ' . old
    redraw!
  endif
endfunction


"-------------------------
" Markdownのチェックボックスをトグル
"-------------------------
autocmd BufNewFile,BufRead *.md nnoremap <leader>c :ToggleMarkdownCheckbox<CR>
command! ToggleMarkdownCheckbox call s:toggle_checkbox()
function! s:toggle_checkbox()
  let rowText = getline(line('.'))
  if rowText =~ '-\s\[\s\]'
    exec ':s/-\s\[\s\]/- \[x\]'
    exec 'normal $'
  elseif rowText =~ '-\s\[x\]'
    exec ':s/-\s\[x\]/- \[ \]'
    exec 'normal $'
  else
    echo 'Checkbox does not exist at cursor line.'
  endif
endfunction

"-------------------------
" 開いているバッファのフォルダパスを取得
"-------------------------
command! CopyPath call CopyPath()
function! CopyPath()
  let @* = expand('%:p')
  echo 'Copied : ' . @*
endfunction

"-------------------------
" フォーカスが当たっているウィンドウのみrelativenumberを有効
"-------------------------
augroup numbertoggled
    autocmd!
    autocmd BufEnter,FocusGained,WinEnter   * if &nu && mode() != "i"   | set relativenumber    | endif
    autocmd BufLeave,FocusLost,WinLeave     * if &nu                    | set nornu             | endif
augroup END

"-------------------------
" 文字コードを変更して開き直す
"-------------------------
function! ChangeEncode()
lua vim.ui.select({ 'shiftjis', 'utf-8', 'utf-16le' }, {
\         prompt = 'Select encode:',
\     }, function(choice)
\         if choice == 'shiftjis' then
\             vim.cmd(':e ++enc=shift_jis')
\         elseif choice == 'utf-8' then
\             vim.cmd(':e ++enc=utf-8')
\         elseif choice == 'utf-16le' then
\             vim.cmd(':e ++enc=utf-16le')
\         end
\     end)
endfunction
command! ChangeEncode call ChangeEncode()

"-------------------------
" ビルドインLSPの設定
"-------------------------
lua << EOF
-- keyboard shortcut
-- 変数の情報を表示
--vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
-- フォーマットを整える
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- 定義,参照を表示
vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
-- エラー・ヒントをリスト表示
vim.keymap.set('n', 'gx', '<cmd>TroubleToggle document_diagnostics<CR>')
-- 定義ジャンプ
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- 定義ジャンプ(水平分割)
vim.keymap.set('n', 'gds', ':split | lua vim.lsp.buf.definition()<CR>', bufopts)
-- 定義ジャンプ(垂直分割)
vim.keymap.set('n', 'gdv', ':vsplit | lua vim.lsp.buf.definition()<CR>', bufopts)
-- float windowで定義を表示
vim.keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>')
-- 変数名のリネーム
vim.keymap.set('n', 'gn', '<cmd>Lspsaga rename<CR>')
-- 実行可能な修正候補を表示
vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<CR>')
-- 現在の行より下の診断にジャンプ
vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>')
-- 現在の行より上の診断にジャンプ
vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
-- エラーのみジャンプ
vim.keymap.set("n", "gJ", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gK", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end)
-- 行の診断を表示
vim.keymap.set("n", "gs", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- VirtuelTextの表示制御
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
augroup END
]]
--  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
--  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()

-- アイコン設定
local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

-- diagnosticをhover表示
-- ref:https://xbgneb0083.hatenablog.com/entry/2022_6_12_avoid_conflict_lsp_hover
local function on_cursor_hold()
  if vim.lsp.buf.server_ready() then
    -- 無効化
    -- vim.diagnostic.open_float()
    --vim.cmd [[Lspsaga show_cursor_diagnostics]]
  end
end

local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
local function enable_diagnostics_hover()
  vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
  vim.api.nvim_create_autocmd({ "CursorHold" }, { group = diagnostic_hover_augroup_name, callback = on_cursor_hold })
end

local function disable_diagnostics_hover()
  vim.api.nvim_clear_autocmds({ group = diagnostic_hover_augroup_name })
end

vim.api.nvim_set_option('updatetime', 500)
enable_diagnostics_hover()

-- diagnosticがある行でホバーをするとすぐにdiagnosticのfloating windowで上書きされてしまうのを阻止する
-- ホバーをしたら一時的にdiagnosticを開くautocmdを無効化する
-- これだけだとそれ以降diagnosticが自動表示されなくなってしまうので有効化するautocmdを一回だけ発行して削除する
local function on_hover()
  disable_diagnostics_hover()

--  vim.lsp.buf.hover()
  vim.cmd [[Lspsaga hover_doc]]

  vim.api.nvim_create_augroup("lspconfig-enable-diagnostics-hover", { clear = true })
  -- ウィンドウの切り替えなどのイベントが絡んでくるとおかしくなるかもしれない
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { group = "lspconfig-enable-diagnostics-hover", callback = function()
    vim.api.nvim_clear_autocmds({ group = "lspconfig-enable-diagnostics-hover" })
    enable_diagnostics_hover()
  end })
end
vim.keymap.set('n', 'K', on_hover, opt) -- 変数の情報を表示
EOF

"-------------------------
" Vimの動作ログを取得
"-------------------------
command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start profile.txt
  profile func *
  profile file *
endfunction

"-------------------------
" ハイライトを上書き設定
"-------------------------
" 行番号
hi LineNr guifg=#6a737d
hi clear CursorLine
" TreeSitter
hi Keyword gui=NONE
if expand('%:e') == 'tsx'
    hi @tag guifg=#85e89d
    hi @punctuation.bracket guifg=#ffab70
    hi @punctuation.delimiter guifg=#c9d1d9
    hi @variable guifg=#79b8ff
    hi @property guifg=#c9d1d9
    hi @tag.attribute guifg=#b392f0
    hi @tag.delimiter guifg=#c9d1d9
    hi @parameter guifg=#ffab70
    hi @type.builtin guifg=#79b8ff 
endif
" floating window
hi NormalFloat guibg=NONE
hi FloatBorder guibg=#24292e
" vim-bookmarks
hi BookmarkSign guifg=#157efb
hi BookmarkAnnotationSign guifg=#157efb
hi BookmarkLine guifg=#157efb
hi BookmarkAnnotationLine guifg=#157efb
" noice.nvim
" hi NoiceCmdlinePopupBorder guifg=#79b8ff
" hi NoiceCmdlinePopupBorderSearch guifg=#ffab70
