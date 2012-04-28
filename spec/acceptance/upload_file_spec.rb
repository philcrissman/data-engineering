require 'acceptance/acceptance_helper'

feature "Uploading File", %q{
  As a user
  I want to upload a file
  And see the gross revenue represented by the file's contents
} do

  background do

  end

  scenario "with a valid file" do
    visit '/'
    page.should have_content "Upload a New File"
    attach_file 'order_file', 'spec/support/example_input.tab'
    click_button 'Upload'
    page.should have_content "File uploaded"
    page.should have_content "$95.00"
  end

end
