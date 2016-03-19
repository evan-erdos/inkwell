---
layout: page
title: About
permalink: /about/
---

Inkwell renders screenplays from the Fountain markup language,
which is a rather simple syntax that looks something like this:

~~~text

INT. INKWELL EXAMPLE, DAY

Man, what an action slug we have here.
Dialogue begins with an all-caps name and something to say,
and scene headers like the one above start with INT. or EXT.,
(or with something else, just put a period before the name).
Anything else is considered an action slug, like this one.

READER
Hey, what about me?

BEN SCOTT
Oh, hello! You're a character, aren't you?

READER
Yeah, I sure am! And this is dialogue, huh?

BEN SCOTT
That's right!

~~~

That's a scene header, an action slug, and a few lines of dialogue.

Inkwell currently has three modes:

- external mode, for putting whole files into the page
- snippet mode, for writing short scenes in the page source
- page mode, which formats an entire page as a screenplay


External mode looks like this in your page source:
{% raw %}
~~~html

<p>
  I'm some paragraph! Wow look! A screenplay!
</p>

{% include inkwell.html source="example" %}

<div>
  I'm some div! Wow look! A screenplay above me!
</div>

~~~

{% endraw %}


The above include will automatically look in `bescott.org/scenes/example.fountain`,
because you're on my website, and that's my URL.
On your Jekyll site, it will be `yoururl.com/scenes/example.fountain`,
or wherever else you want to put it.
To use some external URL, pass the full URL in, like this:

{% raw %}
~~~text

This is some other text in my document!

{% include inkwell.html source="http://bescott.org/scenes/example.fountain" %}

Wow, look, a screenplay embedded right above this text!

~~~
{% endraw %}



Snippet mode allows you to write directly in the page source.
It uses liquid templates to put all your prose in a particular `div`,
which Inkwell then reads from and transforms into screenplay format.

Snippet mode looks something like this:

{% raw %}
~~~text

Below this text on my page, there's a screenplay snippet!

{% include begin-inkwell.html %}

INT. SNIPPET, DAY

Wow, what a snippet! This is written directly in the markdown!

READER
It is?

BEN SCOTT
That's right!

{% include end-inkwell.html %}

Wow, it put that stuff right in there, above me!

~~~
{% endraw %}

This way, you don't have to worry about hosting a file somewhere,
Inkwell just interprets what you write.


Finally, page mode is used as a layout in the YAML Frontmatter of your page.
It transforms the entire page into a plain white and printable screenplay.

It looks like this:


~~~text
---
layout: inkwell
title: My Scene
---

INT. WEBPAGE EXAMPLE, DAY

An entire screenplay sits inside a webpage.
All of a sudden, somebody reads it.

READER
This is pretty interesting!

BEN SCOTT
Yeah, it sure is!

~~~


Without further ado, here's the example scene, included in the page:


{% include inkwell.html source="example" %}


