/**
 * 条件分岐
 */
package main

import "fmt"

func main() {
    i := 1

    // if
    fmt.Println("---- if ----")

    if i == 0 {
        fmt.Println("zero")
    } else if i == 1 {
        fmt.Println("one")
    } else {
        fmt.Println("not zero")
    }

    // ifの条件式の前に処理を記載することが可能です
    // ifの中だけで利用する局所変数を定義するのに便利です。
    if s := "blue"; s == "blue" {
        fmt.Println("GOOD")
    } else {
        fmt.Println("BAD")
    }

    // switch
    fmt.Println("---- switch ----")

    color := "blue"
    switch color {
        case "red":
            fmt.Println(300)
        case "blue", "green":
            fmt.Println(200)
        case "yellow":
            fmt.Println(100)
        default:
            fmt.Println(0)
    }
}
