---
layout: default
title: Icebreakers
permalink: /cards/icebreakers/
---

# Icebreakers

{% for card_data in site.data.icebreakers %}

## {{ card_data.name }}

[Card #{{card_data.id}}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
