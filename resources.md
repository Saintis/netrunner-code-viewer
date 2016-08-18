---
layout: default
title: Resources
permalink: /resources/
---

# Resources

{% for card_data in site.data.resources %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
