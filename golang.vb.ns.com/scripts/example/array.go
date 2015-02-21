/**
 * 配列
 */
package main

import "fmt"

func main () {
    fmt.Println("---- array ----")
    a := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}
    aa := [][]int{
        {1,2,3},
        {4,5,6},
        {7,8,9},
    }

    fmt.Println(a)
    fmt.Println(aa)
    fmt.Println(len(a))
    fmt.Println(a[0])
    a[1] = 10
    fmt.Println(a)

    fmt.Println("---- slice ----")
    fmt.Println(a[:])
    fmt.Println(a[2:5])
    fmt.Println(a[4:])
    fmt.Println(a[:8])

    // 配列の最後に値を追加
    a = append(a, 50)
    fmt.Println(a)
}
