---
layout: page
title: Projects
permalink: /projects/
---

<div id="github-projects"></div>

<script>
// Fetch GitHub projects
async function fetchGitHubProjects() {
  const username = '{{ site.github_username }}';
  if (!username || username === 'jekyll') {
    document.getElementById('github-projects').innerHTML = '<p>Configure github_username in _config.yml to display projects.</p>';
    return;
  }

  try {
    const response = await fetch(`https://api.github.com/users/${username}/repos?sort=updated&per_page=10`);
    const repos = await response.json();

    const projectsContainer = document.getElementById('github-projects');
    projectsContainer.innerHTML = '';

    const validRepos = repos.filter(repo => !repo.fork);

    if (validRepos.length === 0) {
      projectsContainer.innerHTML = '<p>No projects found.</p>';
      return;
    }

    validRepos.forEach(repo => {
      const projectItem = document.createElement('div');
      projectItem.className = 'project-item';
      projectItem.innerHTML = `
        <h3><a href="${repo.html_url}" target="_blank">${repo.name}</a></h3>
        <p>${repo.description || 'No description available'}</p>
        <div class="project-meta">
          ${repo.language ? `Language: ${repo.language}` : ''}
          ${repo.stargazers_count > 0 ? ` · ⭐ ${repo.stargazers_count}` : ''}
          ${repo.forks_count > 0 ? ` · Forks: ${repo.forks_count}` : ''}
        </div>
      `;
      projectsContainer.appendChild(projectItem);
    });
  } catch (error) {
    console.error('Error fetching GitHub projects:', error);
    document.getElementById('github-projects').innerHTML = '<p>Error loading projects.</p>';
  }
}

fetchGitHubProjects();
</script>
