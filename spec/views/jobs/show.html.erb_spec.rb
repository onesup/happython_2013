require 'spec_helper'

describe "jobs/show" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :category => "Category",
      :title => "Title",
      :content => "MyText",
      :time => "MyText",
      :level => "Level",
      :workers_count => 1,
      :pay => 2,
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Category/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Level/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Address/)
  end
end
