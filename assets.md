---
layout: default
title: Assets
permalink: /assets/
---

# Assets

{% for card_data in site.data.assets %}

## {{ card_data.name }}

[Card #{{card_data.id}}](https://netrunnerdb.com/en/card/{{ card_data.id }})

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
