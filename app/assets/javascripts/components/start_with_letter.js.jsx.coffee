@StartWithLetter = React.createClass
  propTypes:
    letter: React.PropTypes.string
    gameName: React.PropTypes.string
    gamePrompt: React.PropTypes.string
    timeout: React.PropTypes.number

  getInitialState: ->
    text: ''

  validateInput: (e) ->
    text = e.target.value
    char = text.slice(-1)
    # for the first text symbol
    if text.length < 2 && text[0].match(///[^#{@props.letter}|#{@props.letter.toUpperCase()}|—|-|(|{|@|'|"|‘|“|«]///)
      @warning()
      text = ''
    # the symbol is another letter
    if !char.match(///[#{@props.letter}|#{@props.letter.toUpperCase()}|-|—|(|{|@|'|"|‘|“|«]///)
      # the symbol before the last one is a symbol to start a new word
      if text.length > 1 && text.slice(-2, -1).match(/[ |-|—|(|{|@|'|"|‘|“|«]/)
        if char != ' ' # to allow spaces after a dash and onther non character symbols
          @warning()
          text = text.slice(0, -1)
    new_text = text.replace(/[^а-яё-—(){}@'"‘“« ,.:;”’»]/i, '')
    @setState text: new_text

  preventPaste: (e) ->
    @warning()
    e.preventDefault()

  warning: ->
    $('.game_option').stop().animate({ backgroundColor: 'red' }, duration: 100, complete: ->
      $(this).animate({ backgroundColor: '#fff600' }, duration: 100, complete: ->
        $(this).animate({ backgroundColor: 'red' }, duration: 100, complete: ->
          $(this).animate({ backgroundColor: '#fff600' }, duration: 100)
        )
      )
    )

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
    </div>`


