# trade

A new Flutter project.

## Getting Started

This project is a starting point for a 021Stocks
## Submission Note

I have completed this assignment and pushed the code to a public GitHub repository.

In this project, I implemented a stock watchlist where I can reorder items using drag and drop. I used Bloc for state management and handled different states like loading, viewing, and editing. I also added save and cancel functionality, along with proper back navigation handling to avoid UI issues.

---

## My Approach

I started by building a simple stock list screen and then introduced Bloc to manage the state.

* I separated events, states, and business logic using Bloc
* I created an dit mode to handle reordering without affecting the original list
* I used ReorderableListView for drag-and-drop functionality
* I maintained a copy of the original list to support cancel/rollback
* I handled back navigation using PopScope to prevent blank screen issues
* I made sure the UI reacts correctly to each state

---

##  Project Structure

I followed a feature-based structure for better readability and scalability:

```
lib/
 └── features/
      └── watchlist/
           ├── bloc/
           │    ├── watchlist_bloc.dart
           │    ├── watchlist_event.dart
           │    └── watchlist_state.dart
           │
           ├── presentation/
           │    ├── stock_list_page.dart
           │    └── edit_stocks_order_page.dart
           │
           └── models/
                └── stock_model.dart
```

* **bloc/** → Contains all Bloc logic (events, states, business logic)
* **presentation/** → UI screens
* **models/** → Data models

project web app hosting url- https://amitjawalkote.github.io/trade_021_assignment/

github repo - https://github.com/AmitJawalkote/trade
Thanks for reviewing my submission 
