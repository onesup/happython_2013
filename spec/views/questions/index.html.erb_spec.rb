require 'spec_helper'

describe "questions/index" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :title => "Title",
        :contents => "Contents",
        :email => "Email"
      ),
      stub_model(Question,
        :title => "Title",
        :contents => "Contents",
        :email => "Email"
      )
    ])
  end

  it "renders a list of questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Contents".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
