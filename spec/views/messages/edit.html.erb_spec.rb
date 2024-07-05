require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
                                  content: "MyString",
                                  user: nil,
                                  solicitud: nil,
                                  sol_id: 1
                                ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do
      assert_select "input[name=?]", "message[content]"

      assert_select "input[name=?]", "message[user_id]"

      assert_select "input[name=?]", "message[solicitud_id]"

      assert_select "input[name=?]", "message[sol_id]"
    end
  end
end
