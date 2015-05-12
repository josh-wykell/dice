

require "minitest/autorun"
require "minitest/pride"

require "./dice"
require "./game"

class GameTest < MiniTest::Test

  def self.test_order
    :alpha
  end

  def test_loaded_dice_are_predictable
    dice = LoadedDice.new
    assert_equal 6, dice.roll
  end

  def test_psychic_dice_know_the_future
    future = [2,3,6,1]
    dice = PsychicDice.new future
    future.each do |predicted|
      assert_equal predicted, dice.roll 
    end
  end

  def test_players_have_dice
    dice  = Dice.new
    alice = Player.new "alice", dice
    assert_equal dice, alice.dice 
  end

  def test_somebody_eventually_wins
    alice = Player.new "alice", Dice.new
    bob   = Player.new "bob",   Dice.new
    game  = Game.new alice, bob
    game.play!

    assert [alice, bob].include? game.winner
  end

  def test_cheaters_always_win
    su    = Player.new "su", Dice.new
    james = Player.new "james", LoadedDice.new
    game  = Game.new su, james
    game.play!

    assert_equal james, game.winner
  end

  def test_predictable_games_are_predictable
    brit  = Player.new "brit", PsychicDice.new([3,1,4])
    sarah = Player.new "sarah", PsychicDice.new([3,1,2])
    game = Game.new brit, sarah
    game.play!

    assert_equal brit, game.winner
    assert_equal 3, game.turn
  end
end
