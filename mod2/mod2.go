package mod2

import (
	"fmt"
	"nothing.com/mod3"
)

func Message() {
	fmt.Println("Now in mod2")
	mod3.Message()
}
