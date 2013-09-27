require 'spec_helper'

describe "jobs/edit" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :category => "MyString",
      :title => "MyString",
      :content => "MyText",
      :time => "MyText",
      :level => "MyString",
      :workers_count => 1,
      :pay => 1,
      :address => "MyString"
    ))
  end

  it "renders the edit job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", job_path(@job), "post" do
      assert_select "input#job_category[name=?]", "job[category]"
      assert_select "input#job_title[name=?]", "job[title]"
      assert_select "textarea#job_content[name=?]", "job[content]"
      assert_select "textarea#job_time[name=?]", "job[time]"
      assert_select "input#job_level[name=?]", "job[level]"
      assert_select "input#job_workers_count[name=?]", "job[workers_count]"
      assert_select "input#job_pay[name=?]", "job[pay]"
      assert_select "input#job_address[name=?]", "job[address]"
    end
  end
end
