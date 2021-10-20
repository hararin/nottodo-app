<template>
<div>
  <h1>"NOT"ToDo-App</h1>
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
      name: "ListIndexPage",
      component: ListIndexPage,
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

h1{
  text-align: center;
  color: #2F4F4F;
  font-weight: bolder;
}
</style>
