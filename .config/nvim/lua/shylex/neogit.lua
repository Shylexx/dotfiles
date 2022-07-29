local neogit = require('neogit')
local nnoremap = require('shylex.keymap').nnoremap

neogit.setup {}

-- leader gs to open neogit
nnoremap("<leader>gs", function()
  neogit.open({ })
end);

-- leader ga to fetch all
nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
