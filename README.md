# Music From Reddit
![Logo](https://raw.githubusercontent.com/Gloumy/music-from-reddit/master/assets/images/logo.png)

Listen to music from a large list of music subreddits

## Screenshots

![Home Screen](https://raw.githubusercontent.com/Gloumy/music-from-reddit/master/assets/screens/home_screen.png)
![Subreddits Screen](https://raw.githubusercontent.com/Gloumy/music-from-reddit/master/assets/screens/subreddits_screen.png)
![Playing Screen](https://raw.githubusercontent.com/Gloumy/music-from-reddit/master/assets/screens/playing_screen.png)

## How to run

No additional configuration should be required, juste use `flutter run` or launch it via your IDE on an emulator or physical device.

## How does it work ?
1. Select your genre and then the subreddit you want to load from (Subreddits list copied from [r/music wiki](https://www.reddit.com/r/Music/wiki/musicsubreddits))
2. The threads are loaded as a json simply via the r/subreddit.json url and filtered if the post have a youtube link
3. The youtube id is passed to the plugin YoutubeExtractor to get the audio stream url
4. The audio stream is played with AudioPlayers plugin
5. The user can enjoy a selection of music content curated by fellow redditors !

## Current features
- [x] Retrieve content from subreddits
- [x] Play a single song (may not keep this one)
- [x] Play a list of songs 
- [x] Basic player controls (play/pause/stop/previous/next)
- [x] A proper and clean UI (at least to my linking it is !)

## Intended future features
- [ ] Select a random subreddit
- [ ] Random play
- [ ] Combine multiple subreddits
- [ ] A LOT of miscellaneous improvements

** Feel free to add constructive feedback and issues ! I'll try to keep working on it on my (somewhat limited) free time, and any help/contribution/ideas are very welcome !**