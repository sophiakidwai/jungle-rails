require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: "testCategory")
      @product = Product.create(
        name: "testProduct",
        price_cents: 10,
        quantity: 7,
        category: @category,
      )
    end
    it "should create a new product when all field are present" do
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it "should not create a new product when name is empty" do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not create a new product when price is empty" do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it "should not create a new product when quantity is empty" do
      @product.quantity = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not create a product if the category is missing" do
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end