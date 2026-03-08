package main

import "fmt"

type Account struct {
	owner   string
	balance float64
}

func NewAccount(owner string, initialBalance float64) *Account {
	return &Account{
		owner:   owner,
		balance: initialBalance,
	}
}

func (a *Account) Deposit(amount float64) {
	if amount <= 0 {
		fmt.Println("存款金额必须大于0")
		return
	}
	a.balance += amount
	fmt.Printf("成功存入：%.2f元\n", amount)
}

func (a *Account) Withdraw(amount float64) {
	if amount <= 0 {
		fmt.Println("取款金额必须大于0")
		return
	}
	if amount > a.balance {
		fmt.Println("账户余额不足，取款失败")
		return
	}
	a.balance -= amount
	fmt.Printf("成功取出：%.2f元\n", amount)
}

func (a *Account) GetBalance() float64 {
	return a.balance
}

func main() {
	// 创建账户并演示存取款操作
	account := NewAccount("张三", 1000.0)
	fmt.Printf("账户所有者: %s, 当前余额: %.2f元\n", account.owner, account.GetBalance())

	account.Deposit(500)
	fmt.Printf("当前余额: %.2f元\n", account.GetBalance())

	account.Withdraw(200)
	fmt.Printf("当前余额: %.2f元\n", account.GetBalance())

	account.Withdraw(2000) // 尝试超额取款
	fmt.Printf("当前余额: %.2f元\n", account.GetBalance())

	account.Deposit(-50)   // 错误的存款
	account.Withdraw(-100) // 错误的取款
}
