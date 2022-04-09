@english @arabic
Feature: [Regression] User Register

  Scenario: User signs up By email And activate his account
    Given the user visits the Edraak Home Page
    When the user clicks Register Button
    Then the user should be redirected to the register Page
    And the Create Account form should be displyed
    And the email field should have "fatima.Alfahri@gmail.com" as placeholder
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data         |
      | email field               | uesr.global@gmail.com |
      | Full Name In Arabic field | "فاطمه الفحري"        |
      | Password field            | 1234567               |
    Then the password field should be displayed in pointed foramt
    When the user clicks eye icon button
    Then the password field should be displayed in Plaintext foramt
    And the user checks Email me Checkbox
    And the user checks I Agree Checkbox
    And the user checks Older than 12 years Checkbox
    And the user clicks Register Now Button
    Then the user should be redirected to the success registertion Page
    And the Personal Profile Form should be displyed
    When the user selects "1999" from year of birth list
    And the user selects Egypt from Country list
    And the user checks Felame radio button
    And the user clicks Continue Button
    Then the user should be redirected to the My Learning Page
    And the interested Content Question should be displyed
    When the user clicks Close Button
    Then the Activate your account should be displyed
    And the profile name Icon should be displayed with specific text "فاطمه"
    When the learner is hovering over the profile name Icon and clicks Logout Link
    Then the user should be redirected to the Edraak Home Page
    And the user clicks Login Button
    Then the user should be redirected to the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data         |
      | email field    | uesr.global@gmail.com |
      | password field | 1234567               |
    And the user clicks Login Button
    Then the need to activate your account Alert should be displyed
    When the user activate his account
    When the user visits the Login Page
    When the user fills in specific data for the following fields
      | Input fields   | Specific Data         |
      | email field    | uesr.global@gmail.com |
      | password field | 1234567               |
    And the user clicks Login Button
    Then the user should be redirected to the My Learning Page
    And the Login Button should disappear
    And the profile name Icon should be displayed with specific text "{Learner first name}"

  Scenario: User signs up By email, Incorrect inputs
    Given the user visits the Edraak Home Page
    When the user clicks Register Button
    Then the user should be redirected to the register Page
    And the Create Account form should be displyed
    And the email field should have "fatima.Alfahri@gmail.com" as placeholder
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data         |
      | email field               | abc.def@mail.c.       |
      | Full Name In Arabic field | "اسماول اسمتاني"      |
      | Password field            | 1234567               |
    And the user checks Email me Checkbox
    And the user checks I Agree Checkbox
    And the user checks Older than 12 years Checkbox
    And the user clicks Register Now Button
    Then the Registration Failed Alert should be displyed
    And the Invalid email address Alert should be displyed
    Then the user should be redirected to the success registertion Page
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data         |
      | Full Name In Arabic field | "English Name"        |
    And the user clicks Register Now Button
    Then the Registration Failed Alert should be displyed
    And the Name must be in arabic Alert should be displyed
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data      |
      | Password field            | 1234               |
    And the Must be at least 6 characters Alert should be displyed
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data            |
      | email field               | abc.def@mail#archive.com |
    Then the Invalid email address Alert should be displyed
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data   |
      | email field               | abc.def@mail	  |
    Then the Invalid email address Alert should be displyed
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data     |
      | email field               | abc.def@mail..com |
    Then the Invalid email address Alert should be displyed
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data |
      | email field               |               |
    Then the Required field Alert should be displyed below email field
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data         |
      | Full Name In Arabic field | "English Name"        |
    Then the Required field Alert should be displyed below Full Name In Arabic field
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data      |
      | Password field            |                    |
    Then the Required field Alert should be displyed below Password field
    When the user unchecks I Agree Checkbox
    And the user clicks Register Now Button
    Then the Must be checked Alert should be displyed below I Agree Checkbox
    When the user unchecks Older than 12 years Checkbox
    And the user clicks Register Now Button
    Then the Must be checked Alert should be displyed below Older than 12 years Checkbox
    When the user unchecks Email me Checkbox
    And the user clicks Register Now Button
    Then the Must be checked Alert should NOT be displyed below Email me Checkbox
    And the user checks Email me Checkbox
    And the user checks I Agree Checkbox
    And the user checks Older than 12 years Checkbox
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data      |
      | Password field            | 1234567            |
      | Full Name In Arabic field | "اسم عربي"         |
      | email field               | test.global_test@gmail.co|
    And the user clicks Register Now Button

  Scenario: Personal Profile form
    Given the user visits the Edraak Home Page
    When the user clicks Register Button
    Then the user should be redirected to the register Page
    And the Create Account form should be displyed
    And the email field should have "fatima.Alfahri@gmail.com" as placeholder
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data         |
      | email field               | uesr.global@gmail.com |
      | Full Name In Arabic field | "فاطمه الفحري"        |
      | Password field            | 1234567               |
    And the user checks Email me Checkbox
    And the user checks I Agree Checkbox
    And the user checks Older than 12 years Checkbox
    And the user clicks Register Now Button
    Then the user should be redirected to the success registertion Page
    And the Personal Profile Form should be displyed
    When the user clicks on the Continue Button
    Then the Required field Alert should be displyed below Year of Birth list
    Then the Required field Alert should be displyed below Country list
    Then the Required field Alert should be displyed below Gender Options
    When the user selects "1999" from year of birth list
    When the user clicks on the Continue Button
    Then the Required field Alert should be displyed below Country list
    Then the Required field Alert should be displyed below Gender Options
    When the user checks the Male option
    When the user clicks on the Continue Button
    Then the Required field Alert should be displyed below Country list
    And the user selects Egypt from Country list
    When the user clicks on the Continue Button
    Then the user should be redirected to the My Learning Page


  Scenario: Term of Service and Privacy Policy are clickale
    Given the user visits the Edraak Home Page
    When the user clicks Register Button
    Then the user should be redirected to the register Page
    And the Create Account form should be displyed
    And the Login With Google Button should be displyed
    And the Login With Facebook Button should be displyed
    When the user click on the Terms of Service
    Then the Terms of Service Module should be displyed
    Then the Terms of Service Module should be scrollable
    When the user click on the Close Button
    When the user click on the Privacy Policy
    Then the Privacy Policy Module should be displyed
    Then the Privacy Policy Module should be scrollable
    When the user click on the Close Button

  Scenario: Already used Email
    Given the user visits the Edraak Home Page
    When the user clicks Register Button
    Then the user should be redirected to the register Page
    And the Create Account form should be displyed
    When the user fills in specific data for the following fields
      | Input fields              | Specific Data         |
      | email field               | uesr.global@gmail.com |
      | Full Name In Arabic field | "اسم جديد"        |
      | Password field            | 1234567               |
    And the user checks Email me Checkbox
    And the user checks I Agree Checkbox
    And the user checks Older than 12 years Checkbox
    And the user clicks Register Now Button
    Then the existing account Alert should be displyed below Email field
    Then the Registration Failed Alert should be displyed
