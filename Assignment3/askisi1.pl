add-end-diff-lists(Elem,DiffLIst, EndDiffList, NewDiffList, EndNewDiffList):-
	EndDiffList=[Elem|EndNewDiffList],
	NewDiffList=DiffLIst|Elem|EndNewDiffList.