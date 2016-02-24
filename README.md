# optimizely-ab-test
an app to demonstrate ab test


#Structure of the app
This is a very simple app with the main view of app being a tab view controller that shows two tabs - one that purportly shows email and the other a todo. The app also has an onboarding tutorial that is implemented as a page view control. The app looks at user defaults, specifically for the key - onboarding_seen. If it is set to false, the app starts the onboarding tutorial flow else the app takes the user straight to the tab view.

##Onboarding flow
The onboarding flow consists of 5 screens. Screen 3 is a decision point where the user is asked to input an email address. At any point the user can choose to skip the onboarding button

##A/B test  (planned)
- One test the headline for the first screen
- One test to test if we can navigate user directly to the tab view once the user inputs an email address on screen 3 or to continue with onboarding flow

### Future ones
- One test to show or hide the skip button itself 



