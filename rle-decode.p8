pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- fletch
-- tools to add an effective 4 more spritesheets to PICO-8

-- spritesheet 0 (part of the cartridge data)
-- spritesheet 1-4 (pasted RLE strings from rle-encode.p8)

local rle_spritesheet_one = '128,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,20,17,20,17,20,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,30,27,30,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,30,27,30,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,20,17,20,17,20,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,153600'
local rle_spritesheet_two = '128,17,60,17,810,17,40,17,340,17,40,17,810,37,20,37,340,17,20,17,50,28,60,2a,60,2b,60,2c,510,27,40,27,350,27,50,28,12,18,40,1a,19,2a,40,2b,13,1b,40,1c,11,2c,500,17,60,17,350,27,50,18,12,28,40,2a,19,1a,40,1b,13,2b,40,2c,11,1c,270,67,170,87,340,17,20,17,50,28,60,2a,60,2b,60,2c,50,47,200,17,20,17,190,17,10,27,10,17,340,17,40,17,340,17,40,17,20,67,20,67,40,27,30,87,90,67,330,17,60,17,320,167,20,47,40,17,20,17,20,27,40,27,90,17,40,17,1970,27,180,17,20,17,20,17,10,17,20,17,20,17,180,27,20,27,370,17,10,17,280,17,20,27,90,17,10,17,10,17,30,17,10,17,10,17,260,57,20,17,320,17,20,17,10,17,10,17,40,17,10,17,60,27,20,27,90,17,10,17,40,17,70,17,360,67,10,17,330,37,30,57,10,17,10,17,50,27,20,27,50,17,20,17,10,17,40,17,10,17,40,27,10,27,20,27,30,27,10,17,50,17,180,67,340,17,20,37,20,17,10,17,30,17,50,17,40,17,50,37,20,17,50,17,70,17,380,47,360,37,50,57,50,17,60,17,40,17,40,17,110,17,10,17,10,17,30,17,10,17,10,17,290,27,360,17,30,17,40,17,10,17,40,67,20,67,20,47,190,17,20,17,20,17,10,17,20,17,20,17,670,17,30,17,10,17,30,17,20,47,100,37,900,47,40,17,30,17,10,17,30,17,20,17,20,47,40,47,40,47,40,47,40,47,40,47,40,47,520,47,30,27,20,27,10,27,10,37,10,17,40,87,50,17,40,17,20,17,40,17,20,17,40,17,20,17,40,17,20,17,40,17,510,47,30,37,10,37,10,17,10,17,10,17,10,17,20,37,60,37,30,17,10,27,10,17,20,17,10,27,10,17,20,17,10,17,20,17,20,17,10,27,10,17,20,17,40,17,510,17,60,17,10,17,10,17,10,17,10,37,10,67,100,37,10,17,40,17,20,17,10,27,10,17,20,17,40,17,20,17,10,17,20,17,20,17,40,17,510,17,50,27,10,37,10,17,10,27,20,27,30,47,40,47,30,17,40,17,20,17,40,17,20,17,40,17,20,17,40,17,20,17,40,17,510,17,50,17,30,17,20,17,20,17,30,17,50,87,60,47,40,47,40,47,40,47,40,47,580,17,30,17,20,17,20,17,30,17,10,57,60,57,880,87,10,17,10,17,10,17,10,17,10,67,90,27,120,27,20,47,740,27,50,27,70,17,60,17,80,27,30,17,40,17,30,27,10,17,40,17,20,57,80,16,570,17,10,17,40,17,70,27,60,17,40,27,20,27,20,17,10,17,20,17,10,17,20,37,30,17,20,87,20,16,30,16,17,16,560,17,20,17,30,27,70,17,60,17,10,47,10,17,10,27,20,37,20,37,20,37,30,17,20,27,20,17,20,17,10,16,17,16,10,16,27,16,560,17,30,17,20,17,70,27,60,17,20,17,20,27,10,27,10,27,10,47,10,27,10,37,10,37,20,87,10,16,27,16,27,16,570,17,40,17,10,27,70,17,60,17,80,27,10,27,10,47,10,27,10,37,60,17,10,57,30,16,37,16,580,17,50,27,70,27,60,17,80,27,20,37,20,37,20,27,10,17,40,17,30,17,10,17,50,16,17,16,590,97,10,17,10,17,10,17,20,67,90,27,120,27,20,47,130,16,630,187,60,107,40,147,20,67,660,27,180,27,20,27,100,27,10,17,140,27,60,17,650,17,200,17,20,17,120,17,10,17,140,27,60,17,640,17,220,27,140,27,140,27,60,17,640,17,220,27,140,27,140,27,60,17,640,17,220,17,10,17,120,17,10,17,140,27,60,17,10,227,20,67,330,17,220,17,10,27,100,27,10,17,140,27,60,27,220,27,60,17,320,17,220,17,30,107,30,17,140,27,60,27,220,27,60,17,320,17,100,27,100,17,30,27,30,97,140,27,60,17,640,17,80,27,20,27,80,17,10,27,20,27,90,17,140,27,60,17,640,17,80,17,40,17,80,17,10,17,40,17,90,17,140,27,60,17,640,17,70,17,60,17,70,27,60,17,80,17,140,27,60,17,640,17,70,17,60,17,70,27,60,17,80,17,140,27,60,17,640,17,80,17,40,17,80,27,60,17,80,17,140,27,60,17,640,17,80,27,20,27,80,27,60,17,80,17,140,27,60,17,640,17,100,27,100,27,60,97,10,147,20,67,650,17,220,27,60,27,60,17,10,67,20,147,650,17,220,27,60,27,60,27,60,27,140,17,640,17,220,27,60,27,60,27,60,27,140,17,640,17,220,27,60,27,60,27,60,27,140,17,640,17,220,27,60,27,60,27,60,27,140,17,650,17,200,17,20,17,40,17,10,17,60,27,60,27,140,17,650,27,180,27,20,27,20,27,10,17,60,27,60,27,140,17,670,187,60,27,30,17,60,17,10,67,20,147,10900,24,15,14,15,14,15,11,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,17,16,20,14,16,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,14,15,12,15,50,16,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,11,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,24,16,50,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,24,16,60,14,16,200,14,16,14,16,280,14,16,14,16,280,14,16,14,16,280,14,16,14,16,100,14,16,17,150,14,16,14,16,280,14,16,14,16,80,14,26,12,160,14,16,14,16,17,270,14,16,14,16,60,14,16,12,11,20,1b,14,20,1b,10,18,14,19,14,19,14,19,14,1a,24,16,14,16,280,14,16,14,16,280,14,16,14,16,280,14,16,14,16,80,15,12,10,15,11,14,11,14,12,14,100,14,16,14,16,190,13,80,14,16,14,16,80,14,16,160,12,11,14,16,10,15,14,15,14,15,14,15,14,15,14,15,24,20,19,130,14,16,14,16,70,16,14,15,14,15,16,15,12,13,12,13,25,11,16,11,16,11,16,11,16,12,15,14,16,280,14,16,14,16,280,14,16,14,16,90,14,11,14,12,14,60,13,15,40,19,10,14,16,14,16,40,11,40,14,80,12,14,60,15,12,14,16,14,16,160,12,13,12,13,12,13,60,14,16,14,16,90,15,12,14,60,13,15,50,14,11,14,12,15,14,16,280,14,16,14,16,280,14,16,14,16,280,14,16,14,16,280,14,16,14,16,50,24,15,11,16,20,11,16,14,15,14,15,14,15,12,16,60,14,16,14,16,40,13,24,15,11,16,11,16,11,16,11,16,11,16,11,16,14,15,14,15,14,15,14,15,12,15,14,16,280,14,16,14,16,90,16,11,16,14,15,14,15,14,15,11,16,14,15,14,15,11,16,11,16,12,15,14,16,140,17,130,14,16,14,16,280,14,16,14,16,200,26,14,15,14,15,14,15,11,16,12,16,290,16,12,16,40,14,16,40,13,16,140,17,10,14,16,14,16,280,14,16,14,16,280,14,16,14,16,280,14,16,14,16,80,13,24,15,14,15,14,15,14,15,24,80,14,16,14,16,290,16,12,16,200,12,13,430,12,17,10,14,16,130,24,15,14,15,14,15,14,15,12,15,14,16,17,270,14,16,14,16,280,14,16,14,16,11,250,16,12,14,16,10,15,24,260,14,16,14,16,520,12,13,70,14,12,14,290,14,11,24,15,14,15,12,15,19,30,13,24,15,14,15,14,15,12,16,80,14,16,10,15,17,16,11,13,60,13,24,15,14,15,24,20,19,30,13,24,15,12,15,14,16,11,280,16,12,16,60,11,13,60,11,13,11,13,11,13,80,14,16,14,16,11,50,13,15,200,14,16,14,16,20,11,190,23,50,12,10,12,170,24,15,14,15,14,15,14,15,14,15,12,15,14,16,17,240,12,17,10,14,16,14,16,11,30,14,16,220,14,16,14,16,11,12,11,12,11,12,11,12,11,12,100,19,50,16,13,10,16,11,16,14,15,17,16,530,24,15,11,16,11,16,14,15,14,15,14,15,11,16,14,15,24,40,19,110,14,16,14,16,20,13,15,60,13,15,100,13,15,50,14,12,14,160,17,15,100,14,16,10,15,11,14,12,14,200,26,14,15,12,15,14,16,50,16,14,15,14,15,24,170,16,11,16,14,15,14,15,14,15,14,15,14,15,24,80,19,130,12,13,20,15,16,460,13,14,16,15,340,14,16,14,16,20,14,16,11,12,11,12,11,12,14,16,11,12,11,12,11,12,11,12,11,12,14,16,11,12,11,12,14,16,10,15,12,14,100,17,30,12,13,11,10,12,11,60,14,16,10,15,20,12,15,1b,14,70,13,60,1b,14,20,14,13,11,10,14,16,14,16,17,150,13,15,210,12,180,23,60,12,13,20,15,50,1b,14,70,12,20,1b,14,30,14,12,14,10,12,140,13,15,170,12,120,17,110,14,16,14,16,30,15,14,15,14,15,14,15,11,16,14,15,14,15,14,15,14,15,14,15,11,16,14,15,14,15,12,16,10,16,11,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,20,19,10,14,16,10,16,11,16,11,16,11,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,16,14,15,14,15,14,15,12,16,10,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,20,19,20,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,16,14,15,14,15,14,15,14,15,14,15,11,16,14,15,12,16,10,16,14,15,12,14,19,40,24,15,14,15,14,15,11,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,20,19,10,14,16,10240,14,16,30,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,40,14,16,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,50,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,12,15,50,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,14,10,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,40,14,16,14,16,280,14,16,14,26,13,240,17,10,14,16,14,26,12,250,12,180,15,240,12,80,17,10,14,16,60,18,12,14,16,14,16,40,11,13,220,14,16,14,16,20,14,16,17,210,16,13,14,16,14,26,13,210,12,20,17,10,14,16,14,16,280,14,16,14,16,60,19,30,13,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,15,14,16,19,50,19,50,19,50,13,24,15,14,15,14,15,14,15,11,14,11,24,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,14,12,14,12,13,12,23,24,15,14,15,14,15,14,15,11,24,15,12,16,60,11,10,14,16,14,16,40,11,13,230,16,11,16,14,15,11,16,14,15,14,15,14,15,14,15,14,15,24,120,14,16,14,16,60,15,12,120,13,24,15,14,15,14,15,12,15,14,16,220,11,50,14,16,14,16,280,14,16,14,16,280,14,16,14,16,150,13,120,14,16,14,16,140,14,16,100,17,12,14,16,14,16,40,11,13,500,15,12,20,14,16,14,16,40,13,24,15,14,15,14,15,12,14,140,14,16,14,16,10,12,60,19,190,14,16,14,16,40,13,24,15,24,100,11,70,14,16,14,16,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,14,16,14,16,140,12,13,120,14,16,14,16,17,110,15,12,14,16,120,14,16,14,16,11,30,11,13,40,18,14,19,14,1a,14,12,11,18,14,19,14,1a,14,140,11,110,17,90,14,16,14,16,120,14,16,140,14,16,10,15,24,200,13,15,19,40,16,12,16,120,11,13,40,13,24,15,24,40,14,16,10,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,24,15,14,15,14,15,14,15,14,15,12,15,14,16,140,11,13,120,14,16,10,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,130,16,11,16,14,15,14,15,14,15,14,15,14,15,11,16,11,16,11,16,14,15,11,16,11,16,11,16,14,15,14,15,11,14,11,34,40,11,15,40,13,24,15,14,15,14,15,14,15,14,15,14,15,14,15,12,15,14,16,120,13,16,20,11,13,11,13,80,14,16,14,16,160,17,50,14,16,90,12,240,17,10,14,16,14,26,12,140,13,16,100,14,16,14,16,140,12,13,120,14,16,14,16,18,12,580,14,16,14,16,280,14,16,14,16,280,14,16,14,16,160,15,16,50,16,14,15,14,15,11,14,11,34,220,13,24,15,12,15,14,16,60,13,15,40,17,150,14,16,14,16,280,14,16,14,16,330,12,260,14,16,14,16,260,15,12,14,16,14,16,15,12,240,11,10,14,16,14,16,280,14,16,14,16,140,11,13,11,13,11,13,80,14,16,10,15,14,15,14,15,14,15,20,14,15,14,15,14,15,14,15,12,14,110,16,12,16,290,16,11,16,14,15,14,15,24,40,13,24,15,24,20,17,12,20,13,24,15,14,15,11,14,11,34,40,19,70,19,140,16,12,16,280,14,16,10,15,14,15,14,15,14,15,14,15,24,60,12,13,12,13,60,12,13,14,16,14,16,280,14,16,14,16,80,13,34,160,14,16,14,16,60,17,15,90,16,24,480,12,13,220,14,16,14,16,200,17,230,12,13,12,13,40,12,13,12,13,40,14,16,14,16,280,14,16,14,16,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,14,16,14,16,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,14,16,14,16,11,50,15,13,160,17,140,12,13,15,11,12,11,12,11,12,11,12,11,12,13,15,11,110,12,11,12,13,120,17,70,15,12,14,16,14,16,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,15,14,16,14,90,12,40,13,15,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,14,16,14,16,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,11,12,14,16,10,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,10,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,10,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,16,14,15,14,15,14,15,14,15,14,15,11,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,10,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,16,11,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,11,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,10,16,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,14,15,12,16,10240'
local rle_spritesheet_three = ''
local rle_spritesheet_four = ''

