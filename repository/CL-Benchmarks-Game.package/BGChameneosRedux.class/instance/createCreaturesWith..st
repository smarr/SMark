instance creation
createCreaturesWith: aCollectionOfColours 
   | aName |
   aName := 0.
   ^aCollectionOfColours collect: 
         [:aColour | 
         aName := aName + 1.
         creatureFactory withName: aName colour: aColour]