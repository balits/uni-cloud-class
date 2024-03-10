import type { stringifyQuery } from 'vue-router';
<script setup>
import { ref } from "vue";

const key = ref("");
const value = ref("");

async function setKV() {
  if (key.value == "" || value.value == "") return;
  try {
    let r = await fetch("http://localhost:5000/set", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ [key.value]: value.value }),
    });
  } catch (e) {
    console.log(e);
  }
}
</script>

<template>
  <div>
    <div>
      <label for="key">
        Key
        <input required v-model="key" type="text" name="key" id="key" />
      </label>

      <label for="get">
        Value
        <input required v-model="value" type="text" name="get" id="get" />
      </label>
      <button @click="setKV">Go!</button>
    </div>
  </div>
</template>
