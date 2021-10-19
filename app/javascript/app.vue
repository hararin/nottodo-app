<template>
<div>
  <h1>NotToDoリスト</h1>
  <div>
    <router-view></router-view>
  </div>
</div>
</template>

<script>
import Vue from 'vue';
import VueRouter from 'vue-router'
import ListIndexPage from 'components/pages/ListIndexPage.vue'

const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: ListIndexPage
    }
  ]
})

Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
