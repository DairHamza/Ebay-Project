*** Settings ***
Documentation       Search Results page object
Library             SeleniumLibrary
Library             String
Resource               ../../Data/Data.robot
Variables              ../../Data/Variables.py



*** Keywords ***
Verfy page loaded
    page should contain        results for Mobile
    page should contain        Save this search

check items number
    ${items-counter} =    get element count    xpath://li[starts-with(@id,'item')]
    log     ${items-counter}
    should be equal as numbers    ${items-counter}    60
    #should contain x times    //ol[contains(@class,"pagination__items")]/li    10    pagination
    #${number} =    get length     xpath://li[starts-with(@id,'item')]
    #log     ${number}
    #should contain x times
    #${number2} =    get count      xpath://li[starts-with(@id,'item')]     no idea
    #log     ${number2}

Count pagination buttons
    ${pagination-buttons} =    get element count      //ol[contains(@class,"pagination__items")]/li
    log      ${pagination-buttons}
    should be equal as numbers   ${pagination-buttons}   10

#//div[@id="srp-river-results"]/ul/li[2]//*[@class="s-item__watchheart-icon"]

Get the product name TEST
    #run keyword and continue on failure     click element    //div[@id="srp-river-results"]/ul/li[2]//*[@class="s-item__watchheart-icon"]
    ${get-name} =    get text    //ul[@class="srp-results srp-list clearfix"]/li[2]//div[@class="s-item__title"]/span
    set global variable     ${PRODUCT-NAME}     ${get-name}

Verify product name TEST
    log    ${PRODUCT-NAME}

Testing switch browser
    click element   //a//*[contains(text(),"OnePlus 10T 5G 128GB Moonstone Black")]   #//ul[@class="srp-results srp-list clearfix"]/li[starts-with(@id,"item")][13]/div/div[2]/a
    #switch window   title=OnePlus 10T 5G 128GB Moonstone Black${SPACE}${SPACE}T-Mobile Unlocked Smartphone - Brand New.${SPACE}${SPACE}| eBay
    ${get-page-handles} =    get window handles
    log    ${get-page-handles}
    switch window     ${get-page-handles}[1]
    ${get-title} =    get title
    log    ${get-title}
    log title
    click element     //a//*[contains(text(),"Buy It Now")]
    #sleep     3s
    #${test} =   set variable    OnePlus 10T 5G 128GB Moonstone Black${SPACE}${SPACE}T-Mobile Unlocked Smartphone - Brand New.${SPACE}${SPACE}| eBay

    #switch window    title=OnePlus 10T 5G 128GB Moonstone Black  T-Mobile Unlocked Smartphone - Brand New.  | eBay
    #sleep    3s

    switch window     ${get-page-handles}[0]
    ${get-title2} =    get title
    log  ${get-title2}
    log title
    #sleep    3s
    #switch window    title=OnePlus 10T 5G 128GB Moonstone Black${EMPTY}${EMPTY}T-Mobile Unlocked Smartphone - Brand New.${SPACE}${SPACE}| eBay

Generate an index to select a product method 1
    ${number-str} =    generate random string   1-2    [NUMBERS]
    log   ${number-str}
    ${number-int} =    convert to integer  ${number-str}
    [Return]    ${number-int}

Generate an index to select a product method 2
    ${number_generated} =    set variable    ${random_number}
    log   ${number_generated}
    #${number-int} =    convert to integer  ${number-str}
    [Return]    ${number_generated}

Chose a product and click
    [Arguments]     ${index}
    ${index} =        Generate an index to select a product method 2
    ${get-name-product} =    get text     //ul[@class="srp-results srp-list clearfix"]/li[${index}]//div[@class="s-item__title"]/span
    set global variable    ${PRODUCT-NAME}    ${get-name-product}
    log   ${PRODUCT-NAME}
    click element      //ul[@class="srp-results srp-list clearfix"]/li[${index}]//div[@class="s-item__title"]/span
    #sleep    3s
    ${get-page-handles} =    get window handles
    switch window    ${get-page-handles}[1]

Chose a product and click method 2
    log    ${random_number}
    ${get-name-product} =    get text     //ul[@class="srp-results srp-list clearfix"]/li[${random_number}]//div[@class="s-item__title"]/span
    set global variable    ${PRODUCT-NAME}    ${get-name-product}
    log   ${PRODUCT-NAME}
    click element      //ul[@class="srp-results srp-list clearfix"]/li[${random_number}]//div[@class="s-item__title"]/span
    #sleep    3s
    ${get-page-handles} =    get window handles
    switch window    ${get-page-handles}[1]

Verify that the basket is empty
    page should not contain element     //i[@id="gh-cart-n"]

Verify that the product added on basket icon search results
    wait until page contains element   //i[@id="gh-cart-n" and text()=1]
    page should contain element    //i[@id="gh-cart-n" and text()=1]
    Back to home page

Back to home page
    click link      //a[@id="gh-la"]



