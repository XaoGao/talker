Feature: friendship
    @javascript
    Scenario: I can add user to subscriptions
      Given I logged in and exist another user
      When I push button add friend
      Then I shoud see the user in subscription
    
    @javascript
    Scenario: I can remove a user form my subscriptions
      Given I logged in and i have a subscription
      When I push button remove a friend
      Then I shoud see the user do not a subscription

    @javascript
    Scenario: I in subscribers another user
      Given I logged in and exist another user and i subscribers
      When I visit subscribers 1
      Then I shoud see username another user
    
    @javascript
    Scenario: I do not in subscribers another user
      Given I logged
      When I visit subscribers 2
      Then I shoud not see any username

