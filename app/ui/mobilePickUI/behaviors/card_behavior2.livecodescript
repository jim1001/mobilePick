script "card_behavior2"
local sHelpOptsArr, sHelpOptsStr, sChoiceIndex

on preopencard
   put  "Take a photo" & return & "Write a response" & return & "Adjust the volume" into sHelpOptsStr
   put sHelpOptsStr into sHelpOptsArr //just for one line sHelpOptsArr is a string
   split sHelpOptsArr by return //now sHelpOptsArr is an array
   set the label of button "Option Menu" to sHelpOptsArr[1]
   put 1 into sChoiceIndex -- needed if Play pressed before any mobilePick
   set the label of button "Play" to "Play"
end preopencard

command myMobilePick
   mobilePick sHelpOptsStr
   put the result into sChoiceIndex
   set the menuHistory of button "Option Menu" to sChoiceIndex
   set the label of button "Option Menu" to sHelpOptsArr[sChoiceIndex]   -- setting menuHistory alone didn't work 
 end myMobilePick

 -- playButton
 -- 
 -- Called by mouseUp event of button "Play"
 --
command playButton
   local tLabel, tChoice
   
   #Would expect menuhistory to agree with item no of label.
   #However tChoice always = 1 no matter what was selected
   #So can't rely on menuhistory in mobile environment
   #put the menuhistory of button "Option Menu" into tChoice -- doesn't give expected
   put the menuHistory of button "Option Menu" into tChoice
   put  the label of button "Option Menu" into tLabel
   answer "Option menu index:" && tChoice && "Option menu label:" && tLabel
   
   
   #This worked with set the label... in myMobilePick
   --    put  the label of button "Option Menu" into tLabel
   answer "The video " && tLabel & ", Choice "  && sChoiceIndex & ", will now play"
end playButton
