$ ->
  if $('#start_with_letter').length > 0
    # start
    $('select.game_option').selectmenu({
      select: (event, ui) ->
        event.stopPropagation()
        $('#game_option-button').css({
          'border': '1px solid #c6cfd6'
          'border-radius': '21px'
        })
        href = $('.new_game__link').attr('href')
        href = href.split('=').slice(0, -1).join('=') + '=' + encodeURI(ui.item.value)
        $('.new_game__link').attr('href', href)
    }).selectmenu('menuWidget').addClass('overflow')

    $('.new_game__link').button()

    $('.suggest_button').on('click', (e) ->
      data =
        game_type: $('.new_game').data('gameType')
        suggestion_id: $('p.suggestion').data('suggestionId')
      $.ajax
        type: 'GET'
        url: '/api/suggest'
        data: data
        success: (response) ->
          $('p.suggestion').data('suggestionId', response.id)
          $('p.suggestion').text(response.text)
        error: (response) ->
          console.log(response, arguments)
    )

    # game option select
    $('#game_option-button').on('click', (e) ->
      e.stopPropagation()
      if $(this).attr('aria-expanded') == 'true'
        $(this).css({
          'border-bottom': '1px solid white'
          'border-bottom-right-radius': '0'
          'border-bottom-left-radius': '0'
        })
      else if $(this).attr('aria-expanded') == 'false'
        $(this).css({
          'border': '1px solid #c6cfd6'
          'border-radius': '21px'
        })
    )

    $(window).on('click', ->
      if $('#game_option-button').attr('aria-expanded') == 'false'
        $('#game_option-button').css({
          'border': '1px solid #c6cfd6'
          'border-radius': '21px'
        })
    )

    # random option
    $('.new_game > .random_option').on('click', (e) ->
      e.stopPropagation()
      options = []
      $('select.game_option > option').each ->
        options.push($(this).val())
      option = options[Math.floor(Math.random() * options.length)]
      $('select.game_option').val(option)
      $('select.game_option').selectmenu('refresh').trigger('select')
      href = $('.new_game__link').attr('href')
      href = href.split('=').slice(0, -1).join('=') + '=' + option
      $('.new_game__link').attr('href', href)
    )

