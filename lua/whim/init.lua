local curl = require('plenary.curl')
local config = require('whim.config')

local Whim = {}

function Whim.setup(options)
  config.setup(options)
end

function Whim.getPage()
  local res = curl.request {
    url = 'https://api.notion.com/v1/blocks/' .. config.options.page_id .. '/children',
    method = 'get',
    accept = 'application/json',
    headers = {
      ['Authorization'] = 'Bearer ' .. config.options.auth_key,
      ['Notion-Version'] = '2021-07-27',
    }
  }

  if not res.status == 200 then
    return
  end
  print(res.body)
end

return Whim
