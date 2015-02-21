/**
 * 変数、定数、演算
 */
package main

import "fmt"

// 定数
const EMAIL = "fuga@example.com"

// 連続した値を定義する
const (
    FOO = iota
    BAR
    BAZ
)

// 変数
var i int = 10
var f float64 = 1.234
var s string = "abc"

// 初期値が指定されている場合は型を省略可能
var (
    a, b = 10, 20
    c, d = 1.234, 5.678
)

func main() {
    fmt.Println("---- 定数 ----")
    fmt.Println(EMAIL)
    fmt.Println(FOO, BAR, BAZ)

    // 局所変数の定義
    // 利用していない変数がある場合はエラー「declared and not used」となる
    fmt.Println("---- 局所変数 ----")
    var ii = 100
    fmt.Println(ii)

    // 局所変数に限り下記の記述が可能
    fmt.Println("---- 多重代入 ----")
    aa, bb := 100, 200
    fmt.Println(aa)
    fmt.Println(bb)

    fmt.Println("---- calc ---")
    fmt.Println(i + 10)
    fmt.Println(i - 10)
    fmt.Println(a + b)
    fmt.Println(f * 2.5)
    fmt.Println(f / 3.2)
    fmt.Println(c * d)

    fmt.Println("---- string ----")
    fmt.Println(s + " def")
    // スライス
    fmt.Println(s[1:])
}
