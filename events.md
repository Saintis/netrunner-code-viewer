---
layout: default
title: Events
permalink: /events/
---

# Events

{% for card_data in site.data.events %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
