local eras = {
  {"Alle (1-240)", 1, 240},
  {"Klassiker (1-50)", 1, 50},
  {"Folge 51-150", 51, 150},
  {"Folge 151-240", 151, 240}
}
local ei, busy, last, n = 1, false, 0, 0

local function intro()
  return "Was ist dein heutiger spezialgelagerter Sonderfall?\n\nAusgewählte Ära:\n" .. eras[ei][1]
end

local txt = intro()

local function trim(s, max)
  if #s <= max then return s end
  local i = max
  while i > 1 and string.sub(s, i, i) ~= " " do
    i = i - 1
  end
  if i > 1 then return string.sub(s, 1, i - 1) .. "..." end
  return string.sub(s, 1, max) .. "..."
end

local function draw()
  local p, sz = kumiki.get("size") or "Auto", 2
  if p == "Klein" then sz = 1
  elseif p == "Groß" then sz = 3
  elseif p == "Auto" then
    sz = #txt <= 80 and 3 or 2
  end
  kumiki.text(txt, sz, 1)
end

local function fetch()
  if busy then return end
  local e = eras[ei]
  local sp = e[3] - e[2] + 1
  n = n + 1
  math.randomseed(kumiki.millis() + n * 7919)
  local nr = e[2] + math.random(0, sp - 1)
  if nr == last and sp > 1 then nr = e[2] + ((nr - e[2] + 1) % sp) end
  last, busy = nr, true
  txt = "Ermittle Fall #" .. nr .. "..."
  draw()
  local repo = kumiki.get("repo") or "R3adyPlay3r0ne/DDForakel"
  local ok, err = kumiki.request("GET", "https://raw.githubusercontent.com/" .. repo .. "/refs/heads/main/episodes/" .. nr .. ".json")
  if not ok then
    busy = false
    txt = "Fehler: " .. tostring(err)
    draw()
  end
end

function on_start() draw() end
function on_open() draw() end
function on_config() draw() end

function on_http(st, body, err)
  busy = false
  if err or st ~= 200 or not body then
    txt = "Funkstörung (" .. tostring(err or st) .. ")."
    return draw()
  end
  local d = kumiki.json(body)
  if not d or not d.title then
    txt = "Ungültige Fallakte."
    return draw()
  end
  local h = string.format("Folge %03d", tonumber(d.nr) or last)
  if d.year then h = h .. string.format(" (%.0f)", d.year) end
  txt = h .. "\n" .. d.title
  if d.teaser and #d.teaser > 0 then
    txt = txt .. "\n\n" .. trim(d.teaser, 240)
  end
  draw()
  if kumiki.mood then kumiki.mood("neugierig", 15) end
end

function on_button(i)
  if i == 1 then fetch()
  elseif i == 2 and not busy then
    ei = (ei % #eras) + 1
    txt = intro()
    draw()
  end
end