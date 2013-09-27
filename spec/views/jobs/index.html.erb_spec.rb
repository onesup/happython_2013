require 'spec_helper'

describe "jobs/index" do
  before(:each) do
    assign(:jobs, [
      stub_model(Job,
        :category => "Category",
        :title => "Title",
        :content => "MyText",
        :time => "MyText",
        :level => "Level",
        :workers_count => 1,
        :pay => 2,
        :address => "Address"
      ),
      stub_model(Job,
        :category => "Category",
        :title => "Title",
        :content => "MyText",
        :time => "MyText",
        :level => "Level",
        :workers_count => 1,
        :pay => 2,
        :address => "Address"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Level".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
