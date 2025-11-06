# Mood Tracker
## Goal
- An app to log mood with 5 states: very unpleasant, unpleasant, neutral, pleasant, and very pleasant. Then select the specific emotion based on each mood.
    - Ex. Select neutral --> seleect indifferent & calm & drained
- Store the mood entry data into JSON

## Files
- ContentView: start logging & see previous logs
- MoodTrackerView: select mood from 5 (very unpleasant, unpleasant, neutral, pleasant, and very pleasant)
- MoodSelectView: select the feelings that describes the mood
- MoodEntry & MoodStore: JSON files
- MoodImpactView: select the impact of the feelings & mood (not there yet)

## Problems
- Had problems going back to the navigation root (ContentView) after clicking Done in MoodSelectView. I tried "dismiss", but it only navigates to the previous view. 
    - Fix: used sheet(isPresented:onDismiss:content:) --> Presents a sheet when a binding to a Boolean value that you provide is true.
- Had problems showing the time when the MoodEntry is stored in ContentView. 
    - Fix: realized it was the printing problem. Nothing wrong with JSON.

## Question
- AI told me to use Foundation for JSON, which is different from the sample code using @Observable class Document, @Environment to share data model, and struct Model. What are the differences? 

## Next
- Need to understand JSON more. 
