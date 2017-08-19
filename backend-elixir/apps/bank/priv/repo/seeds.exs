# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bank.Repo.insert!(%Bank.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Bank.Feed.Post

[
  %Post{
    text: "All the world's a stage, and all the men and women merely players. They have their exits and their entrances; And one man in his time plays many parts.",
  },
  %Post{
    text: "Can one desire too much of a good thing?.",
  },
  %Post{
    text: "I like this place and willingly could waste my time in it.",
  },
  %Post{
    text: "How bitter a thing it is to look into happiness through another man's eyes!",
  },
  %Post{
    text: "Blow, blow, thou winter wind! Thou art not so unkind as man's ingratitude.",
  },
  %Post{
    text: "True is it that we have seen better days.",
  },
  %Post{
    text: "For ever and a day.",
  },
  %Post{
    text: "The fool doth think he is wise, but the wise man knows himself to be a fool.",
  },
  %Post{
    text: "Now is the winter of our discontent."
  },
  %Post{
    text: "A horse! a horse! my kingdom for a horse!"
  },
  %Post{
    text: "Conscience is but a word that cowards use, devised at first to keep the strong in awe."
  },
  %Post{
    text: "So wise so young, they say, do never live long."
  },
  %Post{
    text: "Off with his head!"
  },
  %Post{
    text: "An honest tale speeds best, being plainly told."
  },
  %Post{
    text: "The king's name is a tower of strength."
  },
  %Post{
    text: "The world is grown so bad, that wrens make prey where eagles dare not perch."
  },
]
|> Enum.shuffle()
|> Enum.each(&Bank.Repo.insert!/1)


