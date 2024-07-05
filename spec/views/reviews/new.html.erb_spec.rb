require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
                      calificacion: 1,
                      contenido: "MyString"
                    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "input[name=?]", "review[calificacion]"

      assert_select "input[name=?]", "review[contenido]"
    end
  end
end
