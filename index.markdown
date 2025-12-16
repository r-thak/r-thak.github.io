---
layout: home
title: Home
---

<div class="notice" markdown="1">
**🚧 This website is currently under construction 🚧**

I'm building out this portfolio with sections for my resume, projects, and blog. Check back soon!
</div>

## About Me

Computer Science and Philosophy student at the University of Illinois Urbana-Champaign. I'm interested in systems programming, AI research, and improving education.

Currently working on:
- Research with Dr. Frederic Sala on LLM distillation for drone control
- Building tools and exploring low-level systems
- Writing about courses and education policy

### Quick Links

- [Resume](/resume) - My experience and background
- [Projects](/projects) - Things I've built
- [Blog](/blog) - Course reviews and thoughts on education policy
- [GitHub](https://github.com/r-thak) - My code
- [LinkedIn](https://linkedin.com/in/rthak) - Professional profile

---

## Recent Posts

<ul class="post-list">
  {% for post in site.posts limit:5 %}
    <li>
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">
          {{ post.title | escape }}
        </a>
      </h3>
      {% if post.excerpt %}
        {{ post.excerpt }}
      {% endif %}
    </li>
  {% endfor %}
</ul>
