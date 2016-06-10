var maxSequence = function(arr) {

  var max = sum(arr, 0, arr.length-1);

  var leftMax = max;
  var leftSum = 0;
  var maxLeftIndex = 0;
  var leftIndex = 1;
  while(leftIndex < arr.length) {
    leftSum = sum(arr, leftIndex, arr.length-1);
    if(leftMax < leftSum) {
      leftMax =leftSum;
      maxLeftIndex = leftIndex;
    }
    leftIndex++;
  }

  var rightIndex = arr.length -1;
  var rightMax = max;
  var rightSum = 0;
  var maxRightIndex = arr.length - 1;
  while(rightIndex > 0) {
    rightSum = sum(arr, 0, rightIndex);
    if(rightMax < rightSum) {
       rightMax = rightSum;
       maxRightIndex = rightIndex;
    }
    rightIndex--;
  }

  return sum(arr,maxLeftIndex, maxRightIndex);
}


function sum(arr, startIndex, endIndex) {
  var sum = 0;
  for(var i = startIndex; i <= endIndex; i++) {
    sum += arr[i];
  }
  return sum;
}

var result = maxSequence([]);
console.info(result);

result = maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]);
console.info(result);

result = maxSequence([1,2,3]);
console.info(result);

result = maxSequence([1,-2,3]);
console.info(result);
