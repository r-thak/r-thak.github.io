# frozen_string_literal: true
require 'net/http'
require 'json'
require 'uri'

module Jekyll
  class GitHubProjectsGenerator < Generator
    safe true
    priority :high

    def generate(site)
      return unless site.data['projects']

      projects_data = site.data['projects']

      # Process featured projects
      if projects_data['featured']
        projects_data['featured'].each do |project|
          fetch_github_data(project)
        end
      end

      # Process other projects
      if projects_data['other']
        projects_data['other'].each do |project|
          fetch_github_data(project)
        end
      end
    end

    private

    def fetch_github_data(project)
      return unless project['repo']

      # Skip if already has complete data and not forced refresh
      return if project['fetched'] && !ENV['FORCE_GITHUB_FETCH']

      repo = project['repo']

      begin
        # Fetch from GitHub API
        uri = URI("https://api.github.com/repos/#{repo}")

        request = Net::HTTP::Get.new(uri)
        request['Accept'] = 'application/vnd.github.v3+json'
        request['User-Agent'] = 'Jekyll-Site-Builder'

        # Add GitHub token if available (for higher rate limits)
        if ENV['GITHUB_TOKEN']
          request['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
        end

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

        if response.is_a?(Net::HTTPSuccess)
          data = JSON.parse(response.body)

          # Use custom description if provided, otherwise use GitHub description
          project['description'] ||= project['custom_description'] || data['description']
          project['github_description'] = data['description']
          project['stars'] = data['stargazers_count']
          project['forks'] = data['forks_count']
          project['language'] = data['language']
          project['homepage'] = data['homepage']
          project['html_url'] = data['html_url']
          project['topics'] = data['topics'] || []
          project['updated_at'] = data['updated_at']
          project['fetched'] = true

          Jekyll.logger.info "GitHub Projects:", "Fetched data for #{repo}"
        else
          Jekyll.logger.warn "GitHub Projects:", "Failed to fetch #{repo}: #{response.code}"
          # Use custom description as fallback
          project['description'] ||= project['custom_description'] || "Project description unavailable"
          project['html_url'] = "https://github.com/#{repo}"
        end
      rescue StandardError => e
        Jekyll.logger.warn "GitHub Projects:", "Error fetching #{repo}: #{e.message}"
        # Use custom description as fallback
        project['description'] ||= project['custom_description'] || "Project description unavailable"
        project['html_url'] = "https://github.com/#{repo}"
      end
    end
  end
end
