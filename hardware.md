---
layout: default
title: Hardware
permalink: /hardware/
---

# Hardware

{% for card_data in site.data.hardware %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
