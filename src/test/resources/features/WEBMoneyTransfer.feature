Feature:CatchyLabs WEB Scenarios

  Background:

    Given Setup Driver "chrome"
    And   Go to "https://catchylabs-webclient.testinium.com/signIn" address
    When User performs login
      | UserName | UserPassword |
      | Username | Password     |
    Given Check if current URL contains the value "https://catchylabs-webclient.testinium.com/signIn"

  Scenario: TC01CatchyLabsSuccessfulLoginCheck_WEB
    Given Check that the account has been successfully logged in

  Scenario: TC02CatchyLabsMoneyTransferProcessCheck_WEB
    Given Select Transfer Money
      | Transactions My Account | Open Money Transfer | Select Sender Account | Select Receiver Account | Entry Amount | Check Amount |
      | TRANSFER_MONEY          | True                | SenderAccount         | ReceiverAccount         | Amount       | True         |

  Scenario: TC03CatchyLabsAccountDepositCheck_WEB
    When Save the amount value
    Given Select Transfer Money
      | Transactions My Account | Add Money | Entry Card Number | Entry Card Holder | Entry Expiry Date | Entry Cvv | Entry Add Amount | Add Complete |
      | ADD_MONEY               | True      | CardNumber        | CardHolder        | ExpiryDate        | Cvv       | Amount           | True         |
    Given Click if the warning message appears on the page
    When Verify the updated amount

  Scenario: TC04CatchyLabsUpdateAccountNameCheck_WEB
    Given Select Transfer Money
      | Transactions My Account | Edit Account Name | Current Account Name | Edit Complete |
      | EDIT_ACCOUNT_NAME       | True              | CurrentAccountName   | True          |
    Given Check the updated account name

  Scenario: TC05CatchyLabsInvalidCardNumberCheck_WEB
    When Save the amount value
    Given Select Transfer Money
      | Transactions My Account | Add Money | Entry Card Number | Entry Card Holder | Entry Expiry Date | Entry Cvv | Entry Add Amount | Add Complete |
      | ADD_MONEY               | True      | WrongCardNumber   | CardHolder        | ExpiryDate        | Cvv       | Amount           | True         |
    Given Click if the warning message appears on the page
    When Verify error message is displayed for wrong card number

  Scenario: TC06CatchyLabsSuccessfulLogoutCheck_WEB
    Given The account is successfully logged out
    Given Check that the account has been successfully logged out

  Scenario: TC07CatchyLabsNegativeBalanceLoginCheck_WEB
    Given Select Transfer Money
      | Transactions My Account | Open Money Transfer | Select Sender Account | Select Receiver Account | Entry Amount |
      | TRANSFER_MONEY          | True                | SenderAccount         | ReceiverAccount         | WrongAmount  |
    When Assert error message is displayed for negative amount



