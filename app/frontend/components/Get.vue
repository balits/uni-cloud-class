<script setup>
import { ref } from "vue";

const key = ref("");
const maybeValue = ref(null);

async function getValueByKey() {
  if (key.value == "" || !key || !key.value) return;
  try {
    let r = await fetch(`http://localhost:5000/get/${key.value}`);
    let data = await r.json();
    maybeValue.value = data;
  } catch (e) {
    console.log(e);
  }
}
</script>

<template>
  <div>
    <div>
      <label for="get">
        Enter a key to retrive a value
        <input required v-model="key" type="text" name="get" id="get" />
      </label>
      <button @click="getValueByKey">Go!</button>
      <pre v-if="maybeValue">
      {{ maybeValue }}
      </pre>
    </div>
  </div>
</template>
