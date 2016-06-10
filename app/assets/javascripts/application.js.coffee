#= require jquery
#= require jquery_ujs
#= require typekit
#= require_tree .

$ ->
  $('a.logo')
    .mouseenter ->
      $('a.logo').fadeOut(1, -> $('a.logo').text('Борхес')).fadeIn(100)
    .mouseleave ->
      $('a.logo').fadeOut(1, -> $('a.logo').text('Б')).fadeIn(100)

