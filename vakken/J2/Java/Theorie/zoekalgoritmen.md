# Zoekalgoritmen

> Maven project van de [algoritmen](https://github.com/MrDanaT/Algorithms).
> Bij vragen stuur een DM naar Dana.

## Overzichtje

| naam                          | best-case | average-case | worst-case | voordeel                                         | nadeel                                     |
| ----------------------------- | --------- | ------------ | ---------- | ------------------------------------------------ | ------------------------------------------ |
| linear search (value present) | O(1)      | O(n)         | O(n)       | Kan op niet-gesorteerde lijsten toegepast worden | kan zeer traag zijn                        |
| linear search (value absent)  | O(n)      | O(n)         | O(n)       | ^                                                | ^                                          |
| binary search                 | O(1)      | O(log(n))    | O(log(n))  | Is zeer snel                                     | kan enkel op gesorteerde lijst             |
| binary search tree            | O(1)      | O(log(n))    | O(n)       | ^                                                | ^                                          |
| HashSearch                    | O(1)      | O(1)         | O(1)       | Snel                                             | Collissions kunnen voor vertraging zorgen. |

## Standaard algoritmen

### Linear Search met for-loop

```java
public int linearSearchMetForLoop(int[] array, int value) {
  int idx = -1;

  for (int i = 0; i < array.length; i++) {
      if (array[i] == value) {
          return i;
      }
  }

  return idx;
}
```

### Linear Search met while-loop

```java
public int linearSearchMetWhileLoop(int[] array, int value) {
        int idx = 0;
        boolean found = false;

        while (!found && idx < array.length) {
            if (array[idx] == value) {
                found = true;
            } else {
                idx++;
            }
        }

        if (found) {
            return idx;
        } else {
            return -1;
        }
    }
```

### Binary Search Tree

```java
public class Node{
  private int value;
  private Node left;
  private Node right;

  public Node(int value){
    this(value, null, null);
  }

  public Node(int value, Node left, Node right){
    this.value = value;
    this.left = left;
    this.right = right;
  }

  // Setters en getters.
  // ToString()
}
```

```java
public class BinaryTree{
  private Node root;

  public BinaryTree(){
    this(null);
  }

  public BinaryTree(Node root){
    this.root = root;
  }

  // setters en getters
  // search, add, remove methods
  // ToString()
}
```

## Linear Search met for-loop Optimized

```java
public int search(int[] array, int value) {
        int idx = -1;

        for (int i = 0; i < array.length; i++) {
            if (array[i] == value) {
                return i;
            }
            if (array[i] > value) {
                break;
            }
        }

        return idx;
    }
```

> Werkt dus enkel bij gesorteerde lijsten deze optimalisatie.

## Linear Search met while-loop Optimized

```java
public int search(int[] array, int value) {
        int idx = 0;
        boolean found = false;

        while (!found && idx < array.length && array[idx] <= value) {
            if (array[idx] == value) {
                found = true;
            } else {
                idx++;
            }
        }

        if (found) {
            return idx;
        } else {
            return -1;
        }
    }
```
