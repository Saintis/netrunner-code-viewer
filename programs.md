---
layout: default
title: Programs
permalink: /programs/
---

# Programs

{% for card_data in site.data.programs %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
