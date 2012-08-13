Given /^I have articles titled "(.*?)", "(.*?)", "(.*?)"$/ do |arg1, arg2, arg3|
  Article.create!(title: arg1, body: "Some body text")
  Article.create!(title: arg2, body: "Some body text")
  Article.create!(title: arg3, body: "Some body text")
end

When /^I go to the list of articles$/ do
  visit(articles_path)
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

###

Given /^I have no articles$/ do
  Article.delete_all
end

Given /^I am on the list of articles$/ do
  visit(articles_path)
end

When /^click on "(.*?)"$/ do |arg1|
  click_on(arg1)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |key, value|
  fill_in(key, with: value)
end

When /^I press "(.*?)"$/ do |arg1|
  click_on(arg1)
end

Then /^I should be redirected to the article show page$/ do
  page.should have_selector('a', text: 'Edit')
  page.should have_selector('a', text: 'Back')
  # save_and_open_page
end

Then /^I should have (\d+) article$/ do |arg1|
  Article.count.should == arg1.to_i
  # response.body.should include("Spuds")
end

###

Given /^I have an article with the title "(.*?)"$/ do |arg1|
  @article = Article.create!(title: arg1)
end

Given /^the body "(.*?)"$/ do |arg1|
  @article.update_attributes!(body: arg1)
end


When /^I click on "(.*?)"$/ do |arg1|
  click_on(arg1)
end

Then /^I should see the article show page$/ do
  page.should have_selector('a', text: 'Edit')
  page.should have_selector('a', text: 'Back')
end

Then /^I should see the title "(.*?)" and body "(.*?)"$/ do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end

###

Then /^I should see the article edit page$/ do
  page.should have_content("Editing article")
end

When /^I fill in title with "(.*?)"$/ do |arg1|
  fill_in('Title', with: arg1)
end

Then /^the title "(.*?)" should also in the database$/ do |arg1|
  Article.find_by_title(arg1).should_not == nil
end

###


When /^I confirm the popup$/ do
  page.driver.browser.switch_to.alert.accept
end

Given /^I am on the (.*?) page$/ do |page|
  if page =~ /#{capture_model}'s/
    url_for(model($1))
  else
    visit articles_path
  end
  # save_and_open_page
end

