fun! Whim()
  lua for k in pairs(package.loaded) do if k:match("^whim") then package.loaded[k] = nil end end
  lua << EOF
  require('whim').setup {
  }
EOF
  lua require('whim').getPage()
endfun

augroup Whim
  autocmd!
augroup END
