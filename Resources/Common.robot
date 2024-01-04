*** Settings ***
Documentation         Common steps
Library               SeleniumLibrary
Resource              ../Data/Data.robot

*** Keywords ***
Begin Test
    set selenium timeout            40s
    set selenium speed              0.5s
    open browser                    about:blank      ${BROWSER}
    maximize browser window

End Test
    close all browsers