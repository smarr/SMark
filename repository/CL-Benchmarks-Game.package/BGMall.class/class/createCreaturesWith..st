initialize-release
createCreaturesWith: aCollectionOfColours 
   "Private"

   | aName |
   aName := 0.
   ^aCollectionOfColours collect: 
         [:aColour | 
         aName := aName + 1.
         BGCreature withName: aName colour: aColour]