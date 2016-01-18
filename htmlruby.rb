class Die
  attr :labels
  attr :sides
  
  def initialize(labels)
          if labels.empty?
                  raise ArgumentError.new("You need to ink me, bro!")
          else
          end
  @sides = labels.count
  @labels = labels
  puts "I'm a #{@sides} sided die."
  end

  def roll
          rando = rand(0..(@sides - 1))
          return @labels[rando]
  end
end

die = Die.new(["You will succeed in a new adventure.", 
                           "You will get a chance to climb a mountain.",
                           "Three people in your life will try to usurp your power.",
                           "Your love of nutella is highly regarded in Europe and South America.",
                           "A man with a hipster outfit but a preppy face will serve you a delicious sandwich.",
                           "If you go to a Mexican restaurant, you better not ask for 'no onions' or you will insult the taste gods.",
                           ])

p die.sides
p die.roll
p die.labels(1)