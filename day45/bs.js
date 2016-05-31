function shiftedDiff(first,second){
  for(var i=0; i< first.length; i++) {
    for(var j=1; j<= i; j++) {
      r = seconde.indexOf(first.substring(i, j))
      if(r === -1) {
         return r;
      }
    }
  }
}

shiftedDiff("eecoff","coffee")
