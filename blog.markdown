---
layout: page
title: Blog
permalink: /blog/
---

# Blog

Thoughts on education, course planning, and policy.

---

## Course Reviews

Insights and advice on courses at UW-Madison and beyond. Helping students make informed decisions about their education.

{% assign course_reviews = site.course_reviews | sort: 'date' | reverse %}
{% if course_reviews.size > 0 %}
<ul class="post-list">
  {% for post in course_reviews limit:10 %}
    <li>
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">
          {{ post.title | escape }}
        </a>
      </h3>
      {% if post.excerpt %}
        <div class="post-excerpt">{{ post.excerpt }}</div>
      {% endif %}
    </li>
  {% endfor %}
</ul>

<p><a href="/blog/course-reviews/">View all course reviews →</a></p>
{% else %}
<p><em>No course reviews yet. Check back soon!</em></p>
{% endif %}

---

## Educational Policy

Ideas and perspectives on improving education, from the classroom to the institution.

{% assign policy_posts = site.educational_policy | sort: 'date' | reverse %}
{% if policy_posts.size > 0 %}
<ul class="post-list">
  {% for post in policy_posts limit:10 %}
    <li>
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">
          {{ post.title | escape }}
        </a>
      </h3>
      {% if post.excerpt %}
        <div class="post-excerpt">{{ post.excerpt }}</div>
      {% endif %}
    </li>
  {% endfor %}
</ul>

<p><a href="/blog/educational-policy/">View all educational policy posts →</a></p>
{% else %}
<p><em>No educational policy posts yet. Check back soon!</em></p>
{% endif %}

---

## All Posts

{% assign all_posts = site.posts | concat: site.course_reviews | concat: site.educational_policy | sort: 'date' | reverse %}
{% if all_posts.size > 0 %}
<ul class="post-list">
  {% for post in all_posts limit:5 %}
    <li>
      <span class="post-meta">
        {{ post.date | date: "%b %-d, %Y" }}
        {% if post.category %}
          · <span class="post-category">{{ post.category }}</span>
        {% endif %}
      </span>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">
          {{ post.title | escape }}
        </a>
      </h3>
    </li>
  {% endfor %}
</ul>
{% endif %}
