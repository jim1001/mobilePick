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
   local tPriorIndex, tChoice, tLabel
   put sChoiceIndex into tPriorIndex
   mobilePick sHelpOptsStr
   put the result into tChoice
   if tChoice = 0 then 
      put tPriorIndex into sChoiceIndex
   else
      put tChoice into sChoiceIndex
   end if
   put sHelpOptsArr[sChoiceIndex] into tLabel
   set the label of button "Option Menu" to tLabel
   answer "The video " && tLabel & ", Choice "  && sChoiceIndex & ", will now play"
end myMobilePick

-- playButton
-- 
-- Called by mouseUp event of button "Play"
-- Would expect menuHistory to agree with item no of label 
-- but can't rely on menuhistory in mobile environment
command playButton
    local tLabel
    put  the label of button "Option Menu" into tLabel
   answer "The video " && tLabel & ", Choice "  && sChoiceIndex & ", will now play"
end playButton
