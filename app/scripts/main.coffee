$('.detailOpener').click ->
  $(e).toggle() for e in @children
  $(@).parent().next().toggle('slow')
