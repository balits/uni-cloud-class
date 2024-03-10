package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"strings"

	"github.com/rs/cors"
)

var store map[string]string = make(map[string]string)

func main() {
	store["hello"] = "world"
	store["foo"] = "bar"

	mux := http.NewServeMux()

	mux.HandleFunc("GET /get/{key}", func(w http.ResponseWriter, r *http.Request) {
		key := r.PathValue("key")
		value, ok := store[key]

		if !ok {
			w.Header().Set("Content-Type", "application/json; charset=utf8")
			w.Header().Set("X-Content-Type-Options", "nosniff")
			w.WriteHeader(http.StatusNotFound)
			json.NewEncoder(w).Encode("Key not in store")
			return
		}

		var resp struct {
			K string `json:"key"`
			V string `json:"value"`
		}
		resp.K = key
		resp.V = value

		bytes, err := json.Marshal(resp)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		w.Write(bytes)
	})

	mux.HandleFunc("POST /set", func(w http.ResponseWriter, r *http.Request) {
		var kv map[string]string

		err := json.NewDecoder(r.Body).Decode(&kv)
		if err != nil {
			w.Header().Set("Content-Type", "application/json; charset=utf8")
			w.Header().Set("X-Content-Type-Options", "nosniff")
			w.WriteHeader(http.StatusBadRequest)
			json.NewEncoder(w).Encode(errors.New("Malformed body, should be { \"key\": \"value\" }"))
			return
		}
		fmt.Println("Body:\n", kv)
		var sb strings.Builder
		for k, v := range kv {
			store[k] = v
			sb.WriteString(fmt.Sprintf("%s = %s\n", k, v))
		}

		msg := sb.String()

		w.Write([]byte(msg))
	})

	handler := cors.Default().Handler(mux)
	http.ListenAndServe(":5000", handler)
}
