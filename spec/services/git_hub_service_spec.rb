require "rails_helper"

RSpec.describe GitHubService do
  it 'has .repo_name getting the repository name' do
    json = GitHubService.new.repo_name

    expect(json).to be_instance_of(String)
  end

  it 'has .repo_contributors getting the repository contributors login names' do
    json = GitHubService.new.repo_contributors

    expect(json).to be_instance_of(Array)
  end
end
