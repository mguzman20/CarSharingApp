require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
                                calificacion: 1,
                                contenido: "MyString"
                              ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do
      assert_select "input[name=?]", "review[calificacion]"

      assert_select "input[name=?]", "review[contenido]"
    end
  end
end
