---
layout: default
title: Icebreakers
permalink: /icebreakers/
---

# Icebreakers

{% for card_data in site.data.icebreakers %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
