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

-- TODO IMPROVEMENTS
-- use 16-bit words: leftmost 12 bits are the number of repeats, rightmost 4 bits is the color of the pixel
-- split the 16 bits into two 8-bit words
-- translate each 8-bit word into one of the P8SCII characters
-- now the RLE compression is base256 encoded, which should make resulting strings even shorter

-- binary:     0000 0001 0011     1010
-- RLE:          19 repeats     color 10
------------------------------------------
-- binary:       0000 0001      0011 1010
-- P8SCII:          \*             ':'

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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000