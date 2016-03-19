---
layout: page
title: About
permalink: /about/
---


Inkwell is a little script which embeds screenplays in websites via the Fountain markup language.

An example of Inkwell in action:

{% include inkwell.html source="example" %}


Fountain is a rather simple syntax (perhaps more appropriately, mark*down* than markup)
which transforms plain text into screenplay format.

~~~text

INT. INKWELL EXAMPLE, DAY

Man, what an action slug we have here.
Dialogue begins with an all-caps name and something to say,
and scene headers like the one above start with INT. or EXT.,
(or with something else, just put a period before the name).
Anything else is considered an action slug, like this one.

CHARACTER
Hey, what about me?

BEN SCOTT
Oh, hello! You're a character, aren't you?

CHARACTER
Yeah, I sure am! And this is dialogue, huh?

BEN SCOTT
That's right!

~~~

This is what a plain Fountain screenplay looks like.
It can be embedded in a webpage in two ways.

The first way is to host a complete Fountain screenplay somewhere,
and then have `inkwell-loader.coffee` load it into the appropriate `div`,
such that `inkwell.coffee` can interpret it.

In your source file, it would look like this:

{% raw %}
~~~text

This is some other text in my document!

{% include inkwell.html source="example" %}

Wow, look, a screenplay embedded right above this text!

~~~
{% endraw %}

The above include will automatically look in `bescott.org/scenes/example.fountain`,
because this page's base URL is my website.
On your Jekyll site, it will be `your_url.com/scenes/example.fountain`,
or wherever else you want to put it.
To use some external URL, pass the full URL in, like this:

{% raw %}
~~~text

This is some other text in my document!

{% include inkwell.html source="http://bescott.org/scenes/example.fountain" %}

Wow, look, a screenplay embedded right above this text!

~~~
{% endraw %}



The second approach can be done directly in the page,
using liquid template includes, like this:

{% raw %}
~~~text

Below this text on my page, there's a screenplay snippet!

{% include begin-inkwell.html %}

INT. INKWELL EXAMPLE, DAY

Man, what an action slug we have here.
Dialogue begins with an all-caps name and something to say,
and scene headers like the one above start with INT. or EXT.,
(or with something else, just put a period before the name).
Anything else is considered an action slug, like this one.

CHARACTER
Hey, what about me?

BEN SCOTT
Oh, hello! You're a character, aren't you?

CHARACTER
Yeah, I sure am! And this is dialogue, huh?

BEN SCOTT
That's right!

{% include end-inkwell.html %}

Wow, it put that stuff right in there, above me!

~~~
{% endraw %}

This way, you don't have to worry about hosting a file somewhere,
Inkwell just interprets what you write.






