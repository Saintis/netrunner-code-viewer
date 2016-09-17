---
layout: default
title: Operations
permalink: /cards/operations/
---

# Operations

{% for card_data in site.data.operations %}

## {{ card_data.name }}

[Card #{{ card_data.id }}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
