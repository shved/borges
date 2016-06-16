@StartWithLetter = React.createClass
  propTypes:
    letter: React.PropTypes.string, isRequired
    gameName: React.PropTypes.string, isRequired
    text: React.PropTypes.string
    gamePrompt: React.PropTypes.string, isRequired
    timeout: React.PropTypes.number, isRequired

  validateInput: (event) ->
    all_text = this.props.text
    this.setState(text: all_text + event.target.value)

  render: ->
    `<div className='new_game' id='start_with_letter'>
      <h1 className='game_name'>
        {this.props.gameName}
        <span className='game_option'>
          {this.props.letter}
        </span>
      </h1>
      <textarea className='game_textarea' value={this.props.text} placeholder={this.props.gamePrompt} onChange={this.validateInput}>
      </textarea>
    </div>`


