feature 'adding multiple tags to a link' do
  scenario 'user is able to access a link using multiple tags' do

    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tags', with: 'bubbles zombies weird'
    click_button('Add Link')
    link = Link.first
    expect(current_path).to eq '/links'
    expect(link.tags.map(&:name)).to include('bubbles', 'zombies', 'weird')

  end
end
