---
layout: page
title: Blog
permalink: /blog/
---

{% if site.posts.size > 0 %}
  <ul class="post-list">
    {% for post in site.posts %}
      <li class="post-item">
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <h3 class="post-title">
          <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
        </h3>
        {% if post.excerpt %}
          <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
{% else %}
  <p>No blog posts yet.</p>
{% endif %}
