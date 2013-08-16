$('.detailOpener').click ->
  $(e).toggle() for e in @children
  $(@).parent().next().toggle('slow')

format2 = (x) ->
  if x < 10
    return "0#{x}"
  else
    return "#{x}"

format3 = (x) ->
  if x < 100
    return "0#{x}"
  else
    return "#{x}"

generateId = (production, version, cardId) ->
  return "#{format2 production}-#{format3 version}-#{format2 cardId}"

$ ->
  ids =
    30: [1..60]
    40: [1..64]
  for version in [30, 40]
    for i in ids[version]
      id = generateId(10, version, i)
      having = localStorage.getItem(id)
      checkBox = $("input##{id}")
      if having
        checkBox.prop 'checked', true
      else
        checkBox.prop 'checked', false
      checkBox.change(((id) ->
        ->
          if @checked
            localStorage.setItem id, "1"
          else
            localStorage.setItem id, ""
      )(id))
