# Doodle
## Goal
- A mobile app that connects the body’s signals with creative expression. It uses a smartwatch to track heartbeat and turns that data into a live sound. While users draw or doodle, they can hear their own heartbeat and notice how their body and emotions change as they create. As the drawing continues, the heartbeat affects the rhythm of the movement, and the act of drawing can also calm or shift the heartbeat in return. It becomes a loop — body influencing mind, and mind influencing body.

- The main idea is to create awareness and a sense of presence. By turning inner sensations into sound and visual form, the app helps users notice what’s happening inside them in a gentle, creative way. Instead of trying to fix or measure emotions, it gives space to explore and express them through simple art making.

## Files
- ContentView: start logging & see previous logs
- MoodTrackerView: select mood from 5 (very unpleasant, unpleasant, neutral, pleasant, and very pleasant)
- MoodSelectView: select the feelings that describes the mood
- MoodEntry & MoodStore: JSON files
- MoodFlowSheet: MoodTrackerView + MoodSelectView --> sheet in ContentView
- MoodImpactView: select the impact of the feelings & mood (not there yet)

## Tasks
- mood tracking: saving data (chosen mood) in JSON --> done
- mood tracking: free journaling in JSON
- mood tracking: audio in JSON
- canvas drawing
- real-time monitoring heartbeat (simple app on Watch & firebase)
- (heartbeat animation: if I have time)

##Iterations
### 20251106
- Successfully figured out JSON with storing mood entry data. 
