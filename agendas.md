---
layout: default
title: Agendas
permalink: /agendas/
---

# Agendas

{% for card_data in site.data.agendas %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
