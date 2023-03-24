# Nygma

<div style="width: 100px; float:left; height:100px; background:yellow; margin:10px">
  <img src="https://imagedelivery.net/wyrwp3c-j0gDDUWgnE7lig/e8eaf0cd-09aa-4860-a767-480f984b4d00/public" width="250" alt="accessibility text">
</div>
<div style="width: 100px; float:left; height:100px; background:gray; margin:10px">
Use at your own risk!
  
[Demo](https://www.loom.com/share/4b8aafeb6616429ca943af7b3b9ccd4c)
</div>

## Introduction

This iOS/Android app will allow you to make a distributed and redundant backup of your nostr private key.

## How it works

### Backup

* Enter your nostr private key (nsec...), the app fetches your nostr contacts. 
* Choose as many contacts as you want (mininum of 2). For example: select 7 contacts.
* Click backup, now your private key is split in 7 pieces (using Shamir's Secret Sharing)
* On the next page, you must indicate how many of the pieces are needed to reconstruct your full private key. For example: 3.
* The app sends an encrypted DM to your 7 nostr contacts, each receive a piece of your private key

### Recovery

* Ask your 7 contacts for the piece they received.
* Tell the app how many pieces you received from your contacts, for example 4. If you have less than the minimum you indicated during backup, the recovery will fail.
* Enter the pieces (for example: 4)
* The private key is recontsructed, the app logs you in with the private key and shows your list of contacts.
* Swipe right to see you profile, where you have the ability to copy your private key.

## Getting Started

Download the latest apk from the github Releases page and install on your Android device!
iOS version is coming soon (tm)
