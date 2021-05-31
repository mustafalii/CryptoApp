# CryptoApp: Market Data & Bitcoin Explorer

### Description
Just a fun little side project I worked on to get familiar with some of the public crypto APIs. I initially wanted to make a coinbase pro clone, however, that would've required me to set up a backend for security purposes. Due to time constraints, I decided to keep it simple.
There are two main pages: Market data & Bitcoin explorer.

Screenshots:
<br/>
<img src="/screenshots/ss1.png" width=200>    <img src="/screenshots/ss2.png" width=200>    <img src="/screenshots/ss3.png" width=200>
<br/>

For the market data UI, I took inspiration from coinbase pro's mobile app. The API that I used only provides information on BTC, LTC & ETH, hence only those are shown on the page.
For the bitcoin explorer, I looked at https://blockstream.info/ and tried to replicate a mobile version of that website. 
I am still working on the search feature for both pages. 

 
### Thoughts
  * You'll notice that I've commented out code that uses the coinbase pro websocket for market data. That websocket would be ideal for some kind of order book page; the constant flickering on the main page wouldn't look nice. From my observation on Coinbase pro's mobile app, it looks like the market data is updated every 5 seconds, so I had 2 ideas:
    - Use the cbp websocket & update information every 5 seconds instead of on every message received, or
    - Use the https://developer.bitaps.com/ API & GET on recurring preset intervals. I'm using this option for now, however the endpoints provide new information every 50 seconds instead of every 5 seconds.
  * I'm considering using flutter redux to save the latest fetched data for a seamless experience
  * Another idea is to experiment with a bitcoin wallet as the third main page

### Inspirations
  * Coinbase pro mobile app (iOS)
  * Bitcoin explorer: https://blockstream.info/
### APIs used
  * For market data: 
    - https://developer.bitaps.com/
    - https://docs.pro.coinbase.com/
  * For bitcoin explorer:
    - https://github.com/Blockstream/esplora/blob/master/API.md
  * Other APIs of interest:
    - https://coinmarketcap.com/
    - https://www.blockchain.com/api
### References:
  * For models: https://www.youtube.com/watch?v=Jji05a2GV_s

Note: This is still a work in progress. Next Steps:
  - Enhance the UI
  - Make the search bar an animated container with a cancel button showing next to it
  - Add logic for the search results page
  - Look into implementing a bitcoin wallet
