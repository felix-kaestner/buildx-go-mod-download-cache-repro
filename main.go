package main

import (
	"net/http"

	"github.com/felix-kaestner/lungo"
)

func main() {
	app := lungo.New()

	// Simply print "Hello, World!"
	app.Get("/", func(c *lungo.Context) error {
		return c.Text(http.StatusOK, "Hello, World!")
	})

	app.Listen(":8080")
}
