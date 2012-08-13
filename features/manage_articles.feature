Feature: Manage Articles
  In order to make a blog
  As an author
  I want to create and manage articles

Scenario: Articles List
  Given I have articles titled "Pizza", "Breadsticks", "Soup"
  When I go to the list of articles
  Then I should see "Pizza"
  And I should see "Breadsticks" 
  And I should see "Soup" 

Scenario: Create Valid Article
  Given I have no articles
  And I am on the list of articles
  When click on "New Article"
  And I fill in "Title" with "Spuds"
  And I fill in "Body" with "Delicious potato wedges!"
  And I press "Create Article"
  Then I should see "Article was successfully created."
  And I should see "Spuds"
  And I should see "Delicious potato wedges!"
  And I should be redirected to the article show page
  And I should have 1 article

Scenario: Show Article 
  Given I have an article with the title "Another Article" 
  And the body "Some text"
  And I am on the list of articles
  When I click on "Show"
  Then I should see the article show page
  And I should see the title "Another Article" and body "Some text"

Scenario: Edit Article
  Given I have an article with the title "Another Article" 
  And the body "Some text"
  And I am on the list of articles
  When I click on "Edit"
  Then I should see the article edit page
  When I fill in title with "Another Article (changed)"
  And I click on "Update Article"
  Then I should see the article show page
  And I should see "Article was successfully updated."
  And I should see "Another Article (changed)"
  And I should see "Some text"
  And an article should exist with title: "Another Article (changed)"

# @javascript
Scenario: Delete Article
  Given an article exists with title: "testomat", body: "A text"
  And I am on the articles page
  When I click on "Destroy"
  # And I confirm the popup
  Then 0 articles should exist





