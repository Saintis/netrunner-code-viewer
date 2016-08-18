---
layout: default
title: Assets
permalink: /assets/
---

# Assets

{% for card_data in site.data.assets %}

## {{ card_data.name }}

{% highlight clojure %}
{{ card_data.code }}
{% endhighlight %}

{% endfor %}
