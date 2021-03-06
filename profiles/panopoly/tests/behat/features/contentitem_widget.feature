Feature: Add content item
  In order to put in a particular content item on a page
  As a site administrator
  I need to be able to choose which content item
 
  @api @javascript
  Scenario: Add content item
    Given I am logged in as a user with the "administrator" role
      And Panopoly magic live previews are disabled
    When I visit "/node/add/panopoly-page"
      And I fill in the following:
        | Title               | Testing title |
        | Editor              | plain_text    |
        | body[und][0][value] | Testing body  |
      And I press "Publish"
    Then the "h1" element should contain "Testing title"
    When I customize this page with the Panels IPE
      And I click "Add new pane"
      And I click "Add content item"
    Then I should see "Configure new Add content item"
    When I fill in the following:
      | exposed[title]        | Lovely Vegetables  |
    When I select "Content Page" from "exposed[type]"
      And I press "edit-return"
      And I press "Save as custom"
      And I wait for the Panels IPE to deactivate
    Then I should see "Lovely Vegetables"
      And I should see "January 11, 2012"
      And I should see "Posted by admin"

