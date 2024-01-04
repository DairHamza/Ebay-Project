*** Settings ***
Documentation        Test steps file
Resource             PO/Home.robot
Resource             PO/Header.robot
Resource             PO/SearchResults.robot
Resource             PO/ProductDetails.robot
Resource             PO/ShoppingCart.robot
#Resource             PO/SignIn.robot


*** Keywords ***
Go to home page
    Home.Navigate to home page
    Home.Verify page loaded

Enter a product name and search
    Header.Enter the product name
    Header.Click on search button
    SearchResults.Verfy page loaded

Check number of items displayed
    SearchResults.check items number

Check number of pagination buttons
    SearchResults.Count pagination buttons

Chose a product click and check the details
    SearchResults.Chose a product and click    ${0}
    ProductDetails.Verify page loaded
    ProductDetails.Check product details

Chose a product click and check the details method 2
    SearchResults.Chose a product and click method 2
    ProductDetails.Verify page loaded
    ProductDetails.Check product details

Check the recently viewed items
    ProductDetails.Back to home page
    Home.verify page loaded
    Home.Verify the recently viewed items section displayed
    Home.Verify the recently viewed items

Verify that the basket is empty in home page
    Home.Verify that the basket is empty

Verify that the basket is empty in search result page
    Searchresults.verify that the basket is empty

Verify that the basket is empty in shoppin cart page
    Shoppingcart.verify that the basket is empty

Verify that the basket is empty in product details page
    ProductDetails.Verify that the basket is empty

Add product to cart
    ProductDetails.Add item to card
    ShoppingCart.Verify page loaded

Verify the product added in basket icon home page
    Home.Verify that the product added on basket icon home page

Verify the product added in basket icon search results page
    SearchResults.Verify that the product added on basket icon search results

Verify the product added in basket icon product details page
    ProductDetails.Verify that the product added on basket icon product details page

Verify the product added in basket icon shopping cart page
    ShoppingCart.Verify that the product added on basket icon shopping card page


