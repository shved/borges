$ ->
  if $('#start_with_letter').length > 0
    # start
    $('select.game_option').selectmenu({
      select: (event, ui) ->
        $('#game_option-button').css({
          'border': '1px solid #c6cfd6'
          'border-radius': '21px'
        })
        href = $('.new_game__link').attr('href')
        href = href.split('=').slice(0, -1).join('=') + '=' + encodeURI(ui.item.value)
        $('.new_game__link').attr('href', href)
    }).selectmenu('menuWidget').addClass('overflow')

    $('.new_game__link').button()

    $('.suggest_button').on('click', ->
      $.ajax
        type: 'GET'
        url: '/api/suggest'
        success: (response) ->
          console.log(response)
          $('p.suggestion').text(response.text)
        error: (response) ->
          console.log(response, arguments)
    )

    $('#game_option-button').on('click', ->
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

    $('.new_game > .random_option').on('click', ->
      options = []
      $('select.game_option > option').each ->
        options.push($(this).val())
      option = options[Math.floor(Math.random() * options.length)]
      $('select.game_option').val(option)
      $('select.game_option').selectmenu('refresh').trigger('select')
    )

    # new
    $('.game_textarea').elastic()

