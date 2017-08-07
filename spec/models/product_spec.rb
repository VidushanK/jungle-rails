require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @category = Category.create name: "adsdasdas"
    @badCategory = Category.create
    @product = Product.create name: "asdasd", quantity: 5, price: 1234, category: @category
    @badProduct = Product.create
    @textPriceProduct = Product.create price: 'ha ha ha ha hahaahaha haha ahahaha ahahaaaaaaaaa'
  end

  it "check if name even responds" do
    should respond_to(:name)
  end

  it "name should be required" do
    expect(@product).to be_valid
    expect(@badProduct.errors.messages[:name]).to include("can't be blank")
  end

  it "should have a name" do
    p = Product.new
    p.valid?
    expect(p.errors.messages[:name]).to include("can't be blank")
    p.name = 'got a name now'
    p.valid?
    expect(p.errors.messages[:name]).to be_nil
  end

  it "should have a price, and that price should be a number" do
    expect(@product).to be_valid
    expect(@badProduct.errors.messages[:price]).to include("can't be blank")
    expect(@textPriceProduct.errors.messages[:price]).to include("is not a number")
  end

  it "quantity should be valid" do
    expect(@product).to be_valid
    expect(@badProduct.errors.messages[:quantity]).to include("can't be blank")
  end
  #
  it "category should be valid" do
    @badP = Product.create name: "asdasd", quantity: 5, price: 1234, category: nil
    expect(@product).to be_valid
    expect(@badP.errors.messages[:category]).to include("can't be blank")
  end

end
