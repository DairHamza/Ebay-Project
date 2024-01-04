*** Settings ***
Documentation     Main testsuite
#Library           SeleniumLibrary
Resource          ../Resources/EbayApp.robot
Resource          ../Resources/Common.robot
Test Setup        Common.Begin Test
Test Teardown     Common.End Test
Library    SeleniumLibrary
Library    Dialogs
#robot -d Results -N REPORT -i smoke -v BROWSER:chrome Tests/Ebay.robot

*** Test Cases ***
The user should be able to navigate to the landing page
    [Documentation]         Access to landing page
    [Tags]                  001    smoke
    EbayApp.Go to home page

The user should be able to search a product
    [Documentation]         Search a product
    [Tags]                  002   smoke
    EbayApp.Go to home page
    EbayApp.Enter a product name and search
    #Search results should be displayed with the most relevant item being shown first

The number of items should be 60
    [Documentation]         Items number
    [Tags]                  0033    smoke
    EbayApp.Go to home page
    EbayApp.Enter a product name and search
    EbayApp.Check number of items displayed

The search results page should have 9 pagination buttons
    [Documentation]         pagination buttons
    [Tags]                  004    smoke
    EbayApp.Go to home page
    EbayApp.Enter a product name and search
    EbayApp.Check number of pagination buttons

The user should be able to check product details
    [Documentation]         check product details
    [Tags]                  005    ncurrent
    EbayApp.Go to home page
    EbayApp.Enter a product name and search
    EbayApp.Chose a product click and check the details

The user should be able to check product details method 2
    [Documentation]         check product details
    [Tags]                  005    current
    EbayApp.Go to home page
    EbayApp.Enter a product name and search
    EbayApp.Chose a product click and check the details method 2

The recently viewed items should be present in home page
    [Documentation]         recently viewed items
    [Tags]                  006    smoke
    EbayApp.Go to home page
    EbayApp.Enter a product name and search
    EbayApp.Chose a product click and check the details
    EbayApp.Check the recently viewed items

Add porudct to card and check basket icon
    [Documentation]         recently viewed items
    [Tags]                  007    smoke
    EbayApp.Go to home page
    EbayApp.Verify that the basket is empty in home page
    EbayApp.Enter a product name and search
    EbayApp.Verify that the basket is empty in search result page
    pause execution
    EbayApp.Chose a product click and check the details
    EbayApp.Verify that the basket is empty in product details page
    pause execution
    EbayApp.Add product to cart
    EbayApp.Verify the product added in basket icon shopping cart page
    EbayApp.Verify the product added in basket icon product details page
    Ebayapp.Verify the product added in basket icon home page



#robot -d Results -N REPORT -i current -v BROWSER:chrome Tests/Ebay.robot

Add product to wichlist and check it
    [Documentation]         add product to wichlist
    [Tags]                  00x    ncurrent
    EbayApp.Go to home page
    EbayApp.Enter a product name and search
    #EbayApp.Add a product to the wichlist
    #EbayApp.Check the product in the wichlist








