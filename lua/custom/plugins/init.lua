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
}
