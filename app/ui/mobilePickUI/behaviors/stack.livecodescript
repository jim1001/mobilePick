script "stack_behavior"
on preOpenStack
   set the textFont of this stack to "Droid Sans"
   set the textSize of this stack  to 12
   set the text of field "version" of card "card1" to getVersion()
end preOpenStack

function getVersion
   local tVersionString
   put "Version: " into tVersionString
   put levureAppGet("version") after tVersionString
   put "-" & levureAppGet("build") after tVersionString
   return tVersionString
end getVersion
