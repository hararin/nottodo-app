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
import VueRouter from 'vue-router';
import VueCarousel from 'vue-carousel';
import ListIndexPage from 'components/pages/ListIndexPage.vue';

const router = new VueRouter({
  routes: [
    {
      path: '/',
      name: "ListIndexPage",
      component: ListIndexPage,
    }
  ]
})

Vue.use(VueRouter);
Vue.use(VueCarousel);


export default {
  router
}
</script>

<style scoped>
h1 {
  margin: 20px;
}
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
