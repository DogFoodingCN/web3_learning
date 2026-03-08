package main

import (
	"context"
	"fmt"
	"log"
	"math/rand"
	"time"
)

func producer(ctx context.Context, id int, queue chan<- int) {
	defer log.Printf("producer %d exit", id)
	for {
		select {
		case <-ctx.Done():
			return
		default:
		}
		item := rand.Intn(1000)
		select {
		case queue <- item:
			log.Printf("producer %d -> %d", id, item)
		case <-ctx.Done():
			return
		}
		time.Sleep(300 * time.Millisecond)
	}
}

func consumer(ctx context.Context, id int, queue <-chan int) {
	defer log.Printf("consumer %d exit", id)
	for {
		select {
		case <-ctx.Done():
			return
		case item := <-queue:
			log.Printf("consumer %d <- %d", id, item)
		}
	}
}

func main() {
	rand.Seed(time.Now().UnixNano())

	queue := make(chan int, 10)
	ctx, cancel := context.WithCancel(context.Background())
	for i := 0; i < 2; i++ {
		go producer(ctx, i+1, queue)
	}
	for i := 0; i < 3; i++ {
		go consumer(ctx, i+1, queue)
	}
	time.Sleep(3 * time.Second)
	cancel()
	time.Sleep(500 * time.Millisecond)
	fmt.Println("done")
}
