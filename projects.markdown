---
layout: page
title: Projects
permalink: /projects/
---

# Projects

Here are some of the things I've built. You can find more on my [GitHub profile](https://github.com/r-thak).

{% include github-graph.html %}

---

## Featured Projects

{% if site.data.projects.featured %}
<div class="projects-grid">
{% for project in site.data.projects.featured %}
  <div class="project-card">
    <h3>
      <a href="{{ project.html_url }}" target="_blank" rel="noopener noreferrer">
        {{ project.name }}
      </a>
    </h3>

    {% if project.highlight %}
    <p class="project-highlight">{{ project.highlight }}</p>
    {% endif %}

    <p class="project-description">{{ project.description }}</p>

    {% if project.language or project.stars or project.forks %}
    <div class="project-meta">
      {% if project.language %}
        <span class="project-language">{{ project.language }}</span>
      {% endif %}
      {% if project.stars %}
        <span class="project-stat">⭐ {{ project.stars }}</span>
      {% endif %}
      {% if project.forks %}
        <span class="project-stat">🔀 {{ project.forks }}</span>
      {% endif %}
    </div>
    {% endif %}

    {% if project.topics and project.topics.size > 0 %}
    <div class="project-topics">
      {% for topic in project.topics %}
        <span class="topic-tag">{{ topic }}</span>
      {% endfor %}
    </div>
    {% endif %}
  </div>
{% endfor %}
</div>
{% endif %}

---

## Other Projects

{% if site.data.projects.other %}
<div class="projects-list">
{% for project in site.data.projects.other %}
  <div class="project-item">
    <h3>
      <a href="{{ project.html_url }}" target="_blank" rel="noopener noreferrer">
        {{ project.name }}
      </a>
      {% if project.language %}
        <span class="project-language-inline">{{ project.language }}</span>
      {% endif %}
    </h3>

    <p class="project-description">{{ project.description }}</p>

    {% if project.stars or project.forks %}
    <div class="project-meta">
      {% if project.stars %}
        <span class="project-stat">⭐ {{ project.stars }}</span>
      {% endif %}
      {% if project.forks %}
        <span class="project-stat">🔀 {{ project.forks }}</span>
      {% endif %}
    </div>
    {% endif %}
  </div>
{% endfor %}
</div>
{% endif %}

---

## How It Works

Project descriptions and statistics are automatically fetched from GitHub during the build process. To add a new project:

1. Add the repository to `_data/projects.yml`
2. Optionally provide a custom description
3. The build process will fetch stars, forks, language, and other metadata from GitHub

*Note: Make sure the repository is public for automatic fetching to work.*