-- TODO: function to load sprite from arbitrary spritesheet

function load_spritesheets()
  -- spritesheet one: 0x8000-0x9fff
  if (#rle_spritesheet_one > 0) then
    read_into_spritesheet_memory(rle_spritesheet_one)
    memcpy(0x8000, 0x0000, 8192)
  end

  -- spritesheet two: 0xa000-0xbfff
  if (#rle_spritesheet_two > 0) then
    read_into_spritesheet_memory(rle_spritesheet_two)
    memcpy(0xa000, 0x0000, 8192)
  end

  -- spritesheet three: 0xc000-0xdfff
  if (#rle_spritesheet_three > 0) then
    read_into_spritesheet_memory(rle_spritesheet_three)
    memcpy(0xc000, 0x0000, 8192)
  end

  -- spritesheet four: 0xe000-0xffff
  if (#rle_spritesheet_four > 0) then
    read_into_spritesheet_memory(rle_spritesheet_four)
    memcpy(0xe000, 0x0000, 8192)
  end

  -- spritesheet 0: 0x0000-0x1fff
  reload()
end

function read_into_spritesheet_memory(rle_string)
  -- get number of columns
  local rledata = split(rle_string, ",", false)
  local pixelidx, cols = 0, rledata[1]

  for i=2,#rledata do
    local token = rledata[i]
    local pixelcolor = tonum(token[#token], 0x1)
    local num = sub(token, 1, #token-1)

    -- draw the next set of rle pixels
    for j=0,num-1 do
      sset(pixelidx%cols,pixelidx\cols,pixelcolor)
      pixelidx += 1
    end
  end
end

function _init()
  -- load spritesheets
  load_spritesheets()

  -- copy data to active spritesheet
  memcpy(0x0000, 0xa000, 8192)
end

function _draw()
  cls(0)
  spr(3, 60, 60)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
