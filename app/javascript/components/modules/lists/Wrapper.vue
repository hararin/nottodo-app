<template>
  <div class="list-item-wrapper">
    <h3><slot></slot></h3>
    <div>
      <b-list-group>
        <b-list-group-item v-for="list in lists" :key="list.id" class="list-item">
          <detail :list="list"></detail>
        </b-list-group-item>
      </b-list-group>
    </div>
  </div>
</template>

<script>
import Detail from '../lists/Detail.vue'
export default {
  props: {
    lists: {}
  },
  components: {
    Detail
  }
}
</script>

<style scoped>
h3 {
  color: #2F4F4F;
  border-bottom: 2px solid #2F4F4F;
}
.list-item-wrapper {
  margin-top: 20px;
  margin: 0 auto;
  width: 80%;
  max-width: 600px;
}
.list-item {
  background-color: #f8f8f8;
  color: #333;
}
</style>