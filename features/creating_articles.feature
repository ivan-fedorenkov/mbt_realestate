@under_construction

Feature: Article creation
  In order to hold users on the web site and improve indexation by the search engines
  Web site owner should be able to add a new articles
  
Scenario: Creating article
  Given I am the web site owner
  And I am on the articles creation page
  When I fill in the "Title" field with "Article Title"
  And I fill in "Text" field with some text
  Then I should see a success message
  And I should see "Article Title" in the navigation bar
