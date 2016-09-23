Game.delete_all
ThemeSuggestion.delete_all

### games

game1 = Game.create!(
  desc_en: "If you want to fuck the sky,\\nteach your penis how to fly.",
  desc_ru: "Напишите осмысленный текст, не используя одну букву алфавита.\nПостарайтесь не делать глупостей. Выпить и на дискотеку. Строго. Че еще надо молодому?\nВы должны писать не останавливаясь, игра закончится после 5 секунд бездействия.",
  game_type: "avoid_letter",
  name_en: "Avoid the letter",
  name_ru: "Не использовать букву",
  position: 0,
  props: [:letter]
)

game2 = Game.create!(
  desc_en: "If you want to fuck the sky,\\nteach your penis how to fly.",
  desc_ru: "Напишите осмысленный текст, в котором все слова будут начинаться на определенную букву.\nПостарайтесь не делать глупостей. Выпить и на дискотеку. Строго. Че еще надо молодому?\nВы должны писать не останавливаясь, игра закончится после 5 секунд бездействия. Можно вводить только кириллические символы (такие правила, что поделаешь).",
  game_type: "start_with_letter",
  name_en: "Start with the letter",
  name_ru: "Начинать с буквы",
  position: 1,
  props: [:letter]
)

game3 = Game.create!(
  desc_en: "If you want to fuck the sky,\\nteach your penis how to fly.",
  desc_ru: "Перед каждым новым предложением вы будете получать определенное слово, которое обязательно должно присутствовать в предложении. Максимальное количество слов в одном предложении — 20.\nПостарайтесь не делать глупостей. Выпить и на дискотеку. Строго. Че еще надо молодому?\nВы должны писать не останавливаясь, игра закончится после 5 секунд бездействия.",
  game_type: "wrap_word",
  name_en: "Wrap the word",
  name_ru: "Вокруг слова (пока не работает)",
  position: 2,
  props: [:words]
)

game1.id = 1
game1.save!
game2.id = 2
game2.save!
game3.id = 3
game3.save!

### game suggestions

ThemeSuggestion.create!(
  game_types: ["avoid_letter", "start_with_letter", "wrap_word" ],
  text_en: "Spell the soldier, raped your sister.",
  text_ru: "Прокляните солдата, изнасиловавшего вашу сестру"
)

ThemeSuggestion.create!(
  game_types: ["avoid_letter", "start_with_letter", "wrap_word"],
  text_en: "Suffer like there is no tommorow.",
  text_ru: "Страдайте."
)

ThemeSuggestion.create!(
  game_types: ["avoid_letter", "start_with_letter", "wrap_word"],
  text_en: "Fell in love with an elder woman.",
  text_ru: "Признайтесь в любви пожилой женщине."
)

ThemeSuggestion.create!(
  game_types: ["start_with_letter", "avoid_letter", "wrap_word"],
  text_en: "Under what circumstances you had the fern last time?",
  text_ru: "При каких обстоятельствах вы в последний раз ели папоротник?"
)

ThemeSuggestion.create!(
  game_types: ["start_with_letter", "avoid_letter", "wrap_word"],
  text_en: "Describe an erotic scene as you are an six ears old girl.",
  text_ru: "Опишите впечатления от случайно увиденной эротической сцены от лица шестилетней девочки."
)
