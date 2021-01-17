# Itunes Movies Search

A simple iOS application to browse movies on Australia with the title with the "star" word.

## Specification

 - Xcode: 11.7
 - Swift Version: 5+
 - iOS: 13.7+
 - Dependency Manager: Cocoapods 1.10.1

## General

 - Works online and offline
 - Works on iPhone only
 - Supports portrait and landscape

# Dependency

 - Alamofire - for API request. I chose this framework as it simplifies networking tasks.
 - SDWebImage - to handle the request of images from a URL. I chose this framework as it handles all web images tasks such as request and cache.

## Persistence

**Core Data** to accomodate offline feature. The application will only request to the api once and save it to core data. If there are items already it will not send a request again.

## Architecture

**MVVM** 
Though this is a simple application only. It is more appropriate to remove all logic on the view controller.

**Design pattern used:**

 - Singleton

## UI and Design

**UIKit**

The design is very simple and straightforward. All UI Elements used are from UIKit. Based on Apple Human Interface guidelines, I followed the recommended font sizes, ui elements used and straight forward UX.
