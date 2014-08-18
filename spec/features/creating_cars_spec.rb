require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make',  with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year',  with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
  end
end

feature 'Display car list at index' do
  scenario 'Display car info in index' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make',  with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year',  with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('1967')
    expect(page).to have_content('2300')
  end
end

feature 'Creating two cars' do
  scenario 'Can create two cars' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make',  with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year',  with: '1964'
    fill_in 'Price', with: '6700'

    click_button 'Create Car'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('1964')
    expect(page).to have_content('6700')

    click_link 'New Car'

    fill_in 'Make',  with: 'Chevy'
    fill_in 'Model', with: 'Corvette'
    fill_in 'Year',  with: '2012'
    fill_in 'Price', with: '42000'

    click_button 'Create Car'

    expect(page).to have_content('Chevy')
    expect(page).to have_content('Corvette')
    expect(page).to have_content('2012')
    expect(page).to have_content('42000')
  end
end

feature 'Editing cars' do
  scenario 'Edits car information year' do
    car = FactoryGirl.create(:car)
    visit '/'

    click_link 'Edit'

    fill_in 'Make',  with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year',  with: '1967'
    fill_in 'Price', with: '2300'

    fill_in 'Year', with: '1968'
    click_button 'Update'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('1968')
    expect(page).to have_content('2300')
  end

  scenario 'Edits car information price' do
    car = FactoryGirl.create(:car)
    visit '/'

    click_link 'Edit'

    fill_in 'Make',  with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year',  with: '1968'
    fill_in 'Price', with: '2300'

    fill_in 'Price', with: '23000'
    click_button 'Update'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('1968')
    expect(page).to have_content('23000')
  end

  scenario 'Edits car information price & year' do
    car = FactoryGirl.create(:car)
    visit '/'

    click_link 'Edit'

    fill_in 'Make',  with: 'Plymouth'
    fill_in 'Model', with: 'Cuda'
    fill_in 'Year',  with: '1970'
    fill_in 'Price', with: '39800'

    fill_in 'Year',  with: '1971'
    fill_in 'Price', with: '37600'
    click_button 'Update'

    expect(page).to have_content('Plymouth')
    expect(page).to have_content('Cuda')
    expect(page).to have_content('1971')
    expect(page).to have_content('37600')
  end
end
