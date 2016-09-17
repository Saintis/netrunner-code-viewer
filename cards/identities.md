---
layout: default
title: Identities
permalink: /cards/identities/
---

# Identities

{% for card_data in site.data.identities %}

## {{ card_data.name }}

[Card #{{ card_data.id }}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
