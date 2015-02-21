/**
 * 連想配列（マップ）
 */
package main

import "fmt"

func main() {
    m := map[string]int{"foo": 10, "bar": 20}

    fmt.Println(m)
    fmt.Println(len(m))
    fmt.Println(m["foo"])
    m["bar"] = 30
    fmt.Println(m)
    m["baz"] = 40
    fmt.Println(m)
    delete(m, "bar")
    fmt.Println(m)
}
