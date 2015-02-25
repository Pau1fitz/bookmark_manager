require 'spec_helper'

feature "User adds a new link with a tag" do
  scenario "with a few tags" do
    visit('/')
    add_link("http://www.makersacademy.com/",
                "Makers Academy",
                ['education', 'ruby'])
    link = Link.first
    expect(link.tags.map(&:text)).to include("education")
    expect(link.tags.map(&:text)).to include("ruby")
end


def add_link(url, title, tags = [])
  within('#new-link') do
    fill_in 'url', :with => url
    fill_in 'title', :with => title
    fill_in 'tags', :with => tags.join(' ')
    click_button 'Add link'
  end
end
end