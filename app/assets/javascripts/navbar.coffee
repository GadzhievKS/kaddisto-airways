navbar =
  init: ->
    do @changeActiveLink

  changeActiveLink: ->
    $('li.active').removeClass('active')
    $('a[href="' + location.pathname + '"]').closest('li').addClass('active')

$(document).on 'ready', ->
  do navbar.init