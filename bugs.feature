@english @arabic
Feature: [Regression] User Login and Logout

  Scenario: User Sign in with two different account, One browser
    Given a first learner
    When the user visits the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data       |
      | email field    | {learner1 email}    |
      | password field | {learner1 password} |
    Given a second learner
    When the user visits the Edraak Home Page from new tab
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data       |
      | email field    | {learner2 email}    |
      | password field | {learner2 password} |
    And the user clicks login button
    Then the user should be redirected to the My Learning Page
    And the profile name Icon should be displayed with specific text "{Learner1 first name}"
    And the Login Button should disappear
    When the user switch to previous tab
    And the user clicks login button
    Then the Login alert message should be displayed with text
    """
    User is already loged in
    """
    # actual result: The browser will catch the last signed session, Logout from the first account automatically.


  Scenario: User signs up By existing email
    Given the user visits the Edraak Home Page
    When the user clicks Register Button
    Then the user should be redirected to the register Page
    And the Create Account form should be displyed
    And the email field should have "fatima.Alfahri@gmail.com" as placeholder
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data         |
      | email field               | already_used@email.com |
      | Full Name In Arabic field | "فاطمه الفحري"        |
      | Password field            | 1234567               |
    And the user checks Email me Checkbox
    And the user checks I Agree Checkbox
    And the user checks Older than 12 years Checkbox
    And the user clicks Register Now Button
    Then the existing account alert should be displayed
    # actual: existing account alert always show up in english even if we are using arabic lang.

  Scenario: User signs up, Incorrect input for Full Name In Arabic Field
    Given the user visits the Edraak Home Page
    When the user clicks Register Button
    Then the user should be redirected to the register Page
    And the Create Account form should be displyed
    And the email field should have "fatima.Alfahri@gmail.com" as placeholder
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data          |
      | email field               | example@email.com.     |
      | Full Name In Arabic field | "English input"        |
      | Password field            | 1234567                |
    And the user checks Email me Checkbox
    And the user checks I Agree Checkbox
    And the user checks Older than 12 years Checkbox
    And the user clicks Register Now Button
    Then the Full Name wrong input Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data          |
      | email field               | example@email.com.     |
      | Full Name In Arabic field | "0000"                 |
    Then the Full Name wrong input Alert should be displayed
    # Actual result: No policy applied to Full Name In Arabic field Input
    # the user can input Any lang. or numbers


  Scenario: Reset Passwprd new password the same as old password
    Given a learner
    When the user visits the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    And the Sign in Form should be displayed
    And the user clicks Forgot password Link text
    Then the user should be redirected to the Reset password Page
    Then the following elements should be displayed
      | Expected elements          |
      | Reset your password Header |
      | Feeling Lost link          |
    And the user clicks Reset your password Button
    Then the successfully submitted your password reset request Message should be displayed with text
      """
      You have successfully submitted your password reset request. An email has been sent to your email {Buyer Email} with instructions on how to reset your password!
    """
    When the user visits Password Reset Confirm Page
    When the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     | oldpass       |
      | Confirm Password field | oldpass       |
    And the user clicks Reset My password button
    Then the user should be redirected to the Password Reset Complete Page
    And the Password Reset Complete should be displayed
    And the user clicks Login Link
    Then the user should be redirected to the Login Page Page
    And the user clicks Forgot password Link text
    Then the user should be redirected to the Reset password Page
    Then the following elements should be displayed
      | Expected elements          |
      | Reset your password Header |
      | Feeling Lost link          |
    And the user clicks Reset your password Button
    Then the successfully submitted your password reset request Message should be displayed with text
      """
      You have successfully submitted your password reset request. An email has been sent to your email {Buyer Email} with instructions on how to reset your password!
    """
    When the user visits Password Reset Confirm Page
    And the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     | oldpass       |
      | Confirm Password field | oldpass       |
    And the user clicks Reset My password button
    Then the user should Not be redirected to the Password Reset Complete Page
    And the Password Reset Complete should not be displayed
