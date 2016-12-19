require 'rails_helper'

RSpec.describe 'Link' do
  it 'can be edited' do
    me = create :user
    link = create :link

    login me
    visit links_path

    click_link 'Edit'
    expect(current_path).to eq(edit_link_path(link))
    fill_in 'Title', with: 'New Title'
    fill_in 'Url', with: 'http://www.example.com/test'

    click_button 'Update Link'

    expect(current_path).to eq(links_path)
    expect(page).to have_link('New Title')
  end

  it 'cannot be changed to an invalid url' do
    me = create :user
    link = create :link

    login me
    visit links_path

    click_link 'Edit'
    expect(current_path).to eq(edit_link_path(link))
    fill_in 'Title', with: 'New Title'
    fill_in 'Url', with: 'foo'

    click_button 'Update Link'

    expect(current_path).to eq(edit_link_path(link))
    expect(page).to have_content('Url is not a valid URL')
  end
end
