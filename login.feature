@english @arabic
Feature: [Regression] User Login and Logout

  Scenario: User logs in By email with correct username and correct passport
    Happy path - test pointed and text format for password
    - user logout
    Given a learner
    When the user visits the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    | {learner email}    |
      | password field | {learner password} |
    Then the password field should be displayed in pointed foramt
    When the user clicks eye icon button
    Then the password field should be displayed in Plaintext foramt
    And the user clicks login button
    Then the user should be redirected to the My Learning Page
    And the Login Button should disappear
    And the profile name Icon should be displayed with specific text "{Learner first name}"
    When the learner is hovering over the profile name Icon and clicks Logout Link
    Then the user should be redirected to the Edraak Home Page
    And the Login button should be displayed

  Scenario: User logs in By Gmail with correct username and correct passport
    Happy path
    Given a learner with Google account
    When the user visits the Edraak Home Page
    And the user clicks Login with Google button
    Then a new window should be opened
    When the user clicks the Learner Gmail account
    Then a new window should be closed
    And the user should be redirected to the My Learning Page
    And the Login Button should disappear
    And the profile name Icon should be displayed with specific text "{Learner first name}"
    When the learner is hovering over profile name Icon and clicks Logout Link
    Then the user should be redirected to the Edraak Home Page
    And the Login button should be displayed

  Scenario: User logs in By Gmail with correct username and correct passport
    Happy path
    Given a learner with facebook account
    When the user visits the Edraak Home Page
    And the user clicks Login with Facebook button
    Then a new window should be opened
    When the user fills in specific data for the following fields
      | Input fields            | Specific Data               |
      | facebook email field    | {learner facebook email}    |
      | facebook password field | {learner facebook password} |
    When the user clicks the facebook Login
    Then the Loged in successfully by facebook message should be displayed
    When the user clicks the Continue Button
    Then a new window should be closed
    And the user should be redirected to the My Learning Page
    And the Login Button should disappear
    And the profile name Icon should be displayed with specific text "{Learner first name}"
    When the learner is hovering over the profile name Icon and clicks Logout Link
    Then the user should be redirected to the Edraak Home Page
    And the Login button should be displayed

  Scenario: User attempts login with Invalid email or password
    The user attempts login several times then enter correct email and password.
    Press Enter from keyboard working with login form.
    Given a learner
    When the user visits the Edraak Home Page
    And the user presses Enter button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    | {learner email}    |
      | password field |  WrongPassword1    |
    And the user presses Enter button
    Then the Incorrect Username or Password Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data         |
      | email field    |  Wrongemail@gmail.com |
      | password field | {learner password}    |
    And the user presses Enter button
    Then the Incorrect Username or Password Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data         |
      | email field    |  Wrongemail@gmail.com |
      | password field | {learner password}    |
    And the user presses Enter button
    Then the Incorrect Username or Password Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    | {learner email}    |
      | password field | {learner password} |
    And the user presses Enter button
    Then the user should be redirected to the My Learning Page
    And the Login Button should disappear

  Scenario: User attempts login with Empty field
    Given a learner
    When the user visits the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data |
      | email field    |               |
      | password field |               |
    And the user clicks login button
    Then the email Required field Alert should be displayed
    And the password Required field Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data   |
      | email field    | {learner email} |
      | password field |                 |
    And the user clicks login button
    And the password Required field Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    |                    |
      | password field | {learner password} |
    And the user clicks login button
    Then the email Required field Alert should be displayed

  Scenario: User attempts login with Invalied email address
    Given a learner
    When the user visits the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data  |
      | email field    | abc.def@mail.c |
      | password field | Password1      |
    And the user clicks login button
    Then the Invalid email address Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data            |
      | email field    | abc.def@mail#archive.com	|
    Then the Invalid email address Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data |
      | email field    | abc.def@mail	 |
    Then the Invalid email address Alert should be displayed
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    | abc.def@mail..com	|
    Then the Invalid email address Alert should be displayed

  Scenario: User loged Out Then Go Back
    Given a learner
    When the user visits the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    | {learner email}    |
      | password field | {learner password} |
    And the user clicks login button
    Then the user should be redirected to the My Learning Page
    And the Login Button should disappear
    When the learner is hovering over the profile name Icon and clicks Logout Link
    Then the user should be redirected to the Edraak Home Page
    And the Login button should be displayed
    When the user goes back
    Then the user should be redirected to the Login Page
    And the Sign in to your account Header should be displayed

  Scenario: User logs Out from all tabs
    Given a learner
    When the user visits the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    | {learner email}    |
      | password field | {learner password} |
    And the user clicks login button
    Then the user should be redirected to the My Learning Page
    And the Login Button should disappear
    When the user visits the Edraak Home Page from new tab
    When the learner is profile name Icon and clicks Logout Link
    Then the user should be redirected to the Edraak Home Page
    And the Login button should be displayed
    When the user closes the tab
    And the user reloads the page
    And the Login Button should be displayed

  Scenario: User Forgets his password
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
    And the email field should have "fatima.Alfahri@gmail.com" as placeholder
    And the user clicks Reset your password Button
    Then the successfully submitted your password reset request Message should be displayed with text
      """
      You have successfully submitted your password reset request. An email has been sent to your email {Buyer Email} with instructions on how to reset your password!
    """
    When the user visits Password Reset Confirm Page
    When the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     | 0            |
      | Confirm Password field | 0            |
    Then the password policy message should be displayed with text "This password is too short. It must contain at least 2 characters."
        When the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     | 001           |
      | Confirm Password field | 00            |
    Then the password policy message should be displayed with text "Error:Passwords do not match."
    When the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     | 001           |
      | Confirm Password field |               |
    And the password Required field Alert should be displayed below Confirm Password field
    When the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     |               |
      | Confirm Password field |               |
    And the password Required field Alert should be displayed below New Password field
    And the password Required field Alert should be displayed below Confirm Password field
    When the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     |    1234       |
      | Confirm Password field |               |
    And the password Required field Alert should be displayed below New Password field
    When the user fills in specific data for the following fields
      | Input fields           | Specific Data |
      | New Password field     |  346789       |
      | Confirm Password field |  346789       |
    And the user clicks Reset My password button
    Then the user should be redirected to the Password Reset Complete Page
    And the Password Reset Complete should be displayed
    And the user clicks Login Link
    Then the user should be redirected to the Login Page Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data      |
      | email field    | {learner email}    |
      | password field | 346789             |
    And the user clicks Login Button
    Then the user should be redirected to the My Learning Page
    And the Login Button should disappear

  Scenario: User Try to reset his password with Invalid Password Reset Link
    Given a learner with invalid password reset confirm link
    When the user visits Password Reset Confirm Page
    Then the following elements should be displayed
      | Expected elements                  |
      | Invalid Password Reset Header      |
      | Invalid Password Reset Explanation |


  Scenario: User set new password as old password
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
    And the email field should have "fatima.Alfahri@gmail.com" as placeholder
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
