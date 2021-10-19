<template>
  <div id="app">
    <div v-for="list in lists" :key="list.id">
      <p>{{ list.content }}</p>
      <p>{{ list.detail }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      lists: []
    }
  },
  mounted () {
    axios
      .get('api/lists.json')
      .then(response => (this.lists = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>