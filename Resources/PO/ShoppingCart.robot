*** Settings ***
Documentation          Shopping Cart object
Library                SeleniumLibrary
Resource               ../../Data/Data.robot


*** Keywords ***
Verify page loaded
    page should contain    Shopping cart

Verify that the product added on basket icon shopping card page
    wait until page contains element   //i[@id="gh-cart-n" and text()=1]
    page should contain element    //i[@id="gh-cart-n" and text()=1]
    Back to product results page

Back to product results page
    go back
    reload page

#Verify product added basket


Verify that the basket is empty
    page should not contain element     //i[@id="gh-cart-n"]