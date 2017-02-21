---
layout:     post
title:      "Staying Classy With Classes"
subtitle:   "Blog Week 5"
date:       2016-01-18 12:00:00 -0700
author:     "Ieronim E Oltean"
header-img: "img/post-bg-05.jpg"
---

<p>This week DevBootcamp has asked me to write to create an example class and use it to teach others when to use instance variables or instance methods for that object. Not only that, they would like for me to write for an audience of newb programmers. Little do they know that this is going to be so easy, since I am a newb programmer, anything I say will be catered towards that audience!</p>
<p>So strap yourselves in, but do it with some fucking class, because this blog post is about to get classy.</p>
<p>Today, we will be looking at classes, in case you didn't pick that up already. We will look at a die class that I made for an earlier challenge this week. Dradel fans, this is your lucky day. Question answering ball fans, this is your lucky day. Dungeons and Dragons fans - this is not your day. But before we start some serious dradeling, let's talk abut what a class is.</p>
<p>A class is basically a bunch of code that you get to perform some sort of work for you, that you can call on time and again. It's like that best friend that gives you a ride to the airport or helps you move, except there's no expectations of pizza and beer afterwards.</p>

```ruby
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

# Die Initializes
=> "I'm a 6 sided die."
# Die sides from above
=> 6
# Die roll from above
=> "You will succeed in a new adventure."

```
<p>So let's go through this code take a look at how it works. First, we open the class with class Die and assign labels and sides as local variables that will answer back themselves if called outside of the class. For example, attr :sides is the equivalent of this code:</p>

```ruby
def sides
  return @sides
end
```

<p>If you look near the bottom at "p die.sides", that basically calls on sides inside of the class, and thanks to attr :sides, it returns itself. If you look higher inside of initialize, you'll see that @sides is equal to labels.count, which is the amount of strings inside of the new die, or amount of answers that the die can use.</p>
<p>labels is constructed the same way - if you call using p die.labels you will get a list of all the labels.</p>
<p>Most of the magic here is inside of roll. The roll method generates a random number and returns one of the strings inside of the array that is passed in from Die.new.</p>
<p>That's all for this week, folks!</p>