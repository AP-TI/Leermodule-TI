# Sorteeralgoritmen

> Maven project van de [algoritmen](Algoritmen.zip).
> Bij vragen stuur een DM naar Dana.

## Overzichtje

| naam          | stabiel? | in-place? | best-case    | average-case | worst-case   | geheugengebruik | efficiënt?                     | complexiteit constant? |
| ------------- | -------- | --------- | ------------ | ------------ | ------------ | --------------- | ------------------------------ | ---------------------- |
| Bubblesort    | True     | True      | O(n)         | O(n²)        | O(n²)        | O(1)            | False                          | False                  |
| Selectionsort | False    | True      | O(n²)        | O(n²)        | O(n²)        | O(1)            | Beter dan bubblesort alleszins | True                   |
| Insertionsort | True     | True      | O(n)         | O(n²)        | O(n²)        | O(1)            | True                           | False                  |
| Quicksort     | False    | True      | O(n\*log(n)) | O(n\*log(n)) | O(n²)        | O(log(n))       | True                           | False                  |
| Mergesort     | True     | False     | O(n\*log(n)) | O(n\*log(n)) | O(n\*log(n)) | O(n)            | True                           | True                   |

> Little note: alle geheugengebruik <= O(log(n)) is In-place.

```java
    // SWAP
public void swap(int[] arr, int i, int j){
    int tmp = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
}
```

## Standaard algoritmen

### Bubblesort

[Video](https://youtu.be/KreRJBsZkaI)
```java
for (int i = 0; i < array.length; i++) {
    for (int j = 1; j < array.length - i; j++) {
        if (array[j - 1] > array[j]) {
            swap(array, j - 1, j);
        }
    }
}
```

### Selectionsort

[Video](https://youtu.be/Gp-t_eGc1ec)
```java
int min;
for(int i = 0; i < arr.length; i++) {
    min = i;
    for(int j = i +1; j < arr[i].length; j++) {
        if (arr[j] < arr[min])
            min = j;
  }

  swap(arr, i, min);
}
```

### Insertionsort

[Video](https://youtu.be/pJouYrHd5Xc)
```java
public void sort(int[] array) {
    for (int i = 1; i < 10; i++) {
        for (int j = i; j > 0; j--) {
            if (array[j] < array[j - 1]) {
                swap(array, j, j - 1);
            }
        }
    }
}
```

### Quicksort algoritme

```java
    public void sort(int[] array) {
        quicksort(array, 0, array.length - 1);
    }

    public void quicksort(int[] arr, int lo, int hi) {
        int pivot = lo + (hi - lo) / 2;
        int i = lo, j = hi;

        while (i <= j) {
            while (arr[i] < arr[pivot]) {
                i++;
            }
            while (arr[j] > arr[pivot]) {
                j--;
            }

            if (i <= j) {
                swap(arr, i, j);
                j--;
                i++;
            }
        }

        if (i < hi) {
            quicksort(arr, i, hi);
        }
        if (j > lo) {
            quicksort(arr, lo, j);
        }
    }
```

### Mergesort

```java
public void mergesort(int[] arr) {
        if (arr.length <= 1) {
            return;
        }

        int mid = arr.length/ 2;

        int[] arr1 = Arrays.copyOf(arr, mid);
        int[] arr2 = Arrays.copyOfRange(arr, mid, arr.length);

        mergesort(arr1);
        mergesort(arr2);

        merge(arr, arr1, arr2);
    }

    public void merge(int[] arr, int[] arr1, int[] arr2) {
        int cResult, c1, c2;
        cResult = c1 = c2 = 0;

        while (c1 < arr1.length && c2 < arr2.length) {
            if (arr1[c1] <= arr2[c2]) {
                arr[cResult] = arr1[c1++];
            } else {
                arr[cResult] = arr2[c2++];
            }
            cResult++;
        }

        while (c1 < arr1.length) {
            arr[cResult] = arr1[c1++];
            cResult++;
        }
        while (c2 < arr2.length) {
            arr[cResult] = arr2[c2++];
            cResult++;
        }
    }
```

## Geoptimaliseerde algoritmen

### Geoptimaliseerde bubblesort

```java
public void sort(int[] array) {
    boolean swapped;
    for (int i = 0; i < array.length; i++) {
        swapped = true;
        for (int j = 1; j < array.length - i; j++) {
            if (array[j] < array[j - 1]) {
                swap(array, j, j - 1);
                swapped = false;
            }
        }

        if (swapped) {
            break;
        }
    }
}
```

### Geoptimaliseerde quicksort

```java
public void quicksort(int[] arr, int lo, int hi) {
    if (hi - lo <= 5) {
        insertion(arr, lo, hi);
    } else {

        int pivot = lo + (hi - lo) / 2;
        int i = lo, j = hi;

        while (i <= j) {
            while (arr[i] < arr[pivot]) {
                i++;
            }
            while (arr[j] > arr[pivot]) {
                j--;
            }

            if (i <= j) {
                swap(arr, i, j);
                j--;
                i++;
            }
        }

        if (i < hi) {
            quicksort(arr, i, hi);
        }
        if (j > lo) {
             quicksort(arr, lo, j);
        }
    }
}

public void insertion(int[] arr, int start, int end){
    for (int i = start; i < end; i++) {
        for (int j = i; j > start; j--) {
            if (arr[j] > arr[j - 1]) {
                swap(arr, j, j - 1);
            }
        }
    }
}
```
