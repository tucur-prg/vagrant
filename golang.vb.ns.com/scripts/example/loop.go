/**
 * 繰り返し処理
 */
package main

import "fmt"

func main() {
    fmt.Println("---- for ----")
    /**
     * break:    ループを抜ける
     * continue: ループを一回スキップ
     */
    for i := 1; i <= 10; i++ {
        if i < 3 {
            continue
        } else if i == 8 {
            break
        }

        fmt.Println(i, "hello world")
    }

    // 配列ループ
    a := []int{1, 2, 3, 4, 5}
    for i, v := range a {
        fmt.Println(i, v)
    }
    // マップループ
    m := map[string]int{"foo": 10, "bar": 20, "baz": 30}
    for k, v := range m {
        fmt.Println(k, v)
    }
}
