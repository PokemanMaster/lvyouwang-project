package sdk

import "fmt"

// GeetestLibResult sdk lib包的返回结果信息。
type GeetestLibResult struct {
	Status int    // 表示结果的状态，通常用整数表示，例如 1 表示成功，0 表示失败。
	Data   string // 存储返回的具体数据，通常是字符串形式的 JSON 数据。
	Msg    string // 用于存储返回的消息或错误信息。
}

// NewGeetestLibResult 用于创建并返回一个新的 GeetestLibResult 对象，初始化时将字段设置为默认值。
func NewGeetestLibResult() *GeetestLibResult {
	return &GeetestLibResult{0, "", ""}
}

// 用于设置 GeetestLibResult 结构体的各个字段的值。
// 接受三个参数：status、data、msg，分别对应结果的状态、数据和消息。
func (g *GeetestLibResult) setAll(status int, data string, msg string) {
	g.Status = status
	g.Data = data
	g.Msg = msg
}

// 重写了 String 方法，返回一个格式化的字符串，方便输出结构体的内容。
// 使用 fmt.Sprintf 将结构体的字段值格式化为字符串。
func (g *GeetestLibResult) String() string {
	return fmt.Sprintf("GeetestLibResult{Status=%s, Data=%s, Msg=%s}", g.Status, g.Data, g.Msg)
}
