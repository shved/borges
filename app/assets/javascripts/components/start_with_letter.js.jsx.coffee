@StartWithLetter = React.createClass
  propTypes:
    letter: React.PropTypes.string
    gameName: React.PropTypes.string
    gamePrompt: React.PropTypes.string
    timeout: React.PropTypes.number

  getInitialState: ->
    text: ''

  validateInput: (event) ->
    if event.target.value.split(/ |,|\.|-|—|:|;|”|‘|“|’|»|«/).length > 2
      text = event.target.value
      words = text.split(/ |,|\.|-|—|:|;|”|‘|“|’|»|«/)
      letter = this.props.letter
      stop_words = words.filter (word) ->
        word.startsWith(letter)
      stop_words = stop_words.filter (word) ->
        word.startsWith(letter.toUpperCase())

      # if stop_words.length > 0
      #   $('.game_option').animate(
      #     backgroundColor: 'red'
      #   )

      new_text = text
      stop_words.forEach( (word, index) ->
        new_text = new_text.replace(/[ -—‘“«]word[ ,.-:;”’»]/, '')
      )
      new_text = new_text
    else
      new_text = event.target.value

    this.setState(text: new_text)

  render: ->
    `<div className='new_game' id='start_with_letter'>
      <h1 className='game_name'>
        {this.props.gameName}
        <span className='game_option'>
          {this.props.letter}
        </span>
      </h1>
      <textarea className='game_textarea' value={this.state.text} placeholder={this.props.gamePrompt} onChange={this.validateInput}>
      </textarea>
    </div>`


