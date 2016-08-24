---
layout: default
title: Ice
permalink: /ice/
---

# Ice

{% for card_data in site.data.ice %}

## {{ card_data.name }}

[Card #{{card_data.id}}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
