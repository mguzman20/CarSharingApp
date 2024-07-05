require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
             Review.create!(
               calificacion: 2,
               contenido: "Contenido"
             ),
             Review.create!(
               calificacion: 2,
               contenido: "Contenido"
             )
           ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Contenido".to_s, count: 2
  end
end
