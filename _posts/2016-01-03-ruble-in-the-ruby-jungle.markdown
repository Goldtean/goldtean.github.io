---
layout:     post
title:      "Rumble In The Ruby Jungle - Arrays vs. Hashes"
subtitle:   "Blog Week 3"
date:       2016-01-03 12:00:00 -0700
author:     "Ieronim E Oltean"
header-img: "img/post-bg-03.jpg"
---


<p>An array is a list of ruby objects. These objects can be numbers like integers (eg. 9) or floats (eg. 9.0), or strings like names or other words (eg. "Austin Powers".) They can even be methods, or hashes, or arrays. An array inside of an array? Yes, not only can Ruby do Inception, it can go as many layers deep as you want.</p>
<p>When you want to pull an object from the list, you call it in this format:</p>


```ruby
array_inception = [[[10, 9, 8], 100, 1000, 10000]]
p array_inception[0]
# => [10, 9, 8]
```

<p>That line would basically pull the very first item in an array named array_inception. Because Ruby isn't afraid of zeroes, 0 is the first object in an array, which in this case corresponds to another array of [10, 9, 8]. 1 is the second object, which corresponds to 9 in this case, and so on.</p>
<p>Hashes are similar to arrays. They also store objects, but they store them in the form of key / value combinations. Where you would call an object in an array by it's relative position inside of the array, you would call a value by it's key inside of a hash.</p>

```ruby
spy = {"International Man Of Mystery" => "Austin Powers", "007" => "Bond, James Bond" }
p spy["007"]

# => "Bond, James Bond"
```

<p>An important note about hash key / value pairs is that there cannot be repeated keys in hashes, but there can be repeated values for multiple keys.</p>
<p><img src="{{ site.baseurl }}/img/basil.jpg"></p>
<p>Putting it all together, arrays should be used when you want to store a list of data that is significant on its own. Say, for example, you want a list of returns for a stock so that you could analyze the variance, you could use an array. But say you wanted to analyze that same list of returns, but you wanted a timestamp associated with each price. Since a stock can have the same price at multiple times but can only have one price at any given time, the timestamp should be the key and the value should be the stock's price.</p>
<p>That's all for this week, folks!</p>