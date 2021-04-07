local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function Base64Decode(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

assert(load(Base64Decode("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"),nil,"bt",_ENV))()
-- 0.64
