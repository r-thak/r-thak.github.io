# Personal Portfolio Website

This is my personal portfolio website built with Jekyll and hosted on GitHub Pages.

## Features

- **Under Construction Notice** - Visible site status
- **Resume** - Professional experience and education
- **Projects** - Showcase of my work with automatic GitHub data fetching
- **GitHub Contribution Graph** - Visual representation of my GitHub activity
- **Blog** with two categories:
  - **Course Reviews** - Insights on courses at UW-Madison and other institutions
  - **Educational Policy** - Thoughts on improving education

## Technology Stack

- **Jekyll** - Static site generator
- **Minima Theme** - Clean, minimalist design
- **GitHub Actions** - Automated build and deployment
- **Custom Ruby Plugin** - Fetches project data from GitHub at build time

## Project Data Fetching

The site automatically fetches project descriptions, stars, forks, and other metadata from GitHub during the build process. To add a new project:

1. Edit `_data/projects.yml`
2. Add your repository in the format:
   ```yaml
   - repo: username/repo-name
     name: "Display Name"
     custom_description: "Optional custom description"
   ```
3. The build process will fetch the latest data from GitHub

## Local Development

### Prerequisites

- Ruby 3.1+
- Bundler

### Setup

```bash
# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# Build site
bundle exec jekyll build
```

### Environment Variables

For higher GitHub API rate limits, set a `GITHUB_TOKEN` environment variable:

```bash
export GITHUB_TOKEN=your_github_token
bundle exec jekyll build
```

## Deployment

The site automatically deploys to GitHub Pages via GitHub Actions when changes are pushed to the `main` branch.

## Structure

```
.
├── _config.yml              # Site configuration
├── _data/
│   └── projects.yml         # Project data
├── _plugins/
│   └── github_projects.rb   # GitHub data fetching plugin
├── _includes/
│   └── github-graph.html    # GitHub contribution graph
├── _course_reviews/         # Course review posts
├── _educational_policy/     # Educational policy posts
├── assets/
│   └── css/
│       └── style.scss       # Custom styles
├── .github/
│   └── workflows/
│       └── jekyll.yml       # GitHub Actions workflow
├── index.markdown           # Homepage
├── resume.markdown          # Resume page
├── projects.markdown        # Projects page
├── blog.markdown            # Blog landing page
└── about.markdown           # About page
```

## Adding Content

### Blog Posts

Create a new file in the appropriate directory:

- Course reviews: `_course_reviews/YYYY-MM-DD-title.md`
- Educational policy: `_educational_policy/YYYY-MM-DD-title.md`

Front matter template:
```yaml
---
layout: post
title: "Your Title Here"
date: YYYY-MM-DD
category: "Course Reviews" # or "Educational Policy"
excerpt: "Brief description for listings"
---
```

### Projects

Edit `_data/projects.yml` to add projects to the featured or other sections.

## License

This website and its content are © Rohan Thakkar. All rights reserved.

## Contact

- Email: mail@rthak.com
- GitHub: [r-thak](https://github.com/r-thak)
- LinkedIn: [rthak](https://linkedin.com/in/rthak)
