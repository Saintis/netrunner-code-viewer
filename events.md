---
layout: default
title: Events
permalink: /events/
---

# Events

{% for card_data in site.data.events %}

## {{ card_data.name }}

[Card #{{card_data.id}}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
