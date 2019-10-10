require 'rails_helper'

RSpec.describe Book, :type => :model do
  it "is not valid without a isbn" do
    book = Book.new(isbn: nil)
    expect(book).to_not be_valid
  end
  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).to_not be_valid
  end
  it "is not valid without a summary" do
    book = Book.new(summary: nil)
    expect(book).to_not be_valid
  end
end