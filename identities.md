---
layout: default
title: Identities
permalink: /identities/
---

# Identities

{% for card_data in site.data.identities %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
