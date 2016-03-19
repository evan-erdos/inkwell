---
layout: page
---

Inkwell is a little script which can embed screenplays in websites via the Fountain markup language.

To get started using Inkwell, [fork the repository][git]!

While specifically designed for Jekyll Sites,
Inkwell can be used in other environments, too.

[git]: <https://github.com/evan-erdos/inkwell/>

An example of Inkwell in action:

{% include inkwell.html source="example" %}

Another example, this time with the screenplay written right in the file!

{% include begin-inkwell.html %}

INT. SNIPPET, DAY

Wow, what a snippet! This is written directly in the markdown!

READER
It is?

BEN SCOTT
That's right!

{% include end-inkwell.html %}



