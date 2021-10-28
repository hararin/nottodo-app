<template>
  <transition name="fade">
  　<div class="message" v-if="message">
      <p class="alert alert-success">{{ message }}</p>
    </div>
  </transition>
</template>

<script>
export default {
  props: {
    message: ''
  },
  data() {
    message: null
  }
}
</script>

<style>
  
</style>