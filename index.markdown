---
layout: home
---

<section class="experience-section">
  <h2>Experience</h2>

  <div class="experience-item">
    <div class="job-title">Data Entry Specialist</div>
    <div class="company">JPMorganChase</div>
    <div class="duration">Jun 2024 - Sep 2024 · 4 mos</div>
    <div class="location">Elgin, Illinois, United States</div>
  </div>

  <div class="experience-item">
    <div class="job-title">Information Technology Staff</div>
    <div class="company">PAWS Chicago</div>
    <div class="duration">Sep 2023 - Jan 2024 · 5 mos</div>
    <div class="location">Chicago, Illinois, United States</div>
  </div>

  <div class="experience-item">
    <div class="job-title">Server</div>
    <div class="company">Presbyterian Homes & Services</div>
    <div class="duration">Aug 2022 - Jun 2023 · 11 mos</div>
    <div class="location">Lake Forest, Illinois, United States</div>
  </div>

  <div class="experience-item">
    <div class="job-title">Engineer Intern - US Student Trainee Program</div>
    <div class="company">Caterpillar Inc.</div>
    <div class="duration">May 2022 - Jul 2022 · 3 mos</div>
    <div class="location">Deerfield, Illinois, United States</div>
  </div>

  <div class="experience-item">
    <div class="job-title">Cashier Customer Service</div>
    <div class="company">La Michoacana Premium</div>
    <div class="duration">Sep 2021 - Apr 2022 · 8 mos</div>
    <div class="location">Mundelein, Illinois, United States</div>
  </div>
</section>

<section class="projects-section">
  <h2>Projects</h2>
  <div id="github-projects"></div>
</section>

<section class="blog-section">
  <h2>Blog</h2>
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
</section>

<script>
// Fetch GitHub projects
async function fetchGitHubProjects() {
  const username = '{{ site.github_username }}';
  if (!username || username === 'jekyll') return;

  try {
    const response = await fetch(`https://api.github.com/users/${username}/repos?sort=updated&per_page=6`);
    const repos = await response.json();

    const projectsContainer = document.getElementById('github-projects');

    repos.forEach(repo => {
      if (!repo.fork) {
        const projectItem = document.createElement('div');
        projectItem.className = 'project-item';
        projectItem.innerHTML = `
          <h3><a href="${repo.html_url}" target="_blank">${repo.name}</a></h3>
          <p>${repo.description || 'No description available'}</p>
          <div class="project-meta">
            ${repo.language ? `Language: ${repo.language}` : ''}
            ${repo.stargazers_count > 0 ? ` · ⭐ ${repo.stargazers_count}` : ''}
          </div>
        `;
        projectsContainer.appendChild(projectItem);
      }
    });
  } catch (error) {
    console.error('Error fetching GitHub projects:', error);
  }
}

if (document.getElementById('github-projects')) {
  fetchGitHubProjects();
}
</script>
