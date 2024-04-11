# dummyJSON

dummyJSON is a SwiftUI iOS app for fetching and displaying product data from a dummy JSON API.

## Overview

- **Model:** Contains the data models used in the app.
- **View:** Contains SwiftUI views for displaying products lists and product information.
- **ViewModel:** Contains the view model responsible for fetching and managing each product data.
- **Network:** Contains the networking layer, for making API requests.

## Features

- Fetches product data from a dummy JSON API.
- Displays a list of products with image, title and rating
- Displays product information including image, title, rating, price, discount percentage, and stock availability.
- Uses Combine framework for asynchronous operations and data handling.
- Implements a reusable `AsyncImageView` component for loading and displaying images asynchronously.
