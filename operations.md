---
layout: default
title: Operations
permalink: /operations/
---

# Operations

{% for card_data in site.data.operations %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
