-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --   ______ __  __        __                   _ __     __
  --  / ___(_) /_/ /  __ __/ /    _______  ___  (_) /__  / /_
  -- / (_ / / __/ _ \/ // / _ \  / __/ _ \/ _ \/ / / _ \/ __/
  -- \___/_/\__/_//_/\_,_/_.__/  \__/\___/ .__/_/_/\___/\__/
  --                                    /_/
  'github/copilot.vim',
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  --              __                 __
  --   ___  ___  / /___ _  __ ______/ /
  --  / _ \/ _ \/ __/  ' \/ // / __/ _ \
  -- /_//_/\___/\__/_/_/_/\_,_/\__/_//_/
  {
    'yousefakbar/notmuch.nvim',
    config = function()
      -- Configuration goes here
      local opts =
        {
          notmuch_db_path = '/home/fwilde/Maildir',
          maildir_sync_cmd = '/home/fwilde/.local/bin/mbsync-all.sh',
          keymaps = { sendmail = '<C-g><C-g>' },
        }, require('notmuch').setup(opts)
    end,
  },
  --   _______             __
  --  / ___/ /__ ___ _____/ /__
  -- / /__/ / _ `/ // / _  / -_)
  -- \___/_/\_,_/\_,_/\_,_/\__/
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  config = function()
    require('claude-code').setup()
  end,
  --    ____           _ __          __   __
  --   / __/_ _  ___ _(_) / ___ ____/ /__/ /______ ___ ___
  --  / _//  ' \/ _ `/ / / / _ `/ _  / _  / __/ -_|_-<(_-<
  -- /___/_/_/_/\_,_/_/_/  \_,_/\_,_/\_,_/_/  \__/___/___/
  --
  --
  -- Email address completion using notmuch
  -- Only triggers in To:/Cc:/Bcc: header fields
  -- Use Ctrl-X Ctrl-U to trigger completion
  {
    'adborden/vim-notmuch-address',
    ft = 'mail', -- Only load for mail filetype
  },
  --                     _         __
  --    ___  _______    (_)__ ____/ /_
  --   / _ \/ __/ _ \  / / -_) __/ __/
  --  / .__/_/  \___/_/ /\__/\__/\__/
  -- /_/           |___/
  {
    'coffebar/neovim-project',
    opts = {
      projects = { -- define project roots
        '~/git/*',
      },
      picker = {
        type = 'telescope', -- one of "telescope", "fzf-lua", or "snacks"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      -- optional picker
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
      -- optional picker
      { 'ibhagwan/fzf-lua' },
      -- optional picker
      { 'folke/snacks.nvim' },
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },
  --                      __
  --   ___  ___ ___  ____/ /________ ___
  --  / _ \/ -_) _ \/___/ __/ __/ -_) -_)
  -- /_//_/\__/\___/    \__/_/  \__/\__/
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  --                _      __
  --  ___ ____ ____(_)__ _/ /
  -- / _ `/ -_) __/ / _ `/ /
  -- \_,_/\__/_/ /_/\_,_/_/
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  --                       _ __
  --   ___  ___ ___  ___ _(_) /_
  --  / _ \/ -_) _ \/ _ `/ / __/
  -- /_//_/\__/\___/\_, /_/\__/
  --               /___/
  {
    'NeogitOrg/neogit',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
      'nvim-mini/mini.pick', -- optional
      'folke/snacks.nvim', -- optional
    },
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
    },
  },
}
