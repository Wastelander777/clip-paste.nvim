if vim.g.loaded_clip_paste then
  return
end
vim.g.loaded_clip_paste = true

require("clip_paste").setup()
