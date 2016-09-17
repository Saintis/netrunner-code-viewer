---
layout: default
title: Upgrades
permalink: /cards/upgrades/
---

# Upgrades

{% for card_data in site.data.upgrades %}

## {{ card_data.name }}

[Card #{{ card_data.id }}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
