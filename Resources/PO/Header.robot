*** Settings ***
Documentation       Header page object
Library                SeleniumLibrary
Resource               ../../Data/Data.robot


*** Keywords ***

Enter the product name
    input text      xpath://input[@id="gh-ac"]      Mobile

Click on search button
    click element     xpath://input[@id="gh-btn"]
