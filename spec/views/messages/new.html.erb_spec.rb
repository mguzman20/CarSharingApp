require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
                       content: "MyString",
                       user: nil,
                       solicitud: nil,
                       sol_id: 1
                     ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do
      assert_select "input[name=?]", "message[content]"

      assert_select "input[name=?]", "message[user_id]"

      assert_select "input[name=?]", "message[solicitud_id]"

      assert_select "input[name=?]", "message[sol_id]"
    end
  end
end
