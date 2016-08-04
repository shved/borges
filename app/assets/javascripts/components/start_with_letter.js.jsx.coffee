@StartWithLetter = React.createClass
  propTypes:
    letter: React.PropTypes.string
    gameName: React.PropTypes.string
    gamePrompt: React.PropTypes.string
    gameId: React.PropTypes.number

  getInitialState: ->
    text: ''
    session: 'active'

  componentDidMount: ->
    $('.game_textarea').elastic()
    $('.game_textarea').focus()

  gapTimeoutAmount: ->
    1000

  completeTimeoutAmount: ->
    3000

  warningIntervalAmount: ->
    500

  validateInput: (e) ->
    # clear all timers
    if @gapTimeout
      clearTimeout @gapTimeout
    if @completeTimeout
      clearTimeout @completeTimeout
    if @warningInterval
      clearInterval @warningInterval

    text = e.target.value
    char = text.slice(-1)
    # for the first text symbol
    if text.length < 2 && text[0].match(///[^#{@props.letter}|#{@props.letter.toUpperCase()}|—|\-|(|{|@|'|"|‘|“|«|\\n]///)
      @abuse()
      text = ''
    # the symbol is another letter
    if !char.match(///[#{@props.letter}|#{@props.letter.toUpperCase()}|\-|—|(|{|@|'|"|‘|“|«|\\n]///)
      # the symbol before the last one is a symbol to start a new word
      if text.length > 1 && text.slice(-2, -1).match(/[ |\-|—|(|{|@|'|"|‘|“|«|\\n]/)
        if !char.match(/\s/) # to allow spaces after a dash and other non character symbols
          @abuse()
          text = text.slice(0, -1)
    new_text = text.replace(/[^-а-яё—(){}@'"‘“« ,.:;”’»?!#$%*+]/gi, '')
    unless new_text.length < 1
      @gapTimeout = setTimeout @gap, @gapTimeoutAmount()
      @setState text: new_text

  preventPaste: (e) ->
    @abuse()
    e.preventDefault()

  gap: ->
    clearTimeout @gapTimeout
    @setState session: 'pending'
    @completeTimeout = setTimeout @complete, @completeTimeoutAmount()
    @warningInterval = setInterval @warning, @warningIntervalAmount()

  complete: ->
    clearInterval @warningInterval
    clearTimeout @completeTimeout
    @setState session: 'complete'

  submitSession: (e) ->
    data =
      game_session:
        text: $('textarea.game_textarea').val()
        game_id: @props.gameId
        props: JSON.stringify({ letter: @props.letter })
    $.ajax
      type: 'POST'
      url: '/game_sessions'
      data: data
      success: (response) ->
        console.log(response)
        window.location = response.redirect_path
      error: (response) ->
        console.log(response)
        window.location = response.redirect_path

  restartSession: (e) ->
    location.reload()

  # UI effects

  abuse: ->
    $('.game_option').stop().animate({ backgroundColor: 'red' }, duration: 100, complete: ->
      $(this).animate({ backgroundColor: '#fff600' }, duration: 100, complete: ->
        $(this).animate({ backgroundColor: 'red' }, duration: 100, complete: ->
          $(this).animate({ backgroundColor: '#fff600' }, duration: 100))))

  warning: ->
    $('.game_option').stop().animate({ backgroundColor: 'white' }, duration: 100, complete: ->
      $(this).animate({ backgroundColor: '#fff600' }, duration: 100, complete: ->
        $(this).animate({ backgroundColor: 'white' }, duration: 100, complete: ->
          $(this).animate({ backgroundColor: '#fff600' }, duration: 100))))

  completeButtons: ->
    if @state.session == 'complete'
      `<div className='complete_session_buttons'>
        <span className='complete_session_buttons__span'>
          <button className='submit_session' onClick={this.submitSession}>СОХРАНИТЬ РЕЗУЛЬТАТ</button>
        </span>
        <span className='complete_session_buttons__span'>
          <button className='small_button restart_session' onClick={this.restartSession}>НАЧАТЬ ЗАНОВО</button>
        </span>
      </div>`

  render: ->
    if @state.session == 'complete'
      disabled = true
    else
      disabled = false
    `<div className='new_game' id='start_with_letter'>
      <h1 className='game_name'>
        {this.props.gameName}
        <span className='game_option'>
          {this.props.letter}
        </span>
      </h1>
      <textarea className='game_textarea'
        value={this.state.text}
        placeholder={this.props.gamePrompt}
        onPaste={this.preventPaste}
        onChange={this.validateInput}
        disabled={disabled}>
      </textarea>
      {this.completeButtons()}
    </div>`

