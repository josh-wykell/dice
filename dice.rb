class Dice
  
  def roll
    rand 1..6
  end
end

class LoadedDice < Dice


  def roll
    6
  end
end

class PsychicDice < Dice

  def initialize future_rolls
    @future = future_rolls.clone
  end

  def roll
    @future.shift
  end
end
