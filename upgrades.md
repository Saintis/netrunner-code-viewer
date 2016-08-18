---
layout: default
title: Upgrades
permalink: /upgrades/
---

# Upgrades

{% for card_data in site.data.upgrades %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
