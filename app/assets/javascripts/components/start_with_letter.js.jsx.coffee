@StartWithLetter = React.createClass
  propTypes:
    letter: React.PropTypes.string
    gameName: React.PropTypes.string
    gamePrompt: React.PropTypes.string
    timeout: React.PropTypes.number

  getInitialState: ->
    text: ''

  validateInput: (event) ->
    all_text = this.state.text
    this.setState(text: event.target.value)

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


