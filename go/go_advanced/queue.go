package main

import (
	"fmt"
	"time"
)

func main() {
	ch := make(chan int, 5)

	go producer(ch)

	// 多个消费者
	for i := 0; i < 3; i++ {
		go consumer(ch, i)
	}

	time.Sleep(2 * time.Second)
}

func consumer(ch chan int, id int) {
	for value := range ch {
		fmt.Printf("Consumer %d received: %d\n", id, value)
		time.Sleep(500 * time.Millisecond)
	}
}

func producer(ch chan int) {
	for i := 0; i < 10; i++ {
		ch <- i
		time.Sleep(100 * time.Millisecond)
	}
	close(ch)
}
