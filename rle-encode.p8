pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- fletch
-- a tool to export a spritesheet as an RLE encoded string

-- usage (run these from the PICO-8 console)
-- `load rle-encode.p8`
-- `import <spritesheet>.png`
-- `run`
-- now the spritesheet string is copied to your clipboard

-- color to hex table
local color2hex = { [0]='0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f' }

function _init()
  cls(0)

  -- accumulator
  local result = '128'

  -- state tracking
  local lastColor = sget(0, 0)
  local numCounted = 0
  
  -- loop from left to right, then top to bottom
  for y=0,127 do
    for x=0,127 do
      local curColor = sget(x, y)

      if (curColor == lastColor) then
        numCounted += 1
      else
        result ..= ','..numCounted..color2hex[lastColor]
        numCounted = 1
      end

      lastColor = curColor
    end
  end

  -- finish the result string
  result ..= ','..numCounted..color2hex[lastColor]

  -- print the result to the clipboard
  printh(result, '@clip')

  -- visual feedback
  print('results sent to clipboard', 14, 61, 7)
  cursor(0, 122)
end

__gfx__
00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
00700700111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
00077000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
00077000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
00700700111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff
