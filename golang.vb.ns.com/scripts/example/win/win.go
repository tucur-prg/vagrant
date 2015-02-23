/**
 * コンパイル時に必要なパッケージ
 *
 * go get github.com/lxn/walk
 * go get github.com/akavel/rsrc
 *
 * マニフェストを作成したのちrsrcコマンドでsysoファイルを作成する
 *
 * rsrc -manifest win.manifest -o rsrc.syso
 *
 * Windows版ビルド
 * GOOS=windows GOARCH=amd64 go build -ldflags="-H windowsgui"
 */
package main

import (
    "github.com/lxn/walk"
    . "github.com/lxn/walk/declarative"
)

import (
    "fmt"
    "log"
    "strings"
)

func main() {
    mw := &MyMainWindow {}

    if _, err := (MainWindow {
        AssignTo: &mw.MainWindow,
        Title: "SearchBox",
        MinSize: Size {300, 400},
        Layout: VBox {},
        Children: []Widget {
            GroupBox {
                Layout: HBox {},
                Children: []Widget {
                    LineEdit {
                        AssignTo: &mw.searchBox,
                    },
                    PushButton {
                        Text: "検索",
                        OnClicked: mw.clicked,
                    },
                },
            },
            TextEdit {
                AssignTo: &mw.textArea,
            },
            ListBox {
                AssignTo: &mw.results,
                Row: 5,
            },
        },
    }.Run()); err != nil {
        log.Fatal(err)
    }
}

type MyMainWindow struct {
    *walk.MainWindow
    searchBox *walk.LineEdit
    textArea *walk.TextEdit
    results *walk.ListBox
}

func (mw *MyMainWindow) clicked() {
    word := mw.searchBox.Text()
    text := mw.textArea.Text()
    model := []string {}
    for _, i := range search(text, word) {
         model = append(model, fmt.Sprintf("%d文字目に発見", i))
    }
    log.Print(model)
    mw.results.SetModel(model)
}

func search(text ,word string) (result []int) {
    result = []int {}
    i := 0
    for j, _ := range text {
        if strings.HasPrefix(text[j:], word) {
            log.Print(i)
            result = append(result, i)
        }
        i += 1
    }
    return
}
