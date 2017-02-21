---
layout:     post
title:      "Enumerable#Map"
subtitle:   "Blog Week 4"
date:       2016-01-10 12:00:00 -0700
author:     "Ieronim E Oltean"
header-img: "img/post-bg-04.jpg"
---

<p>This week I have a very special topic to write about - the enumerable map method. If you're like me a couple of months ago, you aren't understanding those last three words. You understand map and method, but not in this context.</p>
<p>I have some excellent news for you! I am here to explain it. Basically, it works like this:</p>
<p>Say you have a list of numbers. It's not a bad list, you know, it's okay, but it's not great. You like it, you don't love it. You want to love it, if you could only add 1 to each number to make it a little bit better, and then have that new list of bigger and better numbers returned.</p>
<p>That's what the map enumerable is here to do! Let's take a look.</p>

```ruby
ok_list = [1, 2, 3, 4]
ok_list.map {|number| number + 1}
#=> [2, 3, 4, 5]
```
<p>Let's go step by step here. First, we are setting an array of 1, 2, 3, and 4 equal to ok_list. Then, we use .map to iterate over each element in the list to add 1. In this instance, .map will return a new array with the results.</p>
<p>That's all for this week, y'all!</p>