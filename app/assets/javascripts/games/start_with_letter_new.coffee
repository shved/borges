$ ->
  if $('#start_with_letter').length > 0
    $('select.game_option').selectmenu({
      select: (e) ->
        $(this).css({
          'border': '1px solid #c6cfd6'
          'border-radius': '21px'
        })
    }).selectmenu('menuWidget').addClass('overflow')
# ПОВЕСИТЬ ВСЕ ЭТО ГОВНО НА КОЛБЕКИ СЕЛЕКТМЕНЮ
    $('#game_option-button, .ui-selectmenu-menu, #game_option-menu').on('click', ->
      if $(this).attr('aria-expanded') == 'true'
        $(this).css({
          'border-bottom': 'none'
          'border-bottom-right-radius': '0'
          'border-bottom-left-radius': '0'
        })
      else if $(this).attr('aria-expanded') == 'false'
        $(this).css({
          'border': '1px solid #c6cfd6'
          'border-radius': '21px'
        })
    )

    # $('#scale').val('square');
    # $("#scale").selectmenu("refresh");
