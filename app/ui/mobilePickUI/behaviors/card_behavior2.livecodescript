script "card_behavior2"
local sHelpOptsArr, sHelpOptsStr

on preopencard
   put  "Take a photo" & return & "Write a response" & return & "Adjust the volume" into sHelpOptsStr
   put sHelpOptsStr into sHelpOptsArr //just for one line sHelpOptsArr is a string
   split sHelpOptsArr by return //now sHelpOptsArr is an array
   set the label of button "Option Menu" to sHelpOptsArr[1]
   set the label of button "Play" to "Play"
end preopencard

command myMobilePick
   mobilePick sHelpOptsStr
   set the label of button "Option Menu" to sHelpOptsArr[the result]
 end myMobilePick

 command playButton
    answer "The video " & the label of button "Option Menu" & " will now play"
 end playButton
