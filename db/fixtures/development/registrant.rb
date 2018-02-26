Registrant.seed do |r|
  r.id = 1
  r.code = "UX0001"
  r.name = "aaaaa"
  r.device_type = "1"
  r.device_info = "aaaaaaaa aaaaaaa aaaaaaaa"
end
Registrant.seed do |r|
  r.id = 2
  r.code = "UX0002"
  r.name = "bbbbb"
  r.device_type = "2"
  r.device_info = "bbbbbbbb bbbbbbbb bbbbbbbb"
end
Registrant.seed do |r|
  r.id = 3
  r.code = "UX0003"
  r.name = "ccccc"
  r.device_type = "2"
  r.device_info = "cccccccc cccccccc cccccccc"
end

PushText.seed do |p|
  p.id = 1
  p.registrant_id = 1
  p.detail = "アイウエオアイウエオアイウエオアイウエオアイウエオ"
  p.pushed_at = DateTime.parse("2018-02-07 00:00:00")
  p.code = "TE0001"
end

PushText.seed do |p|
  p.id = 2
  p.registrant_id = 1
  p.detail = "1234567890123456789012345678901234567890"
  p.pushed_at = DateTime.parse("2018-02-08 00:00:00")
  p.code = "TE0002"
end

PushText.seed do |p|
  p.id = 3
  p.registrant_id = 1
  p.detail = "あいうえおあいうえおあいうえおあいうえおあいうえお"
  p.pushed_at = DateTime.parse("2018-02-09 00:00:00")
  p.code = "TE0003"
end

PushText.seed do |p|
  p.id = 4
  p.registrant_id = 2
  p.detail = "アイウエオアイウエオアイウエオアイウエオアイウエオ"
  p.pushed_at = DateTime.parse("2018-02-10 12:00:00")
  p.code = "TE0001"
end

PushText.seed do |p|
  p.id = 5
  p.registrant_id = 2
  p.detail = "1234567890123456789012345678901234567890"
  p.pushed_at = DateTime.parse("2018-02-11 08:15:00")
  p.code = "TE0002"
end

PushText.seed do |p|
  p.id = 6
  p.registrant_id = 2
  p.detail = "あいうえおあいうえおあいうえおあいうえおあいうえお"
  p.pushed_at = DateTime.parse("2018-02-12 08:15:00")
  p.code = "TE0003"
end

PushText.seed do |p|
  p.id = 7
  p.registrant_id = 3
  p.detail = "01234567890123456789012345678901234567890"
  p.pushed_at = DateTime.parse("2018-02-13 14:15:00")
  p.code = "TE0002"
end

PushText.seed do |p|
  p.id = 8
  p.registrant_id = 3
  p.detail = "あいうえおあいうえおあいうえおあいうえおあいうえお"
  p.pushed_at = DateTime.parse("2018-02-14 20:15:00")
  p.code = "TE0003"
end
