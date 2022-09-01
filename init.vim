"==================================================
"
" 基本設定
"
"==================================================
" 行番号を表示
set number
" マウスを有効化
set mouse=a
" プログラミング言語に合わせて適切にインデントを自動挿入
set smartindent
" 各コマンドやsmartindentで挿入する空白の量
set shiftwidth=4
" Tabキーで挿入するスペースの数
set softtabstop=4
" 画面を縦分割する際に右に開く
set splitright
" yank した文字列をクリップボードにコピー
set clipboard=unnamed
" カーソルのある行をハイライトする
set cursorline
" 検索した文字をハイライトする
"set hls
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
" 読み込む文字コード(文字列のリスト) :UTF-8を試し、だめならShift_JIS
set fileencodings=utf-8,cp932
" windowの20%をscrolloffに設定
autocmd BufRead,BufNewFile,WinEnter * execute "setlocal scrolloff=" . str2nr(string(floor((line('w$') - line('w0')) * 0.20)))
" フォントを設定
set guifont=Iosevka\ Custom\ RD:h11
" ターミナルでも True Color を使えるようにする
set termguicolors
" ポップアップメニューを半透明化
set pumblend=30


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
nnoremap <C-s> :w<Return>
inoremap <C-s> <ESC>:w<Return>
" タブを追加
nnoremap te :tabedit<Return>
" タブを閉じる
nnoremap tc :tabclose<Return>
" ウィンドウを分割
" nnoremap ss :split<Return><C-w>w
" nnoremap sv :vsplit<Return><C-w>w
" 他ウィンドウへの移動
nnoremap s<left> <C-w>h
noremap s<up> <C-w>k
noremap s<down> <C-w>j
noremap s<right> <C-w>l
"noremap sh <C-w>h
"noremap sk <C-w>k
"noremap sj <C-w>j
"noremap sl <C-w>l
" ウィンドウのサイズ調整
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-
" Move tab
noremap <C-j> :tabnext<Enter>
noremap <C-k> :tabprev<Enter>
" edgemotion
noremap <C-j> <Plug>(edgemotion-j)
noremap <C-k> <Plug>(edgemotion-k)
" release select
nnoremap <Esc><Esc> :nohl<CR>
" サイドバーを表示
"nnoremap <leader>e <cmd>Fern . -reveal=% -drawer -toggle <Return>
" ターミナルモードから抜ける
:tnoremap <Esc> <C-\><C-n>
" 行を入れ換える
noremap <A-up> ddkP 
noremap <A-down> ddp
" 次の行に改行
inoremap <C-CR> <ESC>o
inoremap <C-S-CR> <ESC>ko
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
" nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fb :Telescope file_browser<CR>
" エラー内容をトグル
nnoremap <leader>xx <cmd>TroubleToggle<CR>
" Neo-treeを表示
nnoremap <leader>e <cmd>Neotree<CR>
" 検索文字に移動
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F


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
" :helpを日本語化
Plug 'vim-jp/vimdoc-ja'
" 通知
Plug 'rcarriga/nvim-notify'
" Lua用
Plug 'nvim-lua/plenary.nvim'
" ファジーファインダー
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter',{'merged': ':0'}
Plug 'nvim-telescope/telescope-file-browser.nvim'
" ステータスライン
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" エラー表示
Plug 'folke/trouble.nvim'
" スクロールバー
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
" タブバーの装飾
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" メニュー
Plug 'sunjon/stylish.nvim'
" カーソルが当たった単語をハイライト
Plug 'RRethy/vim-illuminate'
" 縦方向移動の補助
Plug 'haya14busa/vim-edgemotion'
" 検索時に何個目にマッチしたものかを表示
Plug 'kevinhwang91/nvim-hlslens'
" ファイラー
Plug 'lambdalisue/fern.vim'
" 自動補完
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'williamboman/mason.nvim' ":Masonでサーバ管理の画面を開く
Plug 'williamboman/mason-lspconfig.nvim'
" lspの状態を表示
Plug 'j-hui/fidget.nvim'
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
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
" 起動画面
Plug 'goolord/alpha-nvim'
" AI補完
Plug 'tzachar/cmp-tabnine', { 'do': 'powershell ./install.ps1' }
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
Plug 'cohama/lexima.vim'
call plug#end()


"==================================================
"
" プラグイン詳細設定
"
"==================================================
"-------------------------
" fern.vim
"-------------------------
" NerdFontを設定
let g:fern#renderer = "nerdfont"

function! s:init_fern() abort
    " ウィンドウ移動のショートカットと被るためファイル開いてしまわないよう調整
    nmap <buffer><nowait> sl <C-w>l
    nmap <buffer><nowait> o <Plug>(fern-action-open:select)
endfunction
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

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
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
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
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--  }
require'lspconfig'.omnisharp.setup {
    cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" },
    }
EOF

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
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
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
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })
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
" stylish.nvim
"-------------------------
lua << EOF
vim.cmd [[
amenu Plugin.Fugitive.GFetch :GFetch | amenu Plugin.Fugitive.GPull :GPull | amenu Plugin.Fugitive.GPush :GPush
amenu File.Filetype.:q :q | amenu File.Filetype.Two :echo 2 | amenu File.Filetype.Three :echo 3
amenu Edit.Recent.Foo :echo 'foo' | amenu Edit.Recent.Bar :echo 'bar' | amenu Edit.Recent.Baz :echo 'baz'
amenu Edit.Diff.Revision_1 :echo 'rev_1' | amenu Edit.Diff.Revision_2 :echo 'rev_2' | amenu Edit.Diff.Revision_3 :echo 'rev_3'
]]

for i = 1, 16 do
  vim.cmd('amenu OverflowList.Test_Thing_' .. i .. ' :echo ' .. i)
end
vim.api.nvim_set_keymap(
  'n',
  '<F1>',
  "<Cmd>lua require'stylish'.ui_menu(vim.fn.menu_get(''), {kind=menu, prompt = 'Main Menu', experimental_mouse = true}, function(res) print('### ' ..res) end)<CR>",
  { noremap = true, silent = true }
)
EOF

"-------------------------
" alpha-nvim
"-------------------------
lua << EOF
require'alpha'.setup(require'alpha.themes.dashboard'.config)
EOF

"-------------------------
" tabnine
"-------------------------
lua << EOF
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
local lspkind = require('lspkind')

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

require'cmp'.setup {
	sources = {
		{ name = 'cmp_tabnine' },
	},
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
}
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
--    colors = {
--	    bg_search = '#282c34',
--	}
})
EOF

"-------------------------
" lualine.nvim
"-------------------------
lua << EOF
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
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    show_close_icon = true,
    color_icons = true
  },
})
EOF

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


"==================================================
"
" スクリプト
"
"==================================================
"-------------------------
" Powershell or ターミナルを開く
"-------------------------
let &shell = has('win32') ? 'powershell' : 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=
command! -nargs=* T split | wincmd j | resize 10 | terminal <args>
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
" ビルドインLSPの設定
"-------------------------
lua << EOF
-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')	    -- 変数の情報を表示
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')  -- フォーマットを整える
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')  -- 変数を参照している箇所を一覧表示
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')  -- 定義ジャンプ
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')	    -- 変数名のリネーム
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>') -- 実行可能な修正候補を表示
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
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
EOF

