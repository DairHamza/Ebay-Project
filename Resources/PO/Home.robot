*** Settings ***
Documentation          Home page object
Library                SeleniumLibrary
Resource               ../../Data/Data.robot


*** Keywords ***
Verify page loaded
    page should contain    Explore Popular Categories
    page should contain    Daily Deals

Navigate to home page
    go to                  ${URL}

Verify the recently viewed items section displayed
    page should contain    Your Recently Viewed Items

Verify the recently viewed items
    page should contain    ${PRODUCT-NAME}

Verify that the basket is empty
    page should not contain element     //i[@id="gh-cart-n"]

Verify that the product added on basket icon home page
    wait until page contains element   //i[@id="gh-cart-n" and text()=1]
    page should contain element    //i[@id="gh-cart-n" and text()=1]