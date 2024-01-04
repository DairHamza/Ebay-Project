*** Settings ***
Documentation       Product Details page object
Library                SeleniumLibrary
Resource               ../../Data/Data.robot


*** Keywords ***
Verify page loaded
    page should contain     Back to search results
    page should contain      ${PRODUCT-NAME}

Check product details
    log    ${PRODUCT-NAME}
    log    checking product details here

Back to home page
    #click element   //*[@id="gh-la"]
    ${get-status} =    run keyword and return status    get webelement    //div[@class="main-container"]/div/div[1]//a/span[contains(text(),"Back to home page")]
    run keyword if    ${get-status} == True    click element     //div[@class="main-container"]/div/div[1]//a/span[contains(text(),"Back to home page")]
    run keyword if    ${get-status} == False    click element    //div[@class="main-container"]/div/div[1]//a/span[contains(text(),"Back to search results")]
    click element   //*[@id="gh-la"]

Verify that the basket is empty
    page should not contain element     //i[@id="gh-cart-n"]

Add item to card
    click element    //a//*[text()='Add to cart']
    reload page


Verify that the product added on basket icon product details page
    wait until page contains element   //i[@id="gh-cart-n" and text()=1]
    page should contain element    //i[@id="gh-cart-n" and text()=1]
    Back to search results

Back to search results
    click element    //a//*[text()='Back to search results']