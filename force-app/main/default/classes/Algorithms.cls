//Adding description new
public class Algorithms{

//O(n) complexity
public static Integer rotationPointSorted1(List<Integer> lstInteger){
  Integer lstSize = lstInteger.size();
  Integer index = 0 ;
  for(Integer i = 1 ; i< lstSize ; i++){
     //since list is sorted element on right will be always greater than the current one
     //so rotation point will be a point where current element has an element on the right that is lesser 
     if(lstInteger[i-1] > lstInteger[i]){
        index = i;
        break;
     }
  }
  return index;  
}

//O(logN) complexity
public static Integer rotationPointSorted2(List<Integer> lstInteger){
  Integer lstSize = lstInteger.size();
  Integer startIndex = 0;
  Integer endIndex = lstSize - 1;
  Integer midIndex = startIndex  + (endIndex - startIndex )/ 2;
  Integer lastElement = lstInteger[lstSize - 1];
  while (startIndex  <= endIndex) {
        //If middle elemt is greater than the last element
        if (lstInteger[midIndex] > lastElement) { //check to left of mid
            //change startIndex to one after the midIndex //for list with 7 elements startIndex = 3 and endIndex = 6
            startIndex = midIndex + 1;
        } //If middle elemt is lesser than the last element 
        else if (lstInteger[midIndex] < lastElement) { //check to rght of mid
          //change endIndex to one before the midIndex //for list with 7 elements startIndex = 0 and endIndex = 2
            endIndex = midIndex - 1;
        } else
            break;
        midIndex = startIndex + (endIndex - startIndex) / 2; // exact rotation point
    }
  return midIndex;
}

//O(N) complexity
public static Integer lastOccurence(List<Integer> lstInteger, Integer searchElement){
  Integer lstSize = lstInteger.size();
  Integer index = -1;
  for(Integer i = 0 ; i < lstSize ; i++){
     if(lstInteger[i] == searchElement){
        index = i;
     }
  }
  return index ;
}
//O(N) complexity
//Given a List of N number a1,a2,a3........an, 
//You have to find smallest number from the List that is repeated in the List exactly K number of times.
public static Integer smallestNumberKOccurence(List<Integer> lstInteger, Integer k){
  Integer lstSize = lstInteger.size();
  Integer minimum = lstInteger[0];
  Map<Integer,Integer> mapElementOccurence = new Map<Integer,Integer>();
  for(Integer i = 0 ; i<lstSize ;i++){
     if(mapElementOccurence.containsKey(lstInteger[i])){
         mapElementOccurence.put(lstInteger[i],mapElementOccurence.get(lstInteger[i])+1);
     }
     else{
        mapElementOccurence.put(lstInteger[i],1);
     }
  }
  Integer value = 0 ;
  for(Integer i = 0 ; i<lstSize ;i++){
      if(lstInteger[i] < minimum ){
         minimum = lstInteger[i];
         if(mapElementOccurence.get(minimum) == k){
           value = minimum;
           break;
         }
      }
  }
  return value  ;
}

public static List<Integer> insertionSortDescending(List<Integer> lstInteger){
  Integer lstSize = lstInteger.size();
  for(Integer i =1; i<lstSize;i++ ){
      Integer currentValue = lstInteger[i];
      Integer movingIndex = i;
      while (movingIndex> 0 && currentValue > lstInteger[movingIndex - 1]){
         lstInteger[movingIndex] = lstInteger[movingIndex - 1];
         movingIndex --;
      }
      lstInteger[movingIndex] = currentValue ;
  }
  return lstInteger;
}

public static List<Integer> inverseArray(List<Integer> lstInteger){
  Integer lstSize = lstInteger.size();
  List<Integer> lstInverse = new Integer[lstSize];
  for(Integer i = 0; i<lstSize;i++ ){
      lstInverse[i] = lstInteger[lstSize- (i+1)];
      
  }
  return lstInverse;
}

//Time Complexity: O(n^2)
public static Integer bubbleSortNoOfSwaps(List<Integer> A){
  Integer counter = 0 ;
  Integer lstSize = A.size();
  for(Integer i = 0 ; i< lstSize-1 ; i++){
     for(Integer j = 0 ; j< lstSize - i - 1; j++ ){
         if(A[j] > A[j+1]){
            counter ++;
         }
     }
  }
  return counter;
}
//Time Complexity: O(n^2)
public static List<Integer> selectionSort(List<Integer> A){
  Integer minimumPosition;
  Integer temp;
  Integer lstSize = A.size();
  for(Integer i = 0 ; i< lstSize; i++){
     minimumPosition = i;
     for(Integer j = i+1 ; j< lstSize; j++ ){
         if(A[j] > A[minimumPosition]){
            minimumPosition = j;
         }
     }
     temp = A[i];
     A[i] = A[minimumPosition];
     A[minimumPosition] = temp;
     
  }
  return A;
}
//Time Complexity: O(n^2)
//You are given an array a, size of the array N and an integer x.
//Follow the above algorithm and print the state of the array after x iterations have been performed.
public static List<Integer> selectionSort(List<Integer> A, Integer x){
  Integer minimumPosition;
  Integer temp;
  Integer lstSize = A.size();
  Integer noOfComparisions = 0 ;
  for(Integer i = 0 ; i< lstSize; i++){
     minimumPosition = i;
     for(Integer j = i+1 ; j< lstSize; j++ ){
         if(A[j] > A[minimumPosition]){
            minimumPosition = j;
            noOfComparisions ++;
         }
     }
     temp = A[i];
     A[i] = A[minimumPosition];
     A[minimumPosition] = temp;
     if(noOfComparisions == x) break;
  }
  return A;
}
//Time Complexity: O(n^2)
public static List<Integer> insertionSort(List<Integer> A){
  Integer currentIndex;
  Integer currentElement;
  Integer lstSize = A.size();
  for(Integer i = 0 ; i< lstSize; i++){
     currentElement =  A[i];
     currentIndex = i;
     while(currentIndex > 0 && currentElement < A[currentIndex - 1]){
       A [currentIndex] = A [currentIndex - 1];
       currentIndex --;
     }
     A[currentIndex] = currentElement;
  }
  return A;
}

//Time Complexity: O(n^2)
public static List<Integer> test(List<Integer> A){
  Map<Set<Id>,Boolean> mapfff = new Map<Set<Id>,Boolean>();
  return A;
}
}