

// Turning permutation to anagram using recursive backtracker

bool IsAnagram(string sofar, string rest, lexicon &lex){
   if(rest == ""){
	return lex.containsWord(sofar);
 } else {
     for(int i = 0;i < rest.length();i++){
	if(IsAnagram(sofar.rest[i],rest.substr(0,i)+rest.substr(i+1), lex)
        	return true;
       }	
    }
  return false;
}
