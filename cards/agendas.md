---
layout: default
title: Agendas
permalink: /cards/agendas/
---

# Agendas

{% for card_data in site.data.agendas %}

## {{ card_data.name }}

[Card #{{ card_data.id }}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
