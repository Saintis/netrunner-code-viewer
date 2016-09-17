---
layout: default
title: Hardware
permalink: /cards/hardware/
---

# Hardware

{% for card_data in site.data.hardware %}

## {{ card_data.name }}

[Card #{{ card_data.id }}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
