require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
    name:  Faker::Hipster.sentence(3),
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel1.jpg'),
    quantity: 10,
    price: 64.99
    )
    end
  end
    scenario "add product to cart and cart increments by 1" do
      visit root_path
      first('article.product').click_link 'Add'
      save_screenshot
      expect(page).to have_text "My Cart (1)"
    end
end
