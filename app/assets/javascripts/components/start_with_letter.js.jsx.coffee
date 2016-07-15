@StartWithLetter = React.createClass
  propTypes:
    letter: React.PropTypes.string
    gameName: React.PropTypes.string
    gamePrompt: React.PropTypes.string
    timeout: React.PropTypes.number

  getInitialState: ->
    text: ''
    session: 'active'

  gapTimeoutAmount: ->
    1000

  completeTimeoutAmount: ->
    5000

  warningIntervalAmount: ->
    500

  validateInput: (e) ->
    if @gapTimeout
      clearTimeout @gapTimeout
    if @completeTimeout
      clearTimeout @completeTimeout
    if @warningInterval
      clearInterval @warningInterval

    text = e.target.value
    char = text.slice(-1)
    # for the first text symbol
    if text.length < 2 && text[0].match(///[^#{@props.letter}|#{@props.letter.toUpperCase()}|—|-|(|{|@|'|"|‘|“|«]///)
      @abuse()
      text = ''
    # the symbol is another letter
    if !char.match(///[#{@props.letter}|#{@props.letter.toUpperCase()}|-|—|(|{|@|'|"|‘|“|«]///)
      # the symbol before the last one is a symbol to start a new word
      if text.length > 1 && text.slice(-2, -1).match(/[ |-|—|(|{|@|'|"|‘|“|«]/)
        if char != ' ' # to allow spaces after a dash and other non character symbols
          @abuse()
          text = text.slice(0, -1)
    new_text = text.replace(/[^а-яё-—(){}@'"‘“« ,.:;”’»?!#$%*+]/i, '')

    @gapTimeout = setTimeout @gap, @gapTimeoutAmount()
    @setState text: new_text

  gap: ->
    clearTimeout @gapTimeout
    @setState session: 'pending'
    @completeTimeout = setTimeout @complete, @completeTimeoutAmount()
    @warningInterval = setInterval @warning, @warningIntervalAmount()

  complete: ->
    clearInterval @warningInterval
    clearTimeout @completeTimeout
    @setState session: 'complete'

  preventPaste: (e) ->
    @abuse()
    e.preventDefault()

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

  completeButton: ->
    if @state.session == 'complete'
      `<a className='small_button' href='#'>НАЧАТЬ ЗАНОВО</a>`

  render: ->
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
        onChange={this.validateInput}>
      </textarea>
      {this.completeButton()}
    </div>`


