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
  --                __ __                 __       __
  --   ___ ___ _   / // /  ___ ____  ___/ /______/ /__ ______
  --  / -_)  ' \ / _  /  / _ `/ _ \/ _  / __/ -_|_-<(_-<
  --  \__/_/_/_//_//_/   \_,_/\___/\_,_/_/  \__/___/___/
  --
  -- Email address completion using notmuch
  -- Only triggers in To:/Cc:/Bcc: header fields
  -- Use Ctrl-X Ctrl-U to trigger completion
  {
    'adborden/vim-notmuch-address',
    ft = 'mail', -- Only load for mail filetype
  },
}
